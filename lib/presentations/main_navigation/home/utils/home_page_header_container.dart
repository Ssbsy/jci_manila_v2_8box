import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/profile_provider.dart';
import 'package:jci_manila_v2/presentations/main_navigation/home/const/assets.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePageHeaderContainer extends StatelessWidget {
  const HomePageHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);

    if (profile.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (profile.firstName == null || profile.membershipID == null) {
      return const Center(child: Text('Error loading profile.'));
    }

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5,
                children: [
                  const Text(
                    'Hi,',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  WidgetText(
                    title: profile.firstName ?? '',
                    size: 18,
                    color: const Color(0xFFE9A101),
                    isBold: true,
                  ),
                ],
              ),
              WidgetText(title: profile.membershipID ?? ''),
              const Gap(5),
              Row(
                spacing: 5,
                children: [
                  _logo(Assets.jciBlackLogo, Colors.amber),
                  _logo(
                    const Icon(
                      Icons.verified_user,
                      color: Colors.white,
                      size: 15,
                    ),
                    Colors.lightGreen,
                  ),
                ],
              ),
            ],
          ),
          QrImageView(
            data: profile.membershipID ?? '1234567890',
            version: QrVersions.auto,
            size: 100.0,
          ),
        ],
      ),
    );
  }

  Container _logo(Widget asset, Color color, {Icon? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: asset ?? icon ?? const SizedBox.shrink(),
    );
  }
}
