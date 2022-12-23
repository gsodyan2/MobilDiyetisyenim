import 'package:flutter/material.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenProfilPage.dart';

import '../ThemeRelatedSources/AppColors.dart';
import '../UserControllers/DiyetisyenUserController.dart';
import 'DiyetisyenMainPage.dart';

class DiyetisyenReviewMealPage extends StatefulWidget {
  DiyetisyenReviewMealPage({
    super.key,
    required this.userController,
    required this.mealId,
    required this.mealPhotoUrl,
    required this.patientName,
    required this.date,
    required this.mainPageWidget,
  });
  final DiyetisyenUserController userController;
  final String mealId;
  final String mealPhotoUrl;
  final String patientName;
  final String date;
  final DiyetisyenMainPageState mainPageWidget;

  @override
  State<DiyetisyenReviewMealPage> createState() => _DiyetisyenReviewMealPage();
}

class _DiyetisyenReviewMealPage extends State<DiyetisyenReviewMealPage> {
  String textNote = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Mobil Diyetisyenim"),
          backgroundColor: AppColors.mainBackgrounColor),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            // Yemeğin Resmi
            Image.network(
              widget.mealPhotoUrl,
              height: 100,
            ),
            EmptyBox(width: 1, height: 20),
            // Danışanın adı
            Text(widget.patientName,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            // Tarih
            Text(widget.date,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            EmptyBox(width: 1, height: 20),
            // Not girme kısmı
            TextField(
              maxLines: 5,
              onChanged: (value) {
                textNote = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Yorumunuzu Giriniz',
              ),
            ),
            EmptyBox(width: 1, height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Nutri approving meal.
                      widget.userController
                          .UpdateMealInfo(widget.mealId, true, textNote);
                      print("meal approved  mealID = " + widget.mealId);
                      widget.mainPageWidget.setState(() {
                        widget.mainPageWidget.isPageSet = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/approve_sign.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Nutri not approving meal.
                      widget.userController
                          .UpdateMealInfo(widget.mealId, false, textNote);
                      print("meal not approved  mealID = " + widget.mealId);
                      widget.mainPageWidget.setState(() {
                        widget.mainPageWidget.isPageSet = false;
                      });

                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/decline_sign.png",
                      height: 65,
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
