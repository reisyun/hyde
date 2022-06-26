import 'dart:convert';
import 'package:flutter/services.dart';

// Fetch content from the json file
Future<List<dynamic>> readJson(String source) async {
  String response = await rootBundle.loadString(source);
  List<dynamic> data = await json.decode(response);

  return data;
}
