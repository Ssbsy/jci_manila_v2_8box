import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 2,
                  children: [
                    const Gap(10),
                    WidgetText(title: 'JCI Member', isBold: true, size: 22),
                    const Gap(20),
                    _header(context),
                    const Divider(),
                    _drawerRow(
                      icon: Icon(Icons.home_outlined, size: 20),
                      title: 'Home',
                      onTap: () => Navigator.pop(context),
                    ),
                    _drawerRow(
                      icon: Icon(Icons.work_outline, size: 20),
                      title: 'Project',
                      onTap: () => Navigator.pop(context),
                    ),
                    _drawerRow(
                      icon: Icon(Icons.folder_outlined, size: 20),
                      title: 'Business Directory',
                      onTap: () => Navigator.pop(context),
                    ),
                    _drawerRow(
                      icon: Icon(Icons.people_alt_outlined, size: 20),
                      title: 'Official Groups',
                      onTap: () => Navigator.pop(context),
                    ),
                    _drawerRow(
                      icon: FaIcon(
                        FontAwesomeIcons.database,
                        size: 20,
                        color: Colors.black.withValues(alpha: 0.6),
                      ),
                      title: 'Members Database',
                      onTap: () => Navigator.pop(context),
                    ),
                    _drawerRow(
                      icon: Icon(Icons.handshake_outlined, size: 20),
                      title: 'Sponsors',
                      onTap: () => Navigator.pop(context),
                    ),
                    _drawerRow(
                      icon: Icon(
                        FontAwesomeIcons.book,
                        size: 20,
                        color: Colors.black.withValues(alpha: 0.6),
                      ),
                      title: 'Resources',
                      onTap: () => Navigator.pop(context),
                    ),
                    _drawerRow(
                      icon: Icon(Icons.settings_outlined, size: 20),
                      title: 'Settings',
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
                _drawerRow(
                  icon: Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.red.shade800,
                    weight: 10,
                  ),
                  title: 'Logout',
                  textColor: Colors.red.shade800,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _header(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Palette.black,
            child: Icon(Icons.person, size: 40, color: Palette.white),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetText(title: 'Name', size: 18),
                WidgetText(title: 'view profile'),
              ],
            ),
          ),
        ],
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
