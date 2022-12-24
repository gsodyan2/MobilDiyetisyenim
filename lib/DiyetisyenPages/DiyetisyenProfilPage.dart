import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';
import 'package:flutter_application_1/UserControllers/DiyetisyenUserController.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/nutritionist.dart';

class DiyetisyenProfilPage extends StatefulWidget {
  DiyetisyenProfilPage({super.key, required this.userController});

  final DiyetisyenUserController? userController;

  @override
  State<DiyetisyenProfilPage> createState() => _DiyetisyenProfilPageState();
}

class _DiyetisyenProfilPageState extends State<DiyetisyenProfilPage> {
  GeneralUser? profilInfo;
  bool isProfilSet = false;

  List<Widget> mainWidget = <Widget>[
    Center(
      child: EmptyBox(height: 300, width: 50),
    ),
    Center(child: CircularProgressIndicator())
  ];

  @override
  Widget build(BuildContext context) {
    SetProfilInfo();
    return Column(textBaseline: TextBaseline.alphabetic, children: mainWidget);
  }

  void SetProfilInfo() async {
    if (isProfilSet) return;
    print("Set profil info worked");
    var x = await widget.userController!.GetProfileInfo();
    setState(() {
      profilInfo = x;
    });

    List<Widget> profilSetupWidget = <Widget>[
      const Center(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: CircleAvatar(
          radius: 75,
          backgroundImage: NetworkImage(
              "https://www.shutterstock.com/image-vector/nutritionist-diet-260nw-411321337.jpg"),
        ),
      )),
      PropertyBox(
          propertyName: "İsim Soyisim", valueName: profilInfo?.fullName ?? ""),
      PropertyBox(
          propertyName: "Boy", valueName: profilInfo?.height.toString() ?? ""),
      PropertyBox(
          propertyName: "Kilo", valueName: profilInfo?.weight.toString() ?? ""),
      PropertyBox(
          propertyName: "Cinsiyet", valueName: profilInfo?.gender ?? ""),
      PropertyBox(propertyName: "Şehir", valueName: profilInfo?.city ?? ""),
      PropertyBox(propertyName: "Meslek", valueName: "Diyetisyen")
    ];

    mainWidget = profilSetupWidget;
    isProfilSet = true;
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
