import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/accounts/get_profile_services.dart';

class ProfileProvider with ChangeNotifier {
  Map<dynamic, dynamic>? profileData;
  //about yourself
  String _firstName = '';
  String _lastName = '';
  String _middleName = '';
  String _aboutyourself = '';

  //about yourself - getters
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get middleName => _middleName;
  String get aboutyourself => _aboutyourself;
  bool get isLoading => _isLoading;

  bool _isLoading = true;

  //Home address
  String _homeAddress = '';
  String _city = '';
  String _contact = '';

  //Home address - getters
  String get homeAddress => _homeAddress;
  String get city => _city;
  String get contact => _contact;

  //civil status
  String _civilStatus = '';
  String _spouseName = '';
  String _spouseContact = '';

  //civil status - getters
  String get civilStatus => _civilStatus;
  String get spouseName => _spouseName;
  String get spouseContact => _spouseContact;

  //Shipping Address
  String _shippingAddress1 = 'null';
  int _shippingZip = 0;

  //Shipping Address - getters
  String get shippingAddress1 => _shippingAddress1;
  int get shippingZip => _shippingZip;

  //Contact no
  String _contactNumber = '';
  String _contactNumber2 = '';
  String _telNoFax = '';

  //Contact no - getters
  String get contactNumber => _contactNumber;
  String get contactNumber2 => _contactNumber2;
  String get telNoFax => _telNoFax;

  //Highschool
  String _highSchool = '';
  String _educationalAttainment = '';
  String _schoolGraduated = '';

  //Highschool - getters
  String get highSchool => _highSchool;
  String get educationalAttainment => _educationalAttainment;
  String get schoolGraduated => _schoolGraduated;

  //Profession
  String _profession = '';
  String _employementStatus = '';
  String _company = '';
  String _industry = '';
  String _officeAddress = '';
  String _officeCity = '';

  //Profession - getters
  String get profession => _profession;
  String get employementStatus => _employementStatus;
  String get company => _company;
  String get industry => _industry;
  String get officeAddress => _officeAddress;
  String get officeCity => _officeCity;

  //Sports
  String _sports = '';
  String _instagram = '';
  String _twitter = '';
  String _linkedin = '';

  //Sports - getters
  String get sports => _sports;
  String get instagram => _instagram;
  String get twitter => _twitter;
  String get linkedin => _linkedin;

  //Profile screen
  int _freeGmmCount = 0;
  int _memberPoints = 0;
  int _projectsCount = 0;
  String _qrData = '';

  //Profile screen - getters
  int get freeGmmCount => _freeGmmCount;
  int get memberPoints => _memberPoints;
  int get projectsCount => _projectsCount;
  String get qrData => _qrData;

  //--------------------------------//

  //Membership
  String _membership = '';
  String _membershipID = '';
  String _jciPhilID = '';
  String _jciSenNo = '';
  String _careGroup = '';
  String _currentPosition = '';
  String _currentPositionDirectorate = '';

  //Membership - getters
  String get membership => _membership;
  String get membershipID => _membershipID;
  String get jciPhilID => _jciPhilID;
  String get jciSenNo => _jciSenNo;
  String get careGroup => _careGroup;
  String get currentPosition => _currentPosition;
  String get currentPositionDirectorate => _currentPositionDirectorate;

  //University of Leaders Orientation Date
  String _uloDate = '';
  String _launchPadDate = '';
  int _yearInductedBaby = 0;
  int _bjcProjectPresentationDate = 0;
  String _inductionDate = '';
  int _yearInducted = 0;
  String _awardsReceived = '';

  //University of Leaders Orientation Date - getters
  String get uloDate => _uloDate;
  String get launchPadDate => _launchPadDate;
  int get yearInductedBaby => _yearInductedBaby;
  int get bjcProjectPresentationDate => _bjcProjectPresentationDate;
  String get inductionDate => _inductionDate;
  int get yearInducted => _yearInducted;
  String get awardsReceived => _awardsReceived;

  //BJC Project title
  String _bjcProjectTitle = '';
  String _sponsorName = '';
  String _jciAreaConferenceEvents = '';
  String _jciAsiaPacificConference = '';
  String _jciWorldCongress = '';
  String _jcipNationalConvention = '';

  //BJC Project title - getters
  String get bjcProjectTitle => _bjcProjectTitle;
  String get sponsorName => _sponsorName;
  String get jciAreaConferenceEvents => _jciAreaConferenceEvents;
  String get jciAsiaPacificConference => _jciAsiaPacificConference;
  String get jciWorldCongress => _jciWorldCongress;
  String get jcipNationalConvention => _jcipNationalConvention;

