import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final Color accent500 = Color(0xFF145FB0);
  final Color neutral50 = Color(0xFFFFFFFF);
  final Color neutral100 = Color(0xFFF5F5F5);
  final Color neutral300 = Color(0xFFBDBDBD);
  final Color neutral900 = Color(0xFF121212);

  // Form field controllers
  final TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.offAllNamed('/login'),
          icon: Icon(Icons.arrow_back_ios, color: Palette.white, size: 20),
        ),
        title: WidgetText(
          title: 'Register as an Applicant',
          color: Palette.white,
          size: 16,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1B1C2B), Color(0xFF1B3C63)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        color: neutral50,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              sectionLabel("Basic Details"),
              inputField("Last Name", "Enter your last name"),
              inputField("First Name", "Enter your first name"),
              inputField("Nickname", "Enter your nickname"),
              dateField("Birthday", "Select your date of birth"),
              inputField("School Graduated", "Enter the year you graduated"),
              inputField("Home Address", "Enter your current address"),
              label("Profile Picture"),
              fileButton("Upload picture"),

              sectionLabel("Account Details"),
              inputField("Email", "Enter your email address"),
              inputField(
                "Password",
                "Enter your chosen password",
                obscure: true,
              ),
              inputField(
                "Confirm Password",
                "Enter your chosen password again",
                obscure: true,
              ),

              sectionLabel("Business Details"),
              inputField("Profession", "Enter your profession"),
              inputField("Industry", "Enter your industry"),
              inputField("Sponsor Name", "Enter your sponsor's name"),
              inputField(
                "Sponsor ID",
                "Automatically retrieved",
                enabled: false,
                color: Colors.grey[300],
              ),
              label("Resume"),
              fileButton("Choose file"),

              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.offAllNamed('/login'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        side: BorderSide(color: accent500),
                      ),
                      child: WidgetText(
                        title: 'Cancel',
                        color: accent500,
                        size: 14,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   Get.offAllNamed('/pageManager');
                        // }
                        Get.offAllNamed('/pageManager');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent500,
                        minimumSize: Size.fromHeight(50),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionLabel(String text) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );

  Widget label(String text) => Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 5),
    child: Text(text),
  );

  Widget inputField(
    String label,
    String hint, {
    bool obscure = false,
    bool enabled = true,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: obscure,
        enabled: enabled,
        decoration: InputDecoration(
          filled: true,
          fillColor: color ?? neutral100,
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(color: neutral300),
          labelStyle: TextStyle(color: neutral300),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (!enabled) return null;
          if (value == null || value.isEmpty) {
            return 'Please enter $label.toLowerCase()';
          }
          return null;
        },
      ),
    );
  }

  Widget dateField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: birthdayController,
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: neutral100,
          labelText: label,
          hintText: hint,
          suffixIcon: Icon(Icons.calendar_today, color: neutral300),
          hintStyle: TextStyle(color: neutral300),
          labelStyle: TextStyle(color: neutral300),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            initialDate: DateTime.now(),
          );
          if (picked != null) {
            setState(() {
              birthdayController.text =
                  "${picked.month}/${picked.day}/${picked.year}";
            });
          }
        },
      ),
    );
  }

  Widget fileButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: accent500),
          minimumSize: Size.fromHeight(45),
        ),
        child: Text(text, style: TextStyle(color: accent500)),
      ),
    );
  }
}
