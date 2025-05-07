import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  bool obscure1 = true;
  bool obscure2 = true;

  final Color gradientStart = Color(0xFF1B1C2B);
  final Color gradientEnd = Color(0xFF1B3C63);
  final Color neutral50 = Color(0xFFFFFFFF);
  final Color neutral100 = Color(0xFFF5F5F5);
  final Color neutral300 = Color(0xFFBDBDBD);
  final Color accent500 = Color(0xFF145FB0);

  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStart, gradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/jci_manila_logo_white_1.png',
                  height: 100,
                ),
                SizedBox(height: 30),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 10,
                  color: neutral50,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            "New Password",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Please provide your new password to\ncontinue.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: pass1,
                            obscureText: obscure1,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: neutral100,
                              hintText: "New Password",
                              hintStyle: TextStyle(color: neutral300),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscure1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: neutral300,
                                ),
                                onPressed:
                                    () => setState(() => obscure1 = !obscure1),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator:
                                (value) =>
                                    value == null || value.isEmpty
                                        ? 'Enter new password'
                                        : null,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: pass2,
                            obscureText: obscure2,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: neutral100,
                              hintText: "Confirm New Password",
                              hintStyle: TextStyle(color: neutral300),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscure2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: neutral300,
                                ),
                                onPressed:
                                    () => setState(() => obscure2 = !obscure2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Re-enter password';
                              }
                              if (value != pass1.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {}
                              Get.offAllNamed('/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accent500,
                              minimumSize: Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Submit",
                              style: TextStyle(color: neutral50),
                            ),
                          ),
                          SizedBox(height: 10),
                          OutlinedButton(
                            onPressed: () {
                              Get.offAllNamed('/login');
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: accent500),
                              minimumSize: Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Back to login",
                              style: TextStyle(color: accent500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
