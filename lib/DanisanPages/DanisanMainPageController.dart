import 'package:flutter/material.dart';
import 'package:flutter_application_1/DanisanPages/DanisanProfilPage.dart';
import 'package:flutter_application_1/DanisanPages/DanisanMainPage.dart';
import 'package:flutter_application_1/DanisanPages/DanisanDiyetisyenPage.dart';
import 'package:flutter_application_1/DiyetisyenPages/test.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';
import 'package:flutter_application_1/DanisanPages/DanisanPastReviewsPage.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/patient.dart';

void init() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class DanisanMainPageController extends StatefulWidget {
  const DanisanMainPageController({super.key, required this.patient});
  final Patient? patient;

  @override
  _DanisanMainPageController createState() => _DanisanMainPageController();
}

class _DanisanMainPageController extends State<DanisanMainPageController> {
  int _currentSelectedIndex = 3;

  void _OnPressNavigationItems(int newIndex) {
    setState(() {
      _currentSelectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _mainPages = <Widget>[
      DanisanMainPage(patient: widget.patient),
      DanisanPastReviewsPage(patient: widget.patient),
      DanisanDiyetisyenPage(patient: widget.patient),
      DanisanProfilPage(patient: widget.patient)
    ];
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
