// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Tourirst {
  TouristStruct name;
  TouristStruct surname;
  TouristStruct birthDate;
  TouristStruct nationality;
  TouristStruct docNumber;
  TouristStruct docExpireDate;

  Tourirst(
    this.name,
    this.surname,
    this.birthDate,
    this.nationality,
    this.docNumber,
    this.docExpireDate,
  );
}

class TouristStruct {
  TextEditingController controller;
  String fieldLabel;
  String? errorText;
  TouristStruct({
    required this.controller,
    required this.fieldLabel,
    this.errorText,
  });

  TouristStruct copyWith({
    TextEditingController? controller,
    String? fieldLabel,
    String? errorText,
  }) {
    return TouristStruct(
      controller: controller ?? this.controller,
      fieldLabel: fieldLabel ?? this.fieldLabel,
      errorText: errorText ?? this.errorText,
    );
  }
}
