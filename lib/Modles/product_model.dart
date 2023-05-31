import 'package:flutter/material.dart';

class ProductModel {
  int? id;
  String? title;
  // String? price;
  String? description;
  String? categories;

  String? images;

  ProductModel({
    required this.id,
    required this.title,
    // required this.price,
    required this.description,
    required this.images,
  });

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
        id: json["id"],
        title: json["title"],
        // price: json["price"],
        description: json["description"],
        images: json["images"]
        // ??
        //     "https://cms-cdn.katalon.com/large_Feature_Img_f318f0b527.png",
        );
  }

  // static List<ProductModel> recipefromsnapshot(Strinsnapshot) {
  //   return snapshot.map((e) {
  //     return ProductModel.fromJson(e);
  //   }).toString();
  // }
}
