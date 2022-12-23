import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/DanisanPages/DanisanDiyetisyenPage.dart';
import 'package:flutter_application_1/auth_pages/signin_page.dart';

import '../ThemeRelatedSources/AppColors.dart';
import '../UserControllers/DiyetisyenUserController.dart';

class DiyetisyenPastReviewsPage extends StatefulWidget {
  const DiyetisyenPastReviewsPage({super.key, required this.userController});

  final DiyetisyenUserController? userController;

  @override
  State<DiyetisyenPastReviewsPage> createState() =>
      _DiyetisyenPastReviewsPageState();
}

class _DiyetisyenPastReviewsPageState extends State<DiyetisyenPastReviewsPage> {
  late List<Widget> mealInfoList = <Widget>[
    Center(
      child: EmptyBox(
        height: 300,
        width: 50,
      ),
    ),
    Center(child: CircularProgressIndicator())
  ];
  bool isPageSet = false;

  @override
  Widget build(BuildContext context) {
    SetPastMealList();

    return ListView(
      children: mealInfoList,
    );
  }

  void SetPastMealList() async {
    if (isPageSet) return;

    var mealList = await widget.userController?.GetReviewedMeals();
    List<Widget> newList = <Widget>[];

    setState(() {
      if (mealList != null) {
        for (var meal in mealList) {
          newList.add(PastMealReviewCard(
              username: meal.username,
              date: meal.date,
              isAprroved: meal.isConfirm,
              imageUrl: meal.photoUrl));
        }

        mealInfoList = newList;
        isPageSet = true;
      }
    });
  }
}

class PastMealReviewCard extends StatelessWidget {
  PastMealReviewCard(
      {Key? key,
      required this.username,
      required this.date,
      required this.isAprroved,
      required this.imageUrl})
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
  final String imageUrl;
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
                child: Image.network(
                  imageUrl,
                  height: 50,
                  width: 75,
                )),
            Column(
              children: [
                Text(username,
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold)),
                Text(date,
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
