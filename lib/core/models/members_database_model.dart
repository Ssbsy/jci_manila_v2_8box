import 'package:flutter/material.dart';

class MembersDatabaseModel {
  int? id;
  final String firstName;
  final String lastName;
  final String? sponsor;
  final String type;
  final String? work;
  final String? birthday;
  final String? jciCareer;
  final String? commisioner;
  final String? commitee;
  final String? interest;
  final String? email;
  final int? contactNumber;
  final Widget badge;

  MembersDatabaseModel({
    this.id,
    required this.firstName,
    required this.lastName,
    this.sponsor,
    required this.type,
    this.work,
    this.birthday,
    this.jciCareer,
    this.commisioner,
    this.interest,
    this.commitee,
    this.email,
    this.contactNumber,
    required this.badge,
  });
}
