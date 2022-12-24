import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/meal.dart';
import 'package:flutter_application_1/model/patient.dart';

class MealManager extends Meal {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Meal');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addMeal(Meal meal) async {
    await _collectionRef.doc().set({
      "patientId": meal.patientId,
      "date": DateTime.now().toString(),
      "isAnswered": meal.isAnswered,
      "isConfirm": false,
      "isPassive": meal.isPassive,
      "nutritionistId": meal.nutritionistId,
      "nutritionistNote": "",
      "patientNote": meal.patientNote,
      "photoUrl": meal.photoUrl,
    });
  }

  Future<Meal> getMeal(String docId) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('Meal').doc(docId).get();

    Map<String, dynamic>? mealData = querySnapshot.data();
    Meal meal = Meal();

    meal.date = mealData!["date"];
    meal.photoUrl = mealData["photoUrl"];
    meal.isConfirm = mealData["isConfirm"];
    meal.patientId = mealData["patientId"];
    meal.patientNote = mealData["patientNote"];
    meal.isConfirm = mealData["isConfirm"];
    meal.nutritionistId = mealData["nutritionistId"];
    meal.isPassive = mealData["isPassive"];
    meal.isAnswered = mealData["isAnswered"];
    meal.nutritionistNote = mealData["nutritionistNote"];

    return meal;
  }
}
