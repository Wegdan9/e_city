import 'package:flutter/material.dart';

class Service {
  IconData? serviceIcon;
  String? serviceName;
  VoidCallback? serviceLink;
  String? serviceCategory;


  Service({required this.serviceIcon, required this.serviceName, required this.serviceLink,required this.serviceCategory});
}