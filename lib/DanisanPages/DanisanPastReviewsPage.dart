import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_pages/signin_page.dart';
import 'package:flutter_application_1/DanisanPages/DanisanReviewMealPage.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/patient.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ThemeRelatedSources/AppColors.dart';
import 'MealDetailPage.dart';

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
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Meal")
              .where('patientId', isEqualTo: widget.patient!.user.uid)
              .where('isAnswered', isEqualTo: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.length > 0) {
              final snap = snapshot.data!.docs;
              final idList = snap.map((e) => e.id).toList;

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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MealDetail(
                                          docId: snapshot.data!.docs[index].id,
                                        )));
                          },
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
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    children: [
                      Text(
                        "Yanıtlanmış öğününüz bulunmamaktadır.",
                        style: GoogleFonts.bebasNeue(fontSize: 22),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.emoji_emotions_outlined,
                          size: 100,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
