import 'package:flutter_application_1/DataManager/mealManager.dart';

class Meal {
  String? patientId;
  String? patientNote;
  String? nutritionistId;
  String? nutritionistNote;
  String? photoUrl;
  bool isAnswered = false;
  bool isPassive = false;
  late DateTime date;
  late MealManager mealManager;

  Meal();

  Meal.fromData(this.patientId, this.patientNote, this.nutritionistId,
      this.date, this.nutritionistNote, this.photoUrl, this.mealManager);
}
