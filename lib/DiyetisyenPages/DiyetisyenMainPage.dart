import 'package:flutter/material.dart';
import 'package:flutter_application_1/DanisanPages/DanisanMainPage.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenReviewMealPage.dart';

import '../ThemeRelatedSources/AppColors.dart';
import '../UserControllers/DiyetisyenUserController.dart';

class DiyetisyenMainPage extends StatefulWidget {
  const DiyetisyenMainPage({super.key, required this.userController});
  final DiyetisyenUserController userController;

  @override
  State<DiyetisyenMainPage> createState() => DiyetisyenMainPageState();
}

class DiyetisyenMainPageState extends State<DiyetisyenMainPage> {
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
    SetMealList();
    return ListView(children: mealInfoList);
  }

  void SetMealList() async {
    if (isPageSet) return;

    var mealList = await widget.userController?.GetUnReviewedMeals();
    List<Widget> newList = <Widget>[];

    setState(() {
      if (mealList != null) {
        for (var meal in mealList) {
          newList.add(RequestedMealReviewCard(
            username: meal.username,
            date: meal.date,
            imageUrl: meal.photoUrl,
            mealId: meal.mealId,
            userController: widget.userController,
            isPageSet: isPageSet,
            mainPageWidget: this,
          ));
        }
      }
    });

    if (newList.length == 0) {
      newList.add(Center(
          child: Column(
        children: [
          EmptyBox(width: 1, height: 250),
          Text(
            "Bekleyen Öğün Bildirimi Yok",
            style: TextStyle(color: Colors.grey),
          )
        ],
      )));
    }
    mealInfoList = newList;
    isPageSet = true;
  }
}

class RequestedMealReviewCard extends StatelessWidget {
  RequestedMealReviewCard(
      {Key? key,
      required this.username,
      required this.date,
      required this.imageUrl,
      required this.userController,
      required this.mealId,
      required this.isPageSet,
      required this.mainPageWidget})
      : super(key: key);

  final String username;
  final String date;
  final String imageUrl;
  final String mealId;
  final bool isPageSet;
  final DiyetisyenUserController userController;
  final DiyetisyenMainPageState mainPageWidget;

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
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiyetisyenReviewMealPage(
                                userController: userController,
                                mealId: mealId,
                                mealPhotoUrl: imageUrl,
                                patientName: username,
                                date: date,
                                mainPageWidget: mainPageWidget,
                              )));
                },
                child: Icon(
                  Icons.navigate_next,
                ))
          ],
        ));
  }
}
