import 'package:flutter_application_1/DataManager/mealManager.dart';

class Meal {
  String username = "";
  String? patientId;
  String? patientNote;
  String? nutritionistId;
  String? nutritionistNote;
  late String photoUrl;
  late String mealId;
  bool isAnswered = false;
  bool isPassive = false;
  bool isConfirm = false;
  late String date;
  late MealManager mealManager;

  Meal();

  Meal.fromData(
      this.username,
      this.patientId,
      this.patientNote,
      this.nutritionistId,
      this.date,
      this.nutritionistNote,
      this.photoUrl,
      this.mealManager,
      this.isConfirm,
      this.mealId);
}
