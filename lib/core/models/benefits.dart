import 'package:flutter/material.dart';

class Benefits {
  final String title;
  final double discount;
  final Widget image;
  final String discountDescription;
  final String? category;
  Benefits({
    required this.title,
    required this.discount,
    required this.image,
    this.discountDescription =
        'Any members can use this voucher on any Jollibee branches',
    this.category,
  });
}
