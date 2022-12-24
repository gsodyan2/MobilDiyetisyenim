import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/DataManager/mealManager.dart';
import 'package:flutter_application_1/model/meal.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ThemeRelatedSources/AppColors.dart';

class MealDetail extends StatefulWidget {
  const MealDetail({super.key, required this.docId});

  final String docId;

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  MealManager _mealManager = MealManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _mealManager.getMeal(widget.docId),
      builder: (context, snapshot) {
        final snap = snapshot.data;

        if (snap != null) {
          return Scaffold(
            appBar: AppBar(
                title: const Center(child: Text("Mobil Diyetisyenim")),
                backgroundColor: AppColors.mainBackgrounColor),
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Öğünüm",
                        style: GoogleFonts.bebasNeue(fontSize: 30),
                      ),
                    ),
                    Container(
                      height: 710,
                      width: 600,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.mainBackgrounColor, width: 3.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                                height: 300,
                                width: 600,
                                child: Image.network(snap!.photoUrl!)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Gönderim zamanı ${snap.date.substring(0, 13)}",
                              style: GoogleFonts.bebasNeue(fontSize: 22),
                            ),
                          ),
                          snap.isConfirm
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text("Durum: ",
                                          style: GoogleFonts.bebasNeue(
                                              fontSize: 20)),
                                      const Icon(
                                        Icons.verified,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                    ])
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Durum: ",
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: 20)),
                                    const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ],
                                ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(
                                      width: 3,
                                      color: const Color.fromRGBO(
                                          255, 139, 113, 1)),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue:
                                      "Öğün Notunuz: ${snap.patientNote}",
                                  maxLines: 6,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(
                                      width: 3,
                                      color: const Color.fromRGBO(
                                          255, 139, 113, 1)),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue:
                                      "Diyetisten Notunuz: ${snap.nutritionistNote ?? "wdqdqw"}",
                                  maxLines: 6,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return SizedBox(height: 100, width: 100);
        }
      },
    );
  }
}
