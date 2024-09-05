// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class CompanyModel {
  String name;
  String catchpharse;
  String bs;

  CompanyModel({
   required this.name,
   required this.catchpharse,
   required this.bs,
  });

  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'catchpharse': catchpharse,
      'bs': bs,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      name: map['name'] as String,
      catchpharse: map['catchpharse'] as String,
      bs: map['bs'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
