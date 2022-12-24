import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/model/generalUser.dart';
import 'package:flutter_application_1/model/nutritionist.dart';
import 'package:flutter_application_1/model/patient.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('UserInfo');

  Future<User?> signUp(String email, String password, String fullName,
      int weight, int height, String gender, String city, String job) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _collectionRef.doc(user.user?.uid).set({
      "email": email,
      "fullName": fullName,
      "city": city,
      "job": job,
      "gender": gender,
      "height": height,
      "weight": weight,
      "isNutritionist": false
    });

    await FirebaseFirestore.instance
        .collection("PatientNutritionistMap")
        .doc(user.user?.uid)
        .set({"nutritionistId": "AOd8gIw4zhNBuWFv0uuz6lutvPP2"});

    return user.user;
  }

  Future<GeneralUser?> signIn(
    String email,
    String password,
  ) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      GeneralUser? currentUser = await getSignInUserData(user.user?.uid);

      return currentUser;
    } on FirebaseAuthException catch (e) {
      print('hata');
    }
  }

  Future<Patient?> getPatient(GeneralUser? currentUser) async {
    String nutId = await getNutritionistId(currentUser?.uid);
    return Patient.fromData(currentUser!, nutId);
  }

  Future<Nutritionist> getNutrionist(GeneralUser currentUser) async {
    return Nutritionist.fromData(currentUser);
  }

  Future<Nutritionist> getNutritionistWithPatientId(String? patientId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('PatientNutritionistMap')
          .doc(patientId)
          .get();

      Map<String, dynamic>? nutritionistId = querySnapshot.data();

      String nutrionistId = nutritionistId!["nutritionistId"];

      DocumentSnapshot<Map<String, dynamic>> nutritionistSnapshot =
          await _firestore.collection('UserInfo').doc(nutrionistId).get();

      Map<String, dynamic>? nutritionistData = nutritionistSnapshot.data();

      String uid = nutrionistId;
      String email = nutritionistData!["email"];
      String fullName = nutritionistData["fullName"];
      String job = nutritionistData["job"];
      String gender = nutritionistData["gender"];
      int height = nutritionistData["height"];
      int weight = nutritionistData["weight"];
      bool isNutritionist = nutritionistData!["isNutritionist"];
      String city = nutritionistData["city"];

      GeneralUser _generalUser = GeneralUser.withData(uid, email, fullName, job,
          gender, height, weight, isNutritionist, city);
      Nutritionist _nutritionist = Nutritionist();
      _nutritionist.user = _generalUser;

      return _nutritionist;
    } catch (e) {
      return Nutritionist();
    }
  }

  signout() async {
    return await _auth.signOut();
  }

  Future<GeneralUser> getSignInUserData(String? uid) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('UserInfo').doc(uid).get();

    // Get data from docs and convert map to List
    Map<String, dynamic>? allData = querySnapshot.data();
    GeneralUser generalUser = GeneralUser();
    generalUser.uid = uid!;
    generalUser.email = allData!["email"];
    generalUser.fullName = allData["fullName"];
    generalUser.gender = allData["gender"];
    generalUser.height = allData["height"];
    generalUser.isNutritionist = allData["isNutritionist"];
    generalUser.weight = allData["weight"];
    generalUser.job = allData["job"];
    generalUser.city = allData["city"];
    return generalUser;
  }

//hastanın diyetisyen
  Future<String> getNutritionistId(String? uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('PatientNutritionistMap').doc(uid).get();

      Map<String, dynamic>? allData = querySnapshot.data();

      return allData!["nutritionistId"];
    } catch (e) {
      return "";
    }
  }
}
