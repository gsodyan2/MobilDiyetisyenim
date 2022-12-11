import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_pages/signin_page.dart';

import '../ThemeRelatedSources/AppColors.dart';

class DiyetisyenPastReviewsPage extends StatelessWidget {
  const DiyetisyenPastReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: false),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: false),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: false),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: false),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true)
      ],
    );
  }
}

class PastMealReviewCard extends StatelessWidget {
  PastMealReviewCard(
      {Key? key,
      required this.username,
      required this.date,
      required this.isAprroved})
      : super(key: key) {
    if (isAprroved) {
      _signImageLink = "assets/approve_sign.png";
    } else {
      _signImageLink = "assets/decline_sign.png";
    }
  }

  // TODO Daha sonra yemek resmi için değişken tanımlanacak.
  final String username;
  final String date;
  final bool isAprroved;

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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                _signImageLink,
                height: 50,
                width: 30,
              ),
            )
          ],
        ));
  }
}
