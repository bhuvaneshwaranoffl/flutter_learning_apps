// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:json_serialization/model/priceandquantitymodel.dart';

class ProductModel {
  final String productImage;
  final String productName;
  final String productCode;
  PriceAndQuantityModel priceAndQuantityModel;
  

  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productCode,
    required this.priceAndQuantityModel,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productImage': productImage,
      'productName': productName,
      'productCode': productCode,
      'priceAndQuantityModel': priceAndQuantityModel.toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productImage: map['productImage'] as String,
      productName: map['productName'] as String,
      productCode: map['productCode'] as String,
      priceAndQuantityModel: PriceAndQuantityModel.fromMap(map['priceAndQuantityModel'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
