import 'dart:convert';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import './subject.dart';

class Services {
  static const String url = "https://fast-badlands-89981.herokuapp.com/";

  static Future<List<Subject>> getInitialSubjects(List<String> subjects) async {
    String subjectsCommaSeparated = "";
    for (int i = 0; i < subjects.length; i++) {
      String sub = subjects[i];
      sub = sub.toLowerCase();
      sub = sub.replaceAll(new RegExp(r" "), "_");
      if (i == subjects.length - 1) {
        subjectsCommaSeparated += sub;
      } else {
        subjectsCommaSeparated += sub + ",";
      }
      print(subjectsCommaSeparated);
    }
    try {
      print(url + "/mainSubjects?subjects=" + subjectsCommaSeparated);
      final response = await http
          .get(url + "/mainSubjects?subjects=" + subjectsCommaSeparated);
      if (response.statusCode == 200) {
        List<Subject> subs = parseSubjects(response.body);
        return subs;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Subject> parseSubjects(String responseBody) {
  final parsed = json.decode(responseBody).cast<String, dynamic>();
  //return parsed.map<Subject>((json) => Subject.fromJson(json)).toList();
  }
}
