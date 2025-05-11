import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_registration.dart';

class EventDetail extends StatefulWidget {
  final int eventId;

  const EventDetail({super.key, required this.eventId});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
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

  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  String _formatDateTime(
    String? startDateStr,
    String? endDateStr,
    String? timeStr,
  ) {
    if (startDateStr == null || startDateStr.isEmpty) return '';

    final startDate = DateTime.tryParse(startDateStr);
    final endDate = endDateStr != null ? DateTime.tryParse(endDateStr) : null;

    if (startDate == null) return '';

    final formattedStart = "${_monthName(startDate.month)} ${startDate.day}";
    final formattedEnd =
        endDate != null
            ? endDate.day != startDate.day
                ? "-${endDate.day}"
                : ""
            : "";
    final formattedYear = ", ${startDate.year}";
    final formattedTime =
        timeStr != null && timeStr.isNotEmpty
            ? " | ${_formatTime(timeStr)}"
            : "";

    return "$formattedStart$formattedEnd$formattedYear$formattedTime";
  }

  String _formatTime(String timeStr) {
    try {
      final timeParts = timeStr.split(":");
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);

      final time = TimeOfDay(hour: hour, minute: minute);
      final hour12 = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
      final period = time.period == DayPeriod.am ? 'AM' : 'PM';

      return "$hour12:${time.minute.toString().padLeft(2, '0')} $period";
    } catch (_) {
      return timeStr;
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
                        eventData!['banner_picture']?.toString().replaceAll(
                              '/../',
                              '/',
                            ) ??
                            '',
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
                            maxLine: 8,
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
                            text: eventData!['address'] ?? 'No location',
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
      bottomNavigationBar:
          eventData == null
              ? null
              : Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EventRegistration(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.accentBlue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const WidgetText(
                      title: "Register",
                      color: Colors.white,
                      isBold: true,
                      size: 16,
                    ),
                  ),
                ),
              ),
    );
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
