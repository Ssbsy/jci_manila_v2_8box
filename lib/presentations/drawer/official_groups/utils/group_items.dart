import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/constants/official_group_joined_notifier.dart'
    as OfficialGroupJoinedNotifier;
import 'package:jci_manila_v2/core/models/group.dart';

class GroupItems extends StatelessWidget {
  final Group group;

  const GroupItems({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Palette.neutralGray),
        ),
        child: Row(
          children: [
            Images.officialGroupPhoto,
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetText(title: group.name, isBold: true, size: 16),
                  WidgetText(title: group.description),
                  const Gap(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.group,
                        color: Colors.blueAccent,
                        size: 15,
                      ),
                      const Gap(5),
                      WidgetText(
                        title: '${group.members} Members',
                        color: Colors.blueAccent,
                        size: 10,
                      ),
                      const Gap(10),
                      OfficialGroupJoinedNotifier.isJoined
                          ? const SizedBox.shrink()
                          : WidgetText(
                            title: 'Joined',
                            color: Colors.blueAccent,
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
