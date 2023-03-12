import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/doctor.dart';

class DoctorProvidor extends ChangeNotifier {
  final List<Doctor> doctors = [];

  Future getDoctors() async {
    String username = 'FlutterDev@LuminousKey.com';
    String password = 'Flutter2023';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    var url =
        Uri.parse('https://flutter.linked4med.com/api/Doctors/GetDoctorsInfo');
    var response = await http
        .get(url, headers: <String, String>{'authorization': basicAuth});
    var resbody = json.decode(response.body);
    for (var i in resbody) {
      doctors.add(Doctor.fromJson(i));
    }
    notifyListeners();
    //return doctors;
  }
}
