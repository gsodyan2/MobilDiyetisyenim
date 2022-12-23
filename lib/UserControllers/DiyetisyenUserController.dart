import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DataManager/mealManager.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/patient.dart';

import '../model/meal.dart';

class DiyetisyenUserController {
  DiyetisyenUserController({required this.userId});
  String userId;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get profil data .
  Future<GeneralUser> GetProfileInfo() async {
    var dataSnaphot = await _firestore.collection('UserInfo').doc(userId).get();
    var profilData = dataSnaphot.data();

    GeneralUser userData = GeneralUser();

    userData.uid = userId;
    userData.email = profilData!["email"];
    userData.fullName = profilData["fullName"];
    userData.gender = profilData["gender"];
    userData.height = profilData["height"];
    userData.isNutritionist = profilData["isNutritionist"];
    userData.weight = profilData["weight"];
    userData.job = profilData["job"];
    userData.city = profilData["city"];

    return userData;
  }

  // Diyetisyene ait danisanların profillerinin listesi.

  Future<List<Patient>> GetDanisanProfilInfos() async {
    List<Patient> result = <Patient>[];

    var userCollection = await _firestore.collection('UserInfo').get();
    var userList = userCollection.docs;

    for (var userInfoData in userList) {
      print("user searching" + userInfoData.data()["fullName"].toString());
      bool isNutrionist = userInfoData.data()["isNutritionist"];

      print("Is nutrionist = " + isNutrionist.toString());

      if (isNutrionist) continue;

      String patientId = userInfoData.id;
      print("patient Id = " + patientId.toString());

      var nutID = await _GetDanisanDiyetisyenId(patientId);
      print("nut id = " + nutID);

      if (nutID == userId) {
        var patient = await _GetUserInfoForThisDiyetisyen(patientId);
        result.add(patient);
      }
    }

    return result;
  }

  // Diyetisyene ait danısanların değerlendirilmiş öğünlerinin listesi.
  Future<List<Meal>> GetReviewedMeals() async {
    List<Meal> meals = <Meal>[];

    var mealCollection = await _firestore.collection("Meal").get();
    var mealList = mealCollection.docs;

    for (var mealData in mealList) {
      if (mealData.data()["nutritionistId"] == userId) {
        bool isAnswered = mealData.data()["isAnswered"];
        if (isAnswered) {
          String mealId = mealData.id;
          var newMeal = await _GetMealFromCurrentDiyetisyenId(mealId);

          meals.add(newMeal);
        }
      }
    }
    return meals;
  }

  // Diyetisyene ait danışanların değerlendirilmemiş öğünlerinin listesi.
  Future<List<Meal>> GetUnReviewedMeals() async {
    List<Meal> meals = <Meal>[];

    var mealCollection = await _firestore.collection("Meal").get();
    var mealList = mealCollection.docs;

    for (var mealData in mealList) {
      if (mealData.data()["nutritionistId"] == userId) {
        bool isAnswered = mealData.data()["isAnswered"];
        if (!isAnswered) {
          String mealId = mealData.id;
          var newMeal = await _GetMealFromCurrentDiyetisyenId(mealId);

          meals.add(newMeal);
        }
      }
    }
    return meals;
  }

  // ignore: todo
  // TODO Spesific bir tane öğünün onaylanmasının kaydedilmesi.

  void UpdateMealInfo(String mealId, bool isConfirm, String nutriNote) {
    _firestore.collection('Meal').doc(mealId).update({
      "isAnswered": true,
      "isConfirm": isConfirm,
      "nutritionistNote": nutriNote
    });
  }

  // Private yardımcı methodlar
  Future<String> _GetUsernameWithId(String id) async {
    print("requested id = " + id);
    var dataSnapshot = await _firestore.collection('UserInfo').doc(id).get();
    var profilData = dataSnapshot.data();

    return profilData!["fullName"];
  }

  Future<Patient> _GetUserInfoForThisDiyetisyen(String patientID) async {
    var dataSnaphot =
        await _firestore.collection('UserInfo').doc(patientID).get();
    var profilData = dataSnaphot.data();

    GeneralUser userData = GeneralUser();

    userData.uid = userId;
    userData.email = profilData!["email"];
    userData.fullName = profilData["fullName"];
    userData.gender = profilData["gender"];
    userData.height = profilData["height"];
    userData.isNutritionist = profilData["isNutritionist"];
    userData.weight = profilData["weight"];
    userData.job = profilData["job"];
    userData.city = profilData["city"];

    return Patient.fromData(userData, userId);
  }

  Future<Meal> _GetMealFromCurrentDiyetisyenId(String mealId) async {
    var dataSnaphot = await _firestore.collection('Meal').doc(mealId).get();
    var mealData = dataSnaphot.data();

    var id = mealData!["patientId"];
    var patientUserName = await _GetUsernameWithId(id);

    return Meal.fromData(
        patientUserName,
        mealData["patientId"],
        mealData["patientNote"],
        mealData["nutritionistId"],
        mealData["date"],
        mealData["nutritionistNote"],
        mealData["photoUrl"],
        MealManager(),
        mealData["isConfirm"],
        mealId);
  }

  Future<String> _GetDanisanDiyetisyenId(patientID) async {
    var dataSnaphot = await _firestore
        .collection('PatientNutritionistMap')
        .doc(patientID)
        .get();
    var dataMap = dataSnaphot.data();
    return dataMap!["nutritionistId"];
  }
}
