import 'package:flutter/material.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenReviewMealPage.dart';

import '../ThemeRelatedSources/AppColors.dart';

class DiyetisyenMainPage extends StatefulWidget {
  const DiyetisyenMainPage({super.key});

  @override
  State<DiyetisyenMainPage> createState() => _DiyetisyenMainPage();
}

class _DiyetisyenMainPage extends State<DiyetisyenMainPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
                          builder: (context) => DiyetisyenReviewMealPage()));
                },
                child: Icon(
                  Icons.navigate_next,
                ))
          ],
        ));
  }
}
