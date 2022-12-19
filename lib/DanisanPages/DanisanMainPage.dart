import 'package:flutter/material.dart';
import 'package:flutter_application_1/DanisanPages/DanisanReviewMealPage.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/patient.dart';

import '../ThemeRelatedSources/AppColors.dart';

class DanisanMainPage extends StatefulWidget {
  const DanisanMainPage({super.key, required this.patient});
  final Patient? patient;
  @override
  State<DanisanMainPage> createState() => _DanisanMainPage();
}

class _DanisanMainPage extends State<DanisanMainPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: Color(0xFFFF8B71),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0.05),
            child: Text(
              'DİYETİSYEN BİLGİLERİM',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Center(
            child: Padding(
          padding: EdgeInsets.all(12),
          child: CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage('assets/empty_profile.png'),
          ),
        )),
        PropertyBox(propertyName: "İsim", valueName: ""),
        PropertyBox(propertyName: "Yaş", valueName: "29"),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: Color(0xFFFF8B71),
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 0.05),
              child: Text(
                'YANIT BEKLEYEN ÖĞÜNLER',
                textAlign: TextAlign.center,
              ),
            )),
        RequestedMealReviewCard(username: " Cem Bozkurt", date: "date")
      ],
    );
  }
}

class RequestedMealReviewCard extends StatelessWidget {
  RequestedMealReviewCard(
      {Key? key, required this.username, required this.date})
      : super(key: key);

  // TODO Daha sonra yemek resmi için değişken tanımlanacak.
  final String username;
  final String date;

  String _signImageLink = "assets/approve_sign.png";

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: AppColors.danisanCardBackgroundColor,
        margin: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 10,
        color: Color.fromARGB(207, 255, 246, 246),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/meal_image.jpg",
                height: 50,
                width: 75,
              ),
            ),
            Column(
              children: [
                Text("Cem Bozkurt",
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold)),
                Text("Tarih : 02/06/2022 19:33",
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold))
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DanisanReviewMealPage()));
                },
                child: Icon(
                  Icons.navigate_next,
                ))
          ],
        ));
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
