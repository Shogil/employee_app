import 'dart:convert';
import 'dart:io';

import 'package:employee_app/db/db_connect.dart';
import 'package:employee_app/models/employees.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class FetchEmpDetails {
  Future<List<Employees>> details() async {
    final response = await http
        .get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));

    // ignore: deprecated_member_use
    var emp = List<Employees>();

    if (response.statusCode == 200) {
      var empJson = json.decode(response.body);
      for (var i in empJson) {
        emp.add(Employees.fromJson(i));
      }
    }
    return emp;
  }
}
