import 'dart:convert';

class Business {
  final String storeType;
  final String logo;
  final String businessName;
  final String businessDescription;
  final String mainProducts;
  final int jcimOwner;
  final List<int> jcimCoOwners;
  final int industry;
  final String website;
  final String companyEmail;
  final String primaryContactNumber;
  final String? secondaryContactNumber;
  final String? jcimMemberBenefits;
  final String? tags;
  final String latitude;
  final String longitude;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String address;
  final String operatingHours;

  // Optional based sa api response
  final String? barangay;
  final String? district;
  final String? city;
  final String? province;
  final String? region;
  final String? building;
  final String? street;
  final String? landmarks;
  final String? postal;
  final String? storefrontPic;
  final String? googleMapLink;

  Business({
    required this.storeType,
    required this.logo,
    required this.businessName,
    required this.businessDescription,
    required this.mainProducts,
    required this.jcimOwner,
    required this.jcimCoOwners,
    required this.industry,
    required this.website,
    required this.companyEmail,
    required this.primaryContactNumber,
    this.secondaryContactNumber,
    this.jcimMemberBenefits,
    this.tags,
    required this.latitude,
    required this.longitude,
    this.facebook,
    this.instagram,
    this.twitter,
    required this.address,
    required this.operatingHours,
    this.barangay,
    this.district,
    this.city,
    this.province,
    this.region,
    this.building,
    this.street,
    this.landmarks,
    this.postal,
    this.storefrontPic,
    this.googleMapLink,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      storeType: json['store_type'],
      logo: json['logo'],
      businessName: json['business_name'],
      businessDescription: json['business_description'],
      mainProducts: json['main_products'],
      jcimOwner: json['jcim_owner'],
      jcimCoOwners: List<int>.from(json['jcim_co_owners']),
      industry: json['industry'],
      website: json['website'],
      companyEmail: json['company_email'],
      primaryContactNumber: json['primary_contact_number'],
      secondaryContactNumber: json['secondary_contact_number'],
      jcimMemberBenefits: json['jcim_member_benefits'],
      tags: json['tags'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      twitter: json['twitter'],
      address: json['address'],
      operatingHours: json['operating_hours'],
      barangay: json['barangay'],
      district: json['district'],
      city: json['city'],
      province: json['province'],
      region: json['region'],
      building: json['building'],
      street: json['street'],
      landmarks: json['landmarks'],
      postal: json['postal'],
      storefrontPic: json['storefront_pic'],
      googleMapLink: json['google_map_link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'store_type': storeType,
      'logo': logo,
      'business_name': businessName,
      'business_description': businessDescription,
      'main_products': mainProducts,
      'jcim_owner': jcimOwner,
      'jcim_co_owners': jcimCoOwners,
      'industry': industry,
      'website': website,
      'company_email': companyEmail,
      'primary_contact_number': primaryContactNumber,
      'secondary_contact_number': secondaryContactNumber,
      'jcim_member_benefits': jcimMemberBenefits,
      'tags': tags,
      'latitude': latitude,
      'longitude': longitude,
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
      'address': address,
      'operating_hours': operatingHours,
      'barangay': barangay,
      'district': district,
      'city': city,
      'province': province,
      'region': region,
      'building': building,
      'street': street,
      'landmarks': landmarks,
      'postal': postal,
      'storefront_pic': storefrontPic,
      'google_map_link': googleMapLink,
    };
  }

  // Helper method to convert to JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }
}
