import 'package:flutter/material.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';

import '../DanisanPages/DanisanDiyetisyenPage.dart';
import '../UserControllers/DiyetisyenUserController.dart';

class DiyetisyenDanisanlarPage extends StatefulWidget {
  DiyetisyenDanisanlarPage({super.key, required this.userController});

  final DiyetisyenUserController? userController;

  @override
  State<DiyetisyenDanisanlarPage> createState() =>
      _DiyetisyenDanisanlarPageState();
}

class _DiyetisyenDanisanlarPageState extends State<DiyetisyenDanisanlarPage> {
  late List<Widget> profilInfo = <Widget>[
    Center(
      child: EmptyBox(height: 300, width: 50),
    ),
    Center(child: CircularProgressIndicator())
  ];

  bool isPageSet = false;

  @override
  Widget build(BuildContext context) {
    SetDanisanlarList();

    return ListView(children: profilInfo);
  }

  void SetDanisanlarList() async {
    if (isPageSet) return;
    var danisanUsersList = await widget.userController?.GetDanisanProfilInfos();
    List<Widget> newList = <Widget>[];

    setState(() {
      if (danisanUsersList != null) {
        for (var danisan in danisanUsersList) {
          newList.add(DanisanInfoCard(
              username: danisan.user.fullName,
              weight: danisan.user.weight.toString(),
              height: danisan.user.height.toString(),
              bodyIndex: danisan.vki.toString()));
        }
      }
      profilInfo = newList;
      isPageSet = true;
    });
  }
}

class DanisanInfoCard extends StatefulWidget {
  const DanisanInfoCard(
      {Key? key,
      required this.username,
      required this.weight,
      required this.height,
      required this.bodyIndex})
      : super(key: key);

  final String username;
  final String weight;
  final String height;
  final String bodyIndex;

  @override
  State<DanisanInfoCard> createState() => _DanisanInfoCardState();
}

class _DanisanInfoCardState extends State<DanisanInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: AppColors.danisanCardBackgroundColor,
        margin: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 10,
        color: AppColors.danisanCardBackgroundColor,
        child: SizedBox(
            height: 50,
            child: Column(children: [
              Text(widget.username,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold)),
              Text('Kilo : ${widget.weight}         Boy : ${widget.height} ',
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold)),
              Text("Vücut Kitle Endeksi : ${widget.bodyIndex}",
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold))
            ])));
  }
}
