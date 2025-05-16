import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/providers/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        if (profileProvider.isLoading) {
          return Scaffold(
            backgroundColor: Palette.veryDarkBluishGray,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Drawer(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 2,
                        children: [
                          const Gap(10),
                          WidgetText(
                            title: 'JCI Member',
                            isBold: true,
                            size: 22,
                          ),
                          const Gap(20),
                          _header(context, profileProvider),
                          const Divider(),
                          _drawerRow(
                            icon: Icon(Icons.home_outlined, size: 20),
                            title: 'Home',
                            onTap: () => Get.offAllNamed('/pageManager'),
                          ),
                          _drawerRow(
                            icon: Icon(Icons.work_outline, size: 20),
                            title: 'Project',
                            onTap: () => Get.offAllNamed('/projects'),
                          ),
                          _drawerRow(
                            icon: Icon(Icons.folder_outlined, size: 20),
                            title: 'Business Directory',
                            onTap: () => Get.offAllNamed('/business'),
                          ),
                          _drawerRow(
                            icon: Icon(Icons.people_alt_outlined, size: 20),
                            title: 'Official Groups',
                            onTap: () => Get.offAllNamed('/groups'),
                          ),
                          _drawerRow(
                            icon: FaIcon(
                              FontAwesomeIcons.database,
                              size: 20,
                              color: Colors.black.withValues(alpha: 0.6),
                            ),
                            title: 'Members Database',
                            onTap: () => Get.offAllNamed('/database'),
                          ),
                          _drawerRow(
                            icon: Icon(Icons.handshake_outlined, size: 20),
                            title: 'Sponsors',
                            onTap: () => Get.offAllNamed('/sponsors'),
                          ),
                          _drawerRow(
                            icon: Icon(
                              FontAwesomeIcons.book,
                              size: 20,
                              color: Colors.black.withValues(alpha: 0.6),
                            ),
                            title: 'Resources',
                            onTap: () => Get.offAllNamed('/resources'),
                          ),
                          _drawerRow(
                            icon: Icon(Icons.settings_outlined, size: 20),
                            title: 'Settings',
                            onTap: () => Get.offAllNamed('/settings'),
                          ),
                        ],
                      ),
                      _drawerRow(
                        icon: Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.red.shade800,
                        ),
                        title: 'Logout',
                        textColor: Colors.red.shade800,
                        onTap: () => Get.offAllNamed('/login'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _header(BuildContext context, ProfileProvider profileProvider) {
    String fullName =
        [
          profileProvider.user?.firstName ?? '',
          profileProvider.user?.lastName ?? '',
        ].where((part) => part.isNotEmpty).join(' ').trim();
    debugPrint(fullName);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Get.toNamed('/profile');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            SizedBox(
              child: Image.asset(
                profileProvider.user?.photo ?? 'default_photo.png',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.accentBlue,
                    ),
                    child: Icon(Icons.person, color: Palette.white, size: 30),
                  );
                },
              ),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetText(title: fullName),
                WidgetText(title: 'view profile', color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerRow({
    required Widget icon,
    required String title,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor ?? Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
