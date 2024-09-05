// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PriceAndQuantityModel {
  final String label;
  final int? value;

  PriceAndQuantityModel({
    required this.label,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'value': value,
    };
  }

  factory PriceAndQuantityModel.fromMap(Map<String, dynamic> map) {
    return PriceAndQuantityModel(
      label: map['label'] as String,
      value: map['value'] != null ? map['value'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceAndQuantityModel.fromJson(String source) => PriceAndQuantityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
