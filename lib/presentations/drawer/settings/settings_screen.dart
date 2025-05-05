import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/presentations/drawer/settings/widgets/change_pass.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showNotification = false;
  bool showBirthday = false;
  bool showPrimaryContact = false;
  bool showEducation = false;
  bool showProfession = false;
  bool showCivilStatus = false;
  bool showSecondaryContact = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Palette.primary,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Palette.primary),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _buildToggle("Notification", showNotification, (val) {
            setState(() => showNotification = val);
          }),
          _buildToggle("Show birthday", showBirthday, (val) {
            setState(() => showBirthday = val);
          }),
          _buildToggle("Show primary contact info", showPrimaryContact, (val) {
            setState(() => showPrimaryContact = val);
          }),
          _buildToggle("Show education info", showEducation, (val) {
            setState(() => showEducation = val);
          }),
          _buildToggle("Show profession info", showProfession, (val) {
            setState(() => showProfession = val);
          }),
          _buildToggle("Show civil status", showCivilStatus, (val) {
            setState(() => showCivilStatus = val);
          }),
          _buildToggle("Show secondary contact info", showSecondaryContact, (val) {
            setState(() => showSecondaryContact = val);
          }),
          const Divider(),
          ListTile(
            title: const Text("Change password"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangePasswordPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToggle(String label, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(label),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: Palette.primary,
      ),
    );
  }
}
