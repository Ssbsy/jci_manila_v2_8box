import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/presentations/drawer/settings/widgets/change_pass.dart';

class SettingsInfo extends StatefulWidget {
  const SettingsInfo({super.key});

  @override
  State<SettingsInfo> createState() => _SettingsInfoState();
}

class _SettingsInfoState extends State<SettingsInfo> {
  bool notification = false;
  bool showBirthday = false;
  bool showPrimaryContact = false;
  bool showEducation = false;
  bool showProfession = false;
  bool showCivilStatus = false;
  bool showSecondaryContact = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          _buildToggleTile(
            'Notification',
            notification,
            (val) => setState(() => notification = val),
          ),
          _buildToggleTile(
            'Show birthday',
            showBirthday,
            (val) => setState(() => showBirthday = val),
          ),
          _buildToggleTile(
            'Show primary contact info',
            showPrimaryContact,
            (val) => setState(() => showPrimaryContact = val),
          ),
          _buildToggleTile(
            'Show education info',
            showEducation,
            (val) => setState(() => showEducation = val),
          ),
          _buildToggleTile(
            'Show profession info',
            showProfession,
            (val) => setState(() => showProfession = val),
          ),
          _buildToggleTile(
            'Show civil status',
            showCivilStatus,
            (val) => setState(() => showCivilStatus = val),
          ),
          _buildToggleTile(
            'Show secondary contact info',
            showSecondaryContact,
            (val) => setState(() => showSecondaryContact = val),
          ),
          const Gap(12),
          _buildNavigationTile(
            title: 'Change password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangePass()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToggleTile(String title, bool value, Function(bool) onChanged) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetText(title: title, size: 16),
              Transform.scale(
                scale: 0.8,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    switchTheme: SwitchThemeData(
                      trackColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return Palette.primary;
                        }
                        return Palette.neutralWhite;
                      }),
                      trackOutlineColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (!states.contains(WidgetState.selected)) {
                            return Palette.neutralGray;
                          }
                          return Colors.transparent;
                        },
                      ),
                      thumbColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return Palette.neutralWhite;
                        }
                        return Palette.neutralGray;
                      }),
                    ),
                  ),
                  child: Switch(
                    value: value,
                    onChanged: onChanged,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 4, color: Palette.neutralLightGray),
      ],
    );
  }

  Widget _buildNavigationTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                WidgetText(title: 'Change password', size: 16),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
              ],
            ),
          ),
        ),
        const Divider(height: 1, color: Palette.neutralLightGray),
      ],
    );
  }
}
