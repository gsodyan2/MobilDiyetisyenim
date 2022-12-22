import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DanisanPages/DanisanReviewMealPage.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/patient.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ThemeRelatedSources/AppColors.dart';

class DanisanMainPage extends StatefulWidget {
  const DanisanMainPage({super.key, required this.patient});

  final Patient? patient;

  @override
  State<DanisanMainPage> createState() => _DanisanMainPageState();
}

class _DanisanMainPageState extends State<DanisanMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Meal")
              .where('patientId', isEqualTo: widget.patient!.user.uid)
              .where('isAnswered', isEqualTo: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final snap = snapshot.data!.docs;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Yanıt Bekleyen Öğünlerim",
                      style: GoogleFonts.bebasNeue(fontSize: 32),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        color: AppColors.danisanCardBackgroundColor,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.danisanCardBackgroundColor,
                          ),
                          onPressed: () {},
                          child: ListTile(
                            leading: const Icon(
                              Icons.query_builder_rounded,
                              color: Colors.amberAccent,
                              size: 40,
                            ),
                            title: Container(
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  snap[index]["photoUrl"],
                                ),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 1),
                              child: Text(
                                "Gönderim Zamanı : ${snap[index]["date"].toString().substring(0, 10)}",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return const SizedBox(
                height: 100,
                width: 100,
              );
            }
          },
        ),
      ),
    );
  }
}
