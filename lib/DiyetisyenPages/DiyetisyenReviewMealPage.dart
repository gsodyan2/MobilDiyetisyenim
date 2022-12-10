import 'package:flutter/material.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenProfilPage.dart';

import '../ThemeRelatedSources/AppColors.dart';

class DiyetisyenReviewMealPage extends StatefulWidget {
  @override
  State<DiyetisyenReviewMealPage> createState() => _DiyetisyenReviewMealPage();
}

class _DiyetisyenReviewMealPage extends State<DiyetisyenReviewMealPage> {
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
            Image.asset(
              "assets/meal_image.jpg",
              height: 100,
            ),
            EmptyBox(width: 1, height: 20),
            // Danışanın adı
            Text("Cem Bozkurt",
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            // Tarih
            Text("Tarih : 02/06/2022 19:33",
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            EmptyBox(width: 1, height: 20),
            // Not girme kısmı
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Yorumunuzu Giriniz',
              ),
            ),
            EmptyBox(width: 1, height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
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
