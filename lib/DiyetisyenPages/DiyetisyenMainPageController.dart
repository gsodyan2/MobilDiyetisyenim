import 'package:flutter/material.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenPastReviewsPage.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenProfilPage.dart';
import 'package:flutter_application_1/DiyetisyenPages/DiyetisyenMainPage.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';
import 'package:flutter_application_1/UserControllers/DiyetisyenUserController.dart';
import 'package:flutter_application_1/model/nutritionist.dart';

import 'DiyetistenDanisanlarPage.dart';

class DiyetisyenMainPageController extends StatefulWidget {
  DiyetisyenMainPageController({super.key, required this.nutritionist}) {
    userController = DiyetisyenUserController(userId: nutritionist!.user.uid);
  }

  final Nutritionist? nutritionist;
  late DiyetisyenUserController userController;

  @override
  State<DiyetisyenMainPageController> createState() =>
      _DiyetisyenMainPageController();
}

class _DiyetisyenMainPageController
    extends State<DiyetisyenMainPageController> {
  int _currentSelectedIndex = 0;

  // ignore: non_constant_identifier_names
  void _OnPressNavigationItems(int newIndex) {
    if (widget.userController == null) {
      print("usercontroller null");
    } else {
      print("usercontroller not null");
    }
    setState(() {
      _currentSelectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _mainPages = <Widget>[
      DiyetisyenMainPage(
        userController: widget.userController,
      ),
      DiyetisyenPastReviewsPage(userController: widget.userController),
      DiyetisyenDanisanlarPage(userController: widget.userController),
      DiyetisyenProfilPage(userController: widget.userController)
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
