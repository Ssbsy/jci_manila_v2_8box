import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/constants/official_group_joined_notifier.dart'
    as OfficialGroupJoinedNotifier;
import 'package:jci_manila_v2/core/models/group.dart';

class GroupDetailsScreen extends StatefulWidget {
  final Group group;
  const GroupDetailsScreen({super.key, required this.group});

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Images.officialGroupBasketballPhoto,
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  WidgetText(
                    title: 'Basketball Group One',
                    isBold: true,
                    size: 20,
                  ),
                  Gap(10),
                  WidgetText(
                    title:
                        "Basketball Group One is a community of basketball enthusiasts who share a passion for playing, watching, and discussing the game. The group connects players of all skill levels for friendly matches, training, and regular basketball-related conversations.",
                    maxLine: 10,
                    size: 14,
                  ),
                  Gap(20),
                  WidgetText(
                    title: 'Group Creator',
                    size: 14,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Gap(5),
                  WidgetText(
                    title: 'Christopher Lesch',
                    size: 14,
                    color: Palette.neutralGray,
                  ),
                  Gap(10),
                  WidgetText(
                    title: 'Members',
                    size: 14,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Gap(5),
                  WidgetText(
                    title: '176',
                    color: Palette.neutralGray,
                    size: 14,
                  ),
                  Gap(20),
                  WidgetText(title: 'Facebook', size: 14, isBold: true),
                  Gap(5),
                  WidgetText(
                    title: 'www.facebook.com/BasketballGroupOne',
                    isUnderlined: true,
                    size: 14,
                    color: Palette.neutralGray,
                  ),
                  Gap(10),
                  WidgetText(
                    title: 'Viber',
                    size: 14,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Gap(5),
                  WidgetText(
                    title: 'JCI Basketball Group',
                    isUnderlined: true,
                    size: 14,
                    color: Palette.neutralGray,
                  ),
                  Gap(10),
                  WidgetText(
                    title: 'Telegram',
                    size: 14,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Gap(5),
                  WidgetText(
                    title: 'JCI Basketball Group',
                    size: 14,
                    isUnderlined: true,
                    color: Palette.neutralGray,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  OfficialGroupJoinedNotifier.isJoined = true;

                  Get.offAllNamed('/groups');
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color:
                        OfficialGroupJoinedNotifier.isJoined
                            ? Palette.accentBlue
                            : null,
                    border:
                        OfficialGroupJoinedNotifier.isJoined
                            ? Border.all(width: 1)
                            : Border.all(width: 0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: WidgetText(
                      title:
                          OfficialGroupJoinedNotifier.isJoined
                              ? 'Join Group'
                              : 'Leave Group',
                      color:
                          OfficialGroupJoinedNotifier.isJoined
                              ? Palette.white
                              : Palette.black,
                      size: 14,
                      isBold: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
