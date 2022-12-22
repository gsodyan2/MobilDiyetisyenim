import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_pages/signin_page.dart';
import 'package:flutter_application_1/DanisanPages/DanisanReviewMealPage.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/patient.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ThemeRelatedSources/AppColors.dart';

class DanisanPastReviewsPage extends StatefulWidget {
  const DanisanPastReviewsPage({super.key, required this.patient});
  final Patient? patient;

  @override
  State<DanisanPastReviewsPage> createState() => _DanisanPastReviewsPageState();
}

class _DanisanPastReviewsPageState extends State<DanisanPastReviewsPage> {
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
              .where('isAnswered', isEqualTo: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final snap = snapshot.data!.docs;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Geçmiş Öğünlerim",
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
                            leading: snap[index]["isConfirm"]
                                ? const Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                    size: 40,
                                  )
                                : const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
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

class DanisanPastReviewsPage2 extends StatelessWidget {
  const DanisanPastReviewsPage2({super.key, required this.patient});
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: false),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: false),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: false),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: false),
        PastMealReviewCard(
            username: "Cem Bozkurt", date: "aaa", isAprroved: true)
      ],
    );
  }
}

class PastMealReviewCard extends StatelessWidget {
  PastMealReviewCard(
      {Key? key,
      required this.username,
      required this.date,
      required this.isAprroved})
      : super(key: key) {
    if (isAprroved) {
      _signImageLink = "assets/approve_sign.png";
    } else {
      _signImageLink = "assets/decline_sign.png";
    }
  }

  // TODO Daha sonra yemek resmi için değişken tanımlanacak.
  final String username;
  final String date;
  final bool isAprroved;

  String _signImageLink = "assets/approve_sign.png";

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: AppColors.danisanCardBackgroundColor,
        margin: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 10,
        color: Color.fromARGB(207, 255, 246, 246),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/meal_image.jpg",
                height: 50,
                width: 75,
              ),
            ),
            Column(
              children: [
                Text("Cem Bozkurt",
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold)),
                Text("Tarih : 02/06/2022 19:33",
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold))
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DanisanReviewMealPage()));
                },
                child: Icon(
                  Icons.navigate_next,
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                _signImageLink,
                height: 50,
                width: 30,
              ),
            )
          ],
        ));
  }
}
