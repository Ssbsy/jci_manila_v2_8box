import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateProfileProvider extends ChangeNotifier {
  // Required fields
  String name = '';
  String firstName = '';
  String lastName = '';
  String status = '';
  String preGM = '';
  String contanctNo = '';
  String email = '';
  String emailToUpdate = '';
  String company = '';
  String shippingAddress1 = '';
  String shippingAddress2 = '';
  String shippingCity = '';
  String shippingZip = '';
  String freeGM = '';
  String membership = '';
  int? id;
  String membershipDue = '';
  String penalty = '';
  String bday = '';
  String verificationStatus = '';
  String dateAdded = '';
  String nickname = '';
  String sponsor = '';
  String memberID = '';
  int? currentAge;
  String schoolGraduate = '';
  String profession = '';
  String industry = '';
  String resume = '';
  String homeAddress = '';
  String bjcProjectTitle = '';
  String introductionDate = '';
  String purpose = '';
  String wantedChairman = '';
  String personalityType = '';
  String careGroup = '';
  String uloDate = '';
  String uloEvent = '';
  String lunchpad = '';
  String lunchpadDate = '';
  String projectClosingDate = '';
  String password = '';
  String photo = '';
  String uploadPhoto = '';
  String bjcProjectPresentationDate = '';
  String active = '';
  String resetToken = '';
  String resetDate = '';
  String pannelStatus = '';
  String pannelRemarks = '';
  String sponsorName = '';
  String civilStatus = '';
  String contactNo2 = '';
  String educationalAttainment = '';
  String highSchool = '';
  String homeContactNo = '';
  String employmentStatus = '';
  String officeAddress = '';
  String officeContactNo = '';
  String jciPhilID = '';
  String jciSenNo = '';
  String telNoFax = '';
  String alternateEmail = '';
  String spouseName = '';
  String spouseContactNo = '';
  String sports = '';
  String interest = '';
  String aboutYourSelf = '';
  String awardsReceived = '';
  String currentPosition = '';
  String currentPositionDirectorate = '';
  String previousProjects = '';
  String contactPerson = '';
  String contactPersonRelationship = '';
  String otherSkills = '';
  String facebook = '';
  String instagram = '';
  String twitter = '';
  String linkedin = '';
  String showBday = '';
  String showProfessionalInfo = '';
  String showProfile = '';
  String showPrimaryContactInfo = '';
  String showSecondaryContactInfo = '';
  String showAddress = '';
  String showCivilStatus = '';
  String showEducationalInfo = '';
  String showInterestSkills = '';
  String showSocialMedia = '';
  String showJCIJourney = '';
  String showJCIProjects = '';
  String showEventsAttended = '';
  String vaccineCard = '';
  String uploadVaccineCard = '';
  int? yearInducted;
  String course = '';
  String jciAreaConferenceEvents = '';
  String homeCity = '';
  String officeCity = '';
  String membershipBenefits = '';
  String boardOfDirector = '';
  String commissionership = '';
  String jcipNationalConvention = '';
  String jciAsiaPacificConference = '';
  String jciWorldCongress = '';
  String emergencyLastName = '';
  String emergencyFirstName = '';
  String emergencyMiddleName = '';
  String emergencyMobileNo = '';
  String yearInductedBaby = '';
  String chiarmanship = '';
  String emergencyRelationship = '';
  String middleName = '';
  String contactPersonNo = '';
  String applicationGroup = '';
  String applicationRemarks = '';
  String applicationStatus = '';
  String bod = '';
  String inductionDateBabyJC = '';
  String possition = '';
  String currentTitle = '';
  String bioFace = '';
  String bioFinger = '';
  String emailOTP = '';
  String sponsorType = '';
  String mobileRegister = '';
  String projectsCount = '';
  String eventsCount = '';

  Future<void> updateProfile() async {
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request(
      'POST',
      Uri.parse('http://api.jcimanila.com/UpdateProfile'),
    );

    request.body = json.encode({
      'about_your_self': aboutYourSelf,
      'first_name': firstName,
      'last_name': lastName,
      'nickname': nickname,
      'middle_name': middleName,
      'bday': bday,
      'home_address': homeAddress,
      'home_city': homeCity,
      'contact_number': contanctNo,
      'civil_status': civilStatus,
      'spouse_name': spouseName,
      'spouse_contact_no': spouseContactNo,
      'shipping_city': shippingCity,
      'shipping_zip': shippingZip,
      'tel_no_fax': telNoFax,
      'contact_no2': contactNo2,
      'educational_attaiment': educationalAttainment,
      'high_school': highSchool,
      'school_graduated': schoolGraduate,
      'course': course,
      'profession': profession,
      'employment_status': employmentStatus,
      'company': company,
      'industry': industry,
      'office_address': officeAddress,
      'office_city': officeCity,
      'email': email,
      'alternate_email': alternateEmail,
      'sports': sports,
      'interest': interest,
      'other_skills': otherSkills,
      'facebook': facebook,
      'twitter': twitter,
      'instragram': instagram,
      'linkedin': linkedin,
      'emailtoUpdate': emailToUpdate,
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint(await response.stream.bytesToString());
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void updateField(String fieldName, String value) {
    switch (fieldName) {
      case 'aboutYourSelf':
        aboutYourSelf = value;
        break;
      case 'firstName':
        firstName = value;
        break;
      case 'lastName':
        lastName = value;
        break;
      case 'nickname':
        nickname = value;
        break;
      case 'middleName':
        middleName = value;
        break;
      case 'bday':
        bday = value;
        break;
      case 'homeAddress':
        homeAddress = value;
        break;
      case 'homeCity':
        homeCity = value;
        break;
      case 'contactNumber':
        contanctNo = value;
        break;
      case 'civilStatus':
        civilStatus = value;
        break;
      case 'spouseName':
        spouseName = value;
        break;
      case 'spouseContactNo':
        spouseContactNo = value;
        break;
      case 'shippingCity':
        shippingCity = value;
        break;
      case 'shippingZip':
        shippingZip = value;
        break;
      case 'telNoFax':
        telNoFax = value;
        break;
      case 'contactNo2':
        contactNo2 = value;
        break;
      case 'educationalAttainment':
        educationalAttainment = value;
        break;
      case 'highSchool':
        highSchool = value;
        break;
      case 'schoolGraduated':
        schoolGraduate = value;
        break;
      case 'course':
        course = value;
        break;
      case 'profession':
        profession = value;
        break;
      case 'employmentStatus':
        employmentStatus = value;
        break;
      case 'company':
        company = value;
        break;
      case 'industry':
        industry = value;
        break;
      case 'officeAddress':
        officeAddress = value;
        break;
      case 'officeCity':
        officeCity = value;
        break;
      case 'email':
        email = value;
        break;
      case 'alternateEmail':
        alternateEmail = value;
        break;
      case 'sports':
        sports = value;
        break;
      case 'interest':
        interest = value;
        break;
      case 'otherSkills':
        otherSkills = value;
        break;
      case 'facebook':
        facebook = value;
        break;
      case 'twitter':
        twitter = value;
        break;
      case 'instagram':
        instagram = value;
        break;
      case 'linkedin':
        linkedin = value;
        break;
      case 'emailToUpdate':
        emailToUpdate = value;
        break;
    }
    notifyListeners();
  }
}
