import 'package:flutter/material.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/nutritionist.dart';
import 'package:flutter_application_1/model/patient.dart';
import 'package:flutter_application_1/service/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class DanisanDiyetisyenPage extends StatelessWidget {
  DanisanDiyetisyenPage({super.key, required this.patient});
  final Patient? patient;

  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    return FutureBuilder(
      future: _auth.getNutritionistWithPatientId(patient?.user.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final snapshotUserData = snapshot.data?.user;
          return Column(textBaseline: TextBaseline.alphabetic, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'DİYETİSYEN BİLGİLERİM',
                style: GoogleFonts.bebasNeue(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
                child: Padding(
              padding: EdgeInsets.all(12),
              child: CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(
                  "https://www.shutterstock.com/image-vector/nutritionist-diet-260nw-411321337.jpg",
                ),
              ),
            )),
            PropertyBox(
                propertyName: "İsim Soyisim",
                valueName: snapshotUserData!.fullName),
            PropertyBox(
                propertyName: "Cinsiyet", valueName: snapshotUserData.gender),
            PropertyBox(
                propertyName: "Şehir", valueName: snapshotUserData.city),
            PropertyBox(
                propertyName: "Meslek", valueName: snapshotUserData.job),
          ]);
        } else {
          return SizedBox(
            height: 100,
            width: 100,
          );
        }
      },
    );
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
