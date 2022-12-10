import 'package:flutter/material.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenPastReviewsPage.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenProfilPage.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenMainPage.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';

import 'DiyetistenDanisanlarPage.dart';

class DiyetisyenMainPageController extends StatefulWidget {
  const DiyetisyenMainPageController({super.key});
  @override
  State<DiyetisyenMainPageController> createState() =>
      _DiyetisyenMainPageController();
}

class _DiyetisyenMainPageController
    extends State<DiyetisyenMainPageController> {
  int _currentSelectedIndex = 3;
  final List<Widget> _mainPages = <Widget>[
    const DiyetisyenMainPage(),
    const DiyetisyenPastReviewsPage(),
    const DiyetisyenDanisanlarPage(),
    const DiyetisyenProfilPage()
  ];

  // ignore: non_constant_identifier_names
  void _OnPressNavigationItems(int newIndex) {
    setState(() {
      _currentSelectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("Mobil Diyetisyenim")),
          backgroundColor: AppColors.mainBackgrounColor),
      body: _mainPages.elementAt(_currentSelectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentSelectedIndex,
          selectedItemColor: Colors.white,
          backgroundColor: AppColors.mainBackgrounColor,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
          onTap: _OnPressNavigationItems),
    );
  }
}
