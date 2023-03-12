import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Doctor {
  String doctorName;
  String doctorEmail;
  String phoneNumber;
  String doctorImageURL;
  Address address;
  Doctor(
      {required this.doctorName,
      required this.doctorEmail,
      required this.phoneNumber,
      required this.doctorImageURL,
      required this.address});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    var address = Address.fromJson(json['address']);

    return Doctor(
        doctorName: json["doctorName"],
        doctorEmail: json["doctorEmail"],
        phoneNumber: json["phoneNumber"],
        doctorImageURL: json['doctorImageURL'],
        address: address);
  }
}

class Address {
  String latitude;
  String longitude;
  String country;
  String city;
  Address(
      {required this.latitude,
      required this.longitude,
      required this.country,
      required this.city});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        latitude: json['latitude'],
        longitude: json['longitude'],
        country: json['country'],
        city: json['city']);
  }
}
