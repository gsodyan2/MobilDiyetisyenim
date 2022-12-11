import 'package:flutter_application_1/model/generalUser.dart';

class Patient {
  late GeneralUser user;
  late String nutritionistId;

  Patient();

  Patient.fromData(this.user, this.nutritionistId);
}
