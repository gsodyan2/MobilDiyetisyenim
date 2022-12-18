import 'package:flutter/material.dart';
import 'package:flutter_application_1/DanisanPages/DanisanProfilPage.dart';
import 'package:flutter_application_1/DanisanPages/DanisanMainPage.dart';
import 'package:flutter_application_1/DanisanPages/DanisanDiyetisyenPage.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';
import 'package:flutter_application_1/DanisanPages/DanisanPastReviewsPage.dart';


class DanisanMainPageController extends StatefulWidget {
  const DanisanMainPageController({super.key});
  @override
  State<DanisanMainPageController> createState() =>
      _DanisanMainPageController();
}

class _DanisanMainPageController
    extends State<DanisanMainPageController> {
  int _currentSelectedIndex = 3;
  final List<Widget> _mainPages = <Widget>[
    const DanisanMainPage(),
    const DanisanPastReviewsPage(),
    const DanisanDiyetisyenPage(),
    const DanisanProfilPage()
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
