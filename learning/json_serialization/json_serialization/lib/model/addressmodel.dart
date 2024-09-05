// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class AddressModel {
  String street;
  String suite;
  String city;
  String zipcode;
  String phone;
  String website;

  AddressModel({
    required this.city,
    required this.street,
    required this.suite,
    required this.zipcode,
    required this.phone,
    required this.website
  });


 


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'phone': phone,
      'website': website,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] as String,
      suite: map['suite'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      phone: map['phone'] as String,
      website: map['website'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
