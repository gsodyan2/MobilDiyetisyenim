import 'package:flutter_application_1/model/generalUser.dart';

class Patient {
  late GeneralUser user;
  late String nutritionistId;
  late double vki;

  Patient();
  Patient.fromData(this.user, this.nutritionistId) {
    var height = user.height / 100;
    vki = user.weight / (height * height);
  }
}
