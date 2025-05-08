import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/services/accounts/register_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late final RegisterServices registerServices;
  late final BaseApiServices baseApiServices;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final TextEditingController sponsorIDController = TextEditingController();
  final TextEditingController sponsorNameController = TextEditingController();

  File? _profilePic;
  File? _resumeFile;
  bool isLoading = false;
  bool _isPickingImage = false;

  final Color accent500 = const Color(0xFF145FB0);
  final Color neutral50 = const Color(0xFFFFFFFF);
  final Color neutral100 = const Color(0xFFF5F5F5);
  final Color neutral300 = const Color(0xFFBDBDBD);

  @override
  void initState() {
    super.initState();
    baseApiServices = BaseApiServices();
    registerServices = RegisterServices(baseApiServices);
  }

  Future<void> pickImage() async {
    if (_isPickingImage) return;
    _isPickingImage = true;
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) setState(() => _profilePic = File(picked.path));
    } catch (e) {
      debugPrint('Image picking error: $e');
    } finally {
      _isPickingImage = false;
    }
  }

  Future<void> pickResume() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() => _resumeFile = File(result.files.single.path!));
    }
  }

  Future<void> submitRegistration() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final data = {
        'fullname': '${firstNameController.text} ${lastNameController.text}',
        'fname': firstNameController.text,
        'lname': lastNameController.text,
        'nickname': nicknameController.text,
        'bday': birthdayController.text,
        'address': addressController.text,
        'contactno': contactController.text,
        'school': schoolController.text,
        'profession': professionController.text,
        'industry': industryController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'sponsor_id':
            sponsorIDController.text.isEmpty ? '0' : sponsorIDController.text,
        'sponsor_name': sponsorNameController.text,
        'photo': _profilePic != null ? _profilePic!.path.split('/').last : '',
        'resume': _resumeFile != null ? _resumeFile!.path.split('/').last : '',
      };

      final response = await registerServices.postRegister(
        data: data,
        photoFile: _profilePic,
        resumeFile: _resumeFile,
      );

      print('API response: $response');

      if (response['success'] == true) {
        Get.offAllNamed('/pageManager');
      } else {
        Get.snackbar('Error', response['message'] ?? 'Registration failed');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            decoration: const BoxDecoration(
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                sectionLabel("Basic Details"),
                inputField(
                  "Last Name",
                  lastNameController,
                  "Enter your last name",
                ),
                inputField(
                  "First Name",
                  firstNameController,
                  "Enter your first name",
                ),
                inputField(
                  "Nickname",
                  nicknameController,
                  "Enter your nickname",
                ),
                dateField(
                  "Birthday",
                  birthdayController,
                  "Select your date of birth",
                ),
                inputField(
                  "School Graduated",
                  schoolController,
                  "Enter the year you graduated",
                ),
                inputField(
                  "Home Address",
                  addressController,
                  "Enter your current address",
                ),
                inputField(
                  "Contact Number",
                  contactController,
                  "Enter your phone number",
                ),
                label("Profile Picture"),
                fileButton("Upload picture", pickImage),
                if (_profilePic != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _profilePic!,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                sectionLabel("Account Details"),
                inputField(
                  "Email",
                  emailController,
                  "Enter your email address",
                ),
                inputField(
                  "Password",
                  passwordController,
                  "Enter your chosen password",
                  obscure: true,
                ),
                inputField(
                  "Confirm Password",
                  confirmPasswordController,
                  "Enter your chosen password again",
                  obscure: true,
                ),

                sectionLabel("Business Details"),
                inputField(
                  "Profession",
                  professionController,
                  "Enter your profession",
                ),
                inputField(
                  "Industry",
                  industryController,
                  "Enter your industry",
                ),
                inputField(
                  "Sponsor Name",
                  sponsorNameController,
                  "Enter your sponsor's name",
                ),
                inputField(
                  "Sponsor ID",
                  sponsorIDController,
                  "Automatically retrieved",
                  enabled: false,
                  color: Colors.grey[300],
                ),
                label("Resume"),
                fileButton("Choose file", pickResume),
                if (_resumeFile != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Selected file: ${_resumeFile!.path.split('/').last}",
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                  ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.offAllNamed('/login'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          side: BorderSide(color: accent500),
                        ),
                        child: WidgetText(
                          title: 'Cancel',
                          color: accent500,
                          size: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isLoading ? null : submitRegistration,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accent500,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child:
                            isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : const Text(
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
      ),
    );
  }

  Widget sectionLabel(String text) => Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );

  Widget label(String text) => Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 5),
    child: Text(text),
  );

  Widget inputField(
    String label,
    TextEditingController controller,
    String hint, {
    bool obscure = false,
    bool enabled = true,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
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
            return 'Please enter ${label.toLowerCase()}';
          }
          return null;
        },
      ),
    );
  }

  Widget dateField(
    String label,
    TextEditingController controller,
    String hint,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
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
              controller.text =
                  "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
            });
          }
        },
      ),
    );
  }

  Widget fileButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: accent500),
          minimumSize: const Size.fromHeight(45),
        ),
        child: Text(text, style: TextStyle(color: accent500)),
      ),
    );
  }
}
