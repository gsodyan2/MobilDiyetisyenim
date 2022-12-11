import 'package:flutter/material.dart';
import 'package:flutter_application_1/DanisanPages/DanisanProfilPage.dart';

import '../ThemeRelatedSources/AppColors.dart';

class DanisanReviewMealPage extends StatefulWidget {
  @override
  State<DanisanReviewMealPage> createState() => _DanisanReviewMealPage();
}

class _DanisanReviewMealPage extends State<DanisanReviewMealPage> {
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
            Text("Gökhan soydan",
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
                hintText: 'DB den yorum gelicek',
                enabled: false, 
              ),
            ),
            EmptyBox(width: 1, height: 20),
            
          ]),
        ),
      ),
    );
  }
}