  //Board of Director
  String _boardOfDirector = '';
  String _commissionership = '';
  String _chairmanship = '';
  String _position = '';
  String _previousProjects = '';

  //Board of Director - getters
  String get boardOfDirector => _boardOfDirector;
  String get commissionership => _commissionership;
  String get chairmanship => _chairmanship;
  String get position => _position;
  String get previousProjects => _previousProjects;

  Future<void> fetchProfile() async {
    try {
      _isLoading = true;
      notifyListeners();

      final apiService = BaseApiServices();
      final profileService = GetProfileServices(apiService);
      final data = await profileService.getProfile();

      //about yourself
      _firstName = data['first_name'] ?? '';
      _lastName = data['last_name'] ?? '';
      _middleName = data['middle_name'] ?? '';
      _aboutyourself = data['about_your_self'] ?? '';
      profileData = data;

      //civil status
      _civilStatus = data['civil_status'] ?? '';
      _spouseName = data['spouse_name'] ?? 'null';
      _spouseContact = data['spouse_contact_no'] ?? 'null';

      //Shipping Address
      _shippingAddress1 = data['shipping_address1'] ?? '';
      _shippingZip = data['shipping_zip'] ?? 0;

      //Contact no
      _contactNumber = data['contact_number'] ?? '';
      _contactNumber2 = data['contact_no2'] ?? '';
      _telNoFax = data['tel_no_fax'] ?? '';

      //Highschool
      _highSchool = data['high_school'] ?? '';
      _educationalAttainment = data['educational_attaiment'] ?? 'null';
      _schoolGraduated = data['school_graduated'] ?? 'null';

      //Profession
      _profession = data['profession'] ?? 'null';
      _employementStatus = data['employment_status'] ?? 'null';
      _company = data['company'] ?? 'null';
      _industry = data['industry'] ?? 'null';
      _officeAddress = data['office_address'] ?? 'null';
      _officeCity = data['office_city'] ?? 'null';

      //Sports
      _sports = data['sports'] ?? 'null';
      _instagram = data['instragram'] ?? 'null';
      _twitter = data['twitter'] ?? 'null';
      _linkedin = data['linkedin'] ?? 'null';

      //profile
      _qrData = data['qr_data'] ?? '';
      _freeGmmCount = data['free_gmm'] ?? 0;
      _memberPoints = data['membership_benefits'] ?? 0;
      _projectsCount = data['projects_count'] ?? 0;

      //Home address
      _homeAddress = data['home_address'] ?? '';
      _city = data['home_city'] ?? '';
      _contact = data['contact_number'] ?? '';

      //---------------------------//

      //Membership
      _membership = data['membership'] ?? 'null';
      _membershipID = data['member_id'] ?? 'null';
      _jciPhilID = data['jci_phil_id'] ?? 'null';
      _jciSenNo = data['jci_sen_no'] ?? 'null';
      _careGroup = data['care_group'] ?? 'null';
      _currentPosition = data['current_position'] ?? 'null';
      _currentPositionDirectorate =
          data['current_position_directorate'] ?? 'null';

      //University of Leaders Orientation Date
      _uloDate = data['ulo_date'] ?? 'null';
      _launchPadDate = data['launch_pad_date'] ?? 'null';
      _yearInductedBaby = data['year_inducted_baby'] ?? 0;
      _bjcProjectPresentationDate = data['bjc_project_presentation_date'] ?? 0;
      _inductionDate = data['induction_date'] ?? 'null';
      _yearInducted = data['year_inducted'] ?? 0;
      _awardsReceived = data['awards_received'] ?? 'null';

      //BJC Project title
      _bjcProjectTitle = data['bjc_project_title'] ?? 'null';
      _sponsorName = data['sponsor_name'] ?? 'null';
      _jciAreaConferenceEvents = data['jci_area_conference_events'] ?? 'null';
      _jciAsiaPacificConference = data['jci_asia_pacific_conference'] ?? 'null';
      _jciWorldCongress = data['jci_world_congress'] ?? 'null';
      _jcipNationalConvention = data['jcip_national_convention'] ?? 'null';

      //Board of Director
      _boardOfDirector = data['board_of_director'] ?? 'null';
      _commissionership = data['commissionership'] ?? 'null';
      _chairmanship = data['chairmanship'] ?? 'null';
      _position = data['position'] ?? 'null';
      _previousProjects = data['previous_projects'] ?? 'null';

      debugPrint("Profile data fetched: $data"); //For debuggimng

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching profile: $e");
      _isLoading = false;
      notifyListeners();
    }
  }
}
