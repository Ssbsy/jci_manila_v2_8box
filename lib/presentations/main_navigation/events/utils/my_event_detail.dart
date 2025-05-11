import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';

class MyEventDetail extends StatefulWidget {
  final int eventId;

  const MyEventDetail({super.key, required this.eventId});

  @override
  State<MyEventDetail> createState() => _MyEventDetailState();
}

class _MyEventDetailState extends State<MyEventDetail> {
  Map<String, dynamic>? eventData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEventDetails();
  }

  Future<void> fetchEventDetails() async {
    final api = BaseApiServices();
    final endpoint = 'v2.2/events/${widget.eventId}';
    try {
      final headers = await api.getHeaders();
      final response = await http.get(
        Uri.parse('${api.baseUrl}$endpoint'),
        headers: headers,
      );
      debugPrint("Event Detail Response: ${response.body}");
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        setState(() {
          eventData = decoded['data'];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      debugPrint('Error fetching event detail: $e');
      setState(() => isLoading = false);
    }
  }

  String _formatDateTime(
    String? startDateStr,
    String? endDateStr,
    String? timeStr,
  ) {
    if (startDateStr == null || startDateStr.isEmpty) return '';
    final start = DateTime.tryParse(startDateStr);
    final end = endDateStr != null ? DateTime.tryParse(endDateStr) : null;

    if (start == null) return startDateStr;

    final formattedStart = "${_monthName(start.month)} ${start.day}";
    final formattedEnd =
        end != null && (end.day != start.day || end.month != start.month)
            ? "–${end.day}, ${end.year}"
            : ", ${start.year}";

    final formattedTime = _formatTime(timeStr);

    return "$formattedStart$formattedEnd$formattedTime";
  }

  String _formatTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return '';
    try {
      final parts = timeStr.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      final period = hour >= 12 ? 'PM' : 'AM';
      final hour12 = hour % 12 == 0 ? 12 : hour % 12;

      return " | $hour12:${minute.toString().padLeft(2, '0')} $period";
    } catch (_) {
      return '';
    }
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.gradientStart,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const WidgetText(
          title: "Event Detail",
          color: Colors.white,
          size: 20,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : eventData == null
              ? const Center(child: Text('Event not found.'))
              : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        eventData!['banner_picture'] ?? '',
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) => const Icon(Icons.broken_image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          WidgetText(
                            title: eventData!['title'] ?? '',
                            isBold: true,
                            size: 20,
                            maxLine: 2,
                          ),
                          const Gap(6),
                          const WidgetText(
                            title: "On Going Registration",
                            color: Palette.accentBlue,
                            isBold: true,
                            size: 16,
                          ),
                          const Gap(20),
                          WidgetText(
                            title: _stripHtml(eventData!['description'] ?? ''),
                            size: 15,
                            maxLine: 10,
                          ),
                          const Gap(30),
                          const WidgetText(
                            title: "Event Details",
                            isBold: true,
                            size: 18,
                          ),
                          const Gap(14),
                          _DetailRow(
                            icon: Icons.person,
                            text: eventData!['chairman']?.toString() ?? 'TBD',
                            isBold: true,
                          ),

                          const Gap(12),
                          _DetailRow(
                            icon: Icons.calendar_today,
                            text: _formatDateTime(
                              eventData!['date'],
                              eventData!['end_date'],
                              eventData!['time'],
                            ),
                            maxLine: 2,
                          ),

                          const Gap(12),
                          _DetailRow(
                            icon: Icons.location_on,
                            text: eventData!['address'] ?? 'TBD',
                          ),
                          const Gap(12),
                          _DetailRow(
                            icon: Icons.money,
                            text: '₱ ${eventData!['fee'] ?? '0.00'}',
                            isBold: true,
                          ),
                          const Gap(40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isBold;
  final int maxLine;

  const _DetailRow({
    required this.icon,
    required this.text,
    this.isBold = false,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: Colors.black),
        const Gap(10),
        Expanded(
          child: WidgetText(
            title: text,
            size: 15,
            isBold: isBold,
            maxLine: maxLine,
          ),
        ),
      ],
    );
  }
}
