import 'package:flutter/material.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';

class DiyetisyenDanisanlarPage extends StatelessWidget {
  const DiyetisyenDanisanlarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      DanisanInfoCard(
        username: "Cem Bozkurt",
        weight: "68",
        height: "1.77",
        bodyIndex: "1",
      ),
      DanisanInfoCard(
        username: "Cem Bozkurt",
        weight: "68",
        height: "1.77",
        bodyIndex: "1",
      ),
      DanisanInfoCard(
        username: "Cem Bozkurt",
        weight: "68",
        height: "1.77",
        bodyIndex: "1",
      ),
      DanisanInfoCard(
        username: "Cem Bozkurt",
        weight: "68",
        height: "1.77",
        bodyIndex: "1",
      ),
      DanisanInfoCard(
        username: "Cem Bozkurt",
        weight: "68",
        height: "1.77",
        bodyIndex: "1",
      ),
      DanisanInfoCard(
        username: "Cem Bozkurt",
        weight: "68",
        height: "1.77",
        bodyIndex: "1",
      ),
      DanisanInfoCard(
        username: "Cem Bozkurt",
        weight: "68",
        height: "1.77",
        bodyIndex: "1",
      ),
      DanisanInfoCard(
        username: "Cem Bozkurt",
        weight: "68",
        height: "1.77",
        bodyIndex: "1",
      )
    ]);
  }
}

class DanisanInfoCard extends StatelessWidget {
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
              Text(username,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold)),
              Text('Kilo : $weight         Boy : $height ',
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold)),
              Text("Vücut Kitle Endeksi : $bodyIndex",
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold))
            ])));
  }
}
