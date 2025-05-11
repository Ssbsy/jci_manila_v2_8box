import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_detail.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/my_event_detail.dart';

class EventModel {
  final int id;
  final String title;
  final String description;
  final String location;
  final String dateTime;
  final String imagePath;
  final int? registrants;
  final bool isMyEvent;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.dateTime,
    required this.imagePath,
    this.registrants,
    this.isMyEvent = false,
  });
}

class EventContent extends StatelessWidget {
  final EventModel event;

  const EventContent({super.key, required this.event});

  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  String _sanitizeUrl(String url) {
    // Fixes "/files/../" to just "/"
    return url.replaceAll('/files/../', '/');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    _isNetworkImage(event.imagePath)
                        ? Image.network(
                          _sanitizeUrl(event.imagePath),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorBuilder:
                              (_, __, ___) => Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.broken_image, size: 40),
                              ),
                        )
                        : Image.asset(
                          event.imagePath,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
              ),
              const Gap(12),

              // Title
              WidgetText(
                title: event.title,
                size: 16,
                isBold: true,
                maxLine: 2,
              ),
              const Gap(6),

              // Description
              WidgetText(
                title: event.description,
                size: 13,
                color: Colors.grey,
                maxLine: 2,
              ),
              const Gap(10),

              // Location
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Palette.accentBlue,
                    size: 18,
                  ),
                  const Gap(6),
                  WidgetText(title: event.location, size: 13),
                ],
              ),
              const Gap(6),

              // Date
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Palette.accentBlue,
                    size: 16,
                  ),
                  const Gap(6),
                  WidgetText(title: event.dateTime, size: 13),
                ],
              ),
              const Gap(10),

              // Registrants (My Events only)
              if (event.isMyEvent && event.registrants != null) ...[
                const Gap(6),
                Row(
                  children: [
                    const Icon(
                      Icons.groups,
                      size: 18,
                      color: Palette.accentBlue,
                    ),
                    const Gap(6),
                    WidgetText(
                      title: "${event.registrants} Registrants",
                      size: 13,
                      color: Palette.accentBlue,
                    ),
                  ],
                ),
              ],
              const Gap(14),

              // Button
              SizedBox(
                width: double.infinity,
                child:
                    event.isMyEvent
                        ? OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => MyEventDetail(eventId: event.id),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(color: Palette.accentBlue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const WidgetText(
                            title: "View Event",
                            size: 14,
                            isBold: true,
                            color: Palette.accentBlue,
                          ),
                        )
                        : ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EventDetail(eventId: event.id),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.accentBlue,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const WidgetText(
                            title: "Register",
                            size: 14,
                            isBold: true,
                            color: Colors.white,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
