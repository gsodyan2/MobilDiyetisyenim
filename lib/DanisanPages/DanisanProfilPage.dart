import 'package:flutter/material.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';

class DanisanProfilPage extends StatelessWidget {
  const DanisanProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(textBaseline: TextBaseline.alphabetic, children: [
      Container(  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: Color(0xFFFF8B71),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0.05),
            child: Text(
              'PROFİL BİLGİLERİM',
              textAlign: TextAlign.center,
            ),
          ),),
      const Center(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage('assets/empty_profile.png'),
        ),
      )),
      PropertyBox(propertyName: "İsim", valueName: "Gökahn Soydan"),
      PropertyBox(propertyName: "Yaş", valueName: "29"),
      PropertyBox(propertyName: "Cinsiyet", valueName: "Erkek"),
      PropertyBox(propertyName: "Numara", valueName: "5554443322"),
      PropertyBox(propertyName: "Email", valueName: "cm@email.com"),
      PropertyBox(propertyName: "Okul", valueName: "İstanbul Üniversitesi")
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


