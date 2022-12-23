import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/meal.dart';
import 'package:flutter_application_1/model/patient.dart';

class MealManager extends Meal {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Meal');

  addMeal(Meal meal) async {
    await _collectionRef.doc().set({
      "patientId": meal.patientId,
      "date": DateTime.now().toString(),
      "isAnswered": meal.isAnswered,
      "isPassive": meal.isPassive,
      "nutritionistId": meal.nutritionistId,
      "nutritionistNote": null,
      "patientNote": meal.patientNote,
      "photoUrl": meal.photoUrl,
    });
  }

  getMeal(String docId) async {
    var meal = _collectionRef.doc(docId).get();

    return meal;
  }
}
