import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';
import 'package:flutter_application_1/model/nutritionist.dart';

class DiyetisyenProfilPage extends StatelessWidget {
  const DiyetisyenProfilPage({super.key, required this.nutritionist});
  final Nutritionist? nutritionist;

  @override
  Widget build(BuildContext context) {
    Nutritionist? _nutritionist = nutritionist;
    return Column(textBaseline: TextBaseline.alphabetic, children: [
      const Center(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage('assets/empty_profile.png'),
        ),
      )),
      PropertyBox(
          propertyName: "İsim Soyisim",
          valueName: _nutritionist?.user.fullName ?? ""),
      PropertyBox(
          propertyName: "Boy",
          valueName: _nutritionist?.user.height.toString() ?? ""),
      PropertyBox(
          propertyName: "Kilo",
          valueName: _nutritionist?.user.weight.toString() ?? ""),
      PropertyBox(
          propertyName: "Cinsiyet",
          valueName: _nutritionist?.user.gender ?? ""),
      PropertyBox(
          propertyName: "Şehir", valueName: _nutritionist?.user.city ?? ""),
      PropertyBox(propertyName: "Meslek", valueName: "Diyetisyen")
    ]);
  }
}

class PropertyBox extends StatelessWidget {
  const PropertyBox({
    Key? key,
    required this.propertyName,
    required this.valueName,
  }) : super(key: key);

  final String propertyName;
  final String valueName;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            border: Border.symmetric(),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 3,
                  color: AppColors.mainBackgrounColor)
            ],
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            propertyName,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            valueName,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          )
        ]));
  }
}

class EmptyBox extends StatelessWidget {
  const EmptyBox({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}
