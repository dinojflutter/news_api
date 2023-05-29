import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  Future<void> getallproducts() async {
    var response = await http.get(
      Uri.parse("https://api.escuelajs.co/api/v1/products"),
    );
    var data = jsonDecode(response.body);
  }
}
