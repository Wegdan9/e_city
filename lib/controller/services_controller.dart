import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/Links.dart';
import '../model/service.dart';

class ServicesController with ChangeNotifier{

  List<Service> _services =[
    ///Reservation
    Service(
        serviceIcon: null,
        serviceName: 'الحجوزات',
        serviceLink: null,
        serviceCategory: null),
    Service(
        serviceCategory: 'reservation',
        serviceIcon: Icons.fastfood_outlined,
        serviceName: 'حجز المطاعم',
        serviceLink: () async{
          // check url whether supported or not
          if (await canLaunchUrl(Uri.parse(Links.RESTURANT))) {
            await launch(Links.RESTURANT,
              forceWebView: true,
              enableDomStorage: true,
              enableJavaScript: true,
            );
          } else {
            print('Url is not supported');
          }
        },

    ),
    Service(
      serviceCategory: 'reservation',
      serviceIcon: Icons.hotel,
      serviceName: 'حجز الفنادق',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.HOTEL))) {
          await launch(Links.HOTEL,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'reservation',
      serviceIcon: Icons.flight,
      serviceName: 'حجز الطيران',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.FLIGHT))) {
          await launch(Links.FLIGHT,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'reservation',
      serviceIcon: Icons.apartment,
      serviceName: 'حجز شركات السياحة',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.TOURISM))) {
          await launch(Links.TOURISM,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    ///Egyptian Services
    Service(
        serviceIcon: null,
        serviceName: 'خدمات المصريين',
        serviceLink: null,
        serviceCategory: null),
    Service(
      serviceCategory: 'egyptianServices',
      serviceIcon: Icons.person_pin_outlined,
      serviceName: 'استخراج رقم قومي',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.IDENTIFICATION))) {
          await launch(Links.IDENTIFICATION,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'egyptianServices',
      serviceIcon: Icons.document_scanner,
      serviceName: 'استخراج شهادة ميلاد',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.BIRTHDATE_CERTIFICATE))) {
          await launch(Links.TOURISM,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'egyptianServices',
      serviceIcon: Icons.drive_eta,
      serviceName: 'استخراج مخالفات القيادة',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.DRIVERS_LICENSE))) {
          await launch(Links.DRIVERS_LICENSE,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'egyptianServices',
      serviceIcon: Icons.electrical_services,
      serviceName: 'خدمات الكهرباء',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.ELECTRICITY))) {
          await launch(Links.ELECTRICITY,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'egyptianServices',
      serviceIcon: Icons.water_drop_rounded,
      serviceName: 'خدمات المياة',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.WATER))) {
          await launch(Links.WATER,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'egyptianServices',
      serviceIcon: Icons.phone,
      serviceName: 'خدمات التليفون',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.TELEPHONE))) {
          await launch(Links.TELEPHONE,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    ///Foreigners Services
    Service(
        serviceIcon: null,
        serviceName: 'خدمات الاجانب',
        serviceLink: null,
        serviceCategory: null),
    Service(
      serviceCategory: 'foreignersServices',
      serviceIcon: Icons.book_rounded,
      serviceName: 'ابلاغ عن فقدان جواز سفر',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.PASSPORT))) {
          await launch(Links.PASSPORT,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'foreignersServices',
      serviceIcon: Icons.home_work,
      serviceName: 'القنصليات والسفارات',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.EMBASSIES))) {
          await launch(Links.EMBASSIES,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'foreignersServices',
      serviceIcon: Icons.car_crash,
      serviceName: 'طلب تأجيل سيارة خاصة',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.CAR_RENT))) {
          await launch(Links.CAR_RENT,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
    Service(
      serviceCategory: 'foreignersServices',
      serviceIcon: Icons.report_problem,
      serviceName: 'تقديم شكاوي',
      serviceLink: () async{
        // check url whether supported or not
        if (await canLaunchUrl(Uri.parse(Links.PROBLEM))) {
          await launch(Links.PROBLEM,
            forceWebView: true,
            enableDomStorage: true,
            enableJavaScript: true,
          );
        } else {
          print('Url is not supported');
        }
      },

    ),
  ];

  List<Service> get getServices => [..._services];
  List<Service> findByCategory(String category){
    return _services.where((element) => element.serviceCategory == category).toList();
  }
}