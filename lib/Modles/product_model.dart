import 'package:flutter/material.dart';

class ProductModel {
  int? id;
  String? title;
  int? price;
  String? description;

  List<dynamic>? images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: json["images"]);
  }

  // static List<ProductModel> recipefromsnapshot(Strinsnapshot) {
  //   return snapshot.map((e) {
  //     return ProductModel.fromJson(e);
  //   }).toString();
  // }
}
