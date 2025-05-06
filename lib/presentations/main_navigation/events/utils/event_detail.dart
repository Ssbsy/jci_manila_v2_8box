import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/main_navigation/events/utils/event_registration.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full width image without padding
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset("assets/images/event.png", fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  const WidgetText(
                    title: "Asia Pacific Conference - Mongolia, Ulaanbaatar",
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
                  const WidgetText(
                    title:
                        "Join us for an exciting onto in this year's JCI Asia Pacific Conference to be held at Ulaanbataar Mongolia!",
                    size: 15,
                    maxLine: 3,
                  ),
                  const Gap(20),
                  const WidgetText(
                    title:
                        "Meet and greet new and familiar faces! Enjoy the beauty of Mongolia and be part of JCI Manila's promotional effort leading towards hosting JCI World Convention next year.",
                    size: 15,
                    maxLine: 4,
                  ),
                  const Gap(30),
                  const WidgetText(title: "Twin room 37500", size: 15),
                  const WidgetText(title: "Solo room 57500", size: 15),
                  const Gap(30),
                  const WidgetText(
                    title:
                        "Contact me (09209643141) or John David Roque (09175931414) for details.",
                    size: 15,
                    maxLine: 2,
                  ),
                  const Gap(40),
                  const WidgetText(
                    title: "Event Details",
                    isBold: true,
                    size: 18,
                  ),
                  const Gap(14),

                  const _DetailRow(
                    icon: Icons.person,
                    text: "Michael Richmond Fangre",
                    isBold: true,
                  ),
                  const Gap(12),

                  const _DetailRow(
                    icon: Icons.calendar_today,
                    text: "Jun 11, 2025 - Jun 16, 2025\n7:40 AM",
                    maxLine: 2,
                  ),
                  const Gap(12),

                  const _DetailRow(
                    icon: Icons.location_on,
                    text: "Ulaanbaatar, Mongolia",
                  ),
                  const Gap(12),

                  const _DetailRow(
                    icon: Icons.checkroom,
                    text: "Casual, Formal",
                  ),
                  const Gap(12),

                  const _DetailRow(
                    icon: Icons.money,
                    text: "\u20B1 1,800.00",
                    isBold: true,
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EventRegistration()),
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
