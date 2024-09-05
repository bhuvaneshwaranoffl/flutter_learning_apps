// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_serialization/model/addressmodel.dart';
import 'package:json_serialization/model/companymodel.dart';

class UserModel {
 String name;
 String email;
 String username;
 AddressModel address;
 CompanyModel company;

  UserModel({
    required this.name,
    required this.email,
    required this.username,
    required this.address,
    required this.company,
    });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'username': username,
      'address': address.toMap(),
      'company': company.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      address: AddressModel.fromMap(map['address'] as Map<String,dynamic>),
      company: CompanyModel.fromMap(map['company'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
