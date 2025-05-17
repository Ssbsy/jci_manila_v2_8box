class EventsModel {
  final String eventType;
  final String title;
  final String description;
  final String date;
  final String time;
  final String startRegistrationDate;
  final String startRegistrationTime;
  final String endRegistrationDate;
  final String endRegistrationTime;
  final bool allowOnsite;
  final int onsiteFee;
  final bool allowFreeGmm;
  final int onlineFreeGmmCost;
  final List<Committee> committees;
  final String bannerPicture;
  final String? addonLabel1;
  final String? addonLabel2;
  final String? addonLabel3;
  final String? addonLabel4;
  final String? addonLabel5;
  final double? addonPrice1;
  final double? addonPrice2;
  final double? addonPrice3;
  final double? addonPrice4;
  final double? addonPrice5;

  EventsModel({
    required this.eventType,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.startRegistrationDate,
    required this.startRegistrationTime,
    required this.endRegistrationDate,
    required this.endRegistrationTime,
    required this.allowOnsite,
    required this.onsiteFee,
    required this.allowFreeGmm,
    required this.onlineFreeGmmCost,
    required this.committees,
    required this.bannerPicture,
    this.addonLabel1,
    this.addonLabel2,
    this.addonLabel3,
    this.addonLabel4,
    this.addonLabel5,
    this.addonPrice1,
    this.addonPrice2,
    this.addonPrice3,
    this.addonPrice4,
    this.addonPrice5,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      eventType: json['event_type'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      startRegistrationDate: json['start_registration_date'],
      startRegistrationTime: json['start_registration_time'],
      endRegistrationDate: json['end_registration_date'],
      endRegistrationTime: json['end_registration_time'],
      allowOnsite: json['allow_onsite'] == 1,
      onsiteFee: json['onsite_fee'],
      allowFreeGmm: json['allow_free_gmm'] == 1,
      onlineFreeGmmCost: json['online_free_gmm_cost'],
      committees:
          (json['committees'] as List)
              .map((committee) => Committee.fromJson(committee))
              .toList(),
      bannerPicture: json['banner_picture'],
      addonLabel1: json['addon_label1'],
      addonLabel2: json['addon_label2'],
      addonLabel3: json['addon_label3'],
      addonLabel4: json['addon_label4'],
      addonLabel5: json['addon_label5'],
      addonPrice1: json['addon_price1']?.toDouble(),
      addonPrice2: json['addon_price2']?.toDouble(),
      addonPrice3: json['addon_price3']?.toDouble(),
      addonPrice4: json['addon_price4']?.toDouble(),
      addonPrice5: json['addon_price5']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_type': eventType,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'start_registration_date': startRegistrationDate,
      'start_registration_time': startRegistrationTime,
      'end_registration_date': endRegistrationDate,
      'end_registration_time': endRegistrationTime,
      'allow_onsite': allowOnsite ? 1 : 0,
      'onsite_fee': onsiteFee,
      'allow_free_gmm': allowFreeGmm ? 1 : 0,
      'online_free_gmm_cost': onlineFreeGmmCost,
      'committees': committees.map((committee) => committee.toJson()).toList(),
      'banner_picture': bannerPicture,
      'addon_label1': addonLabel1,
      'addon_label2': addonLabel2,
      'addon_label3': addonLabel3,
      'addon_label4': addonLabel4,
      'addon_label5': addonLabel5,
      'addon_price1': addonPrice1,
      'addon_price2': addonPrice2,
      'addon_price3': addonPrice3,
      'addon_price4': addonPrice4,
      'addon_price5': addonPrice5,
    };
  }
}

class Committee {
  final String name;
  final int id;
  final String memberType;

  Committee({required this.name, required this.id, required this.memberType});

  factory Committee.fromJson(Map<String, dynamic> json) {
    return Committee(
      name: json['name'],
      id: json['id'],
      memberType: json['member_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'id': id, 'member_type': memberType};
  }
}
