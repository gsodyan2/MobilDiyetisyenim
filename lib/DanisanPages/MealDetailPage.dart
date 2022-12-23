import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/DataManager/mealManager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ThemeRelatedSources/AppColors.dart';

class MealDetail extends StatefulWidget {
  const MealDetail({super.key, required this.docId});

  final String docId;

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  final TextEditingController _noteController = TextEditingController();
  MealManager _mealManager = MealManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _mealManager.getMeal(widget.docId),
      builder: (context, snapshot) {
        final snap = snapshot.data;

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
                    width: 350,
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
                          padding: const EdgeInsets.all(.0),
                          child: Container(
                              height: 300,
                              width: 400,
                              child: Image.network(
                                  "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg")),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                maxLines: 6,
                                controller: _noteController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        'Diyetisyene notunuzu iletebilirsiniz.'),
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
                                    color:
                                        const Color.fromRGBO(255, 139, 113, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                maxLines: 6,
                                controller: _noteController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        'Diyetisyene notunuzu iletebilirsiniz.'),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.verified,
                          size: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
