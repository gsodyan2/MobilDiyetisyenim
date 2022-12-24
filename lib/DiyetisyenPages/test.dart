import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/DataManager/mealManager.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';
import 'package:flutter_application_1/model/meal.dart';
import 'package:flutter_application_1/model/patient.dart';
import 'package:flutter_application_1/service/storage.dart';
import 'package:image_picker/image_picker.dart';

class Test extends StatelessWidget {
  final Object? patient;
  Test(this.patient, {super.key});
  final TextEditingController _mealNote = TextEditingController();
  final Storage _storage = Storage();
  final MealManager _mealManager = MealManager();

  @override
  Widget build(BuildContext context) {
    Patient? _patient = patient as Patient?;
    String? _photoUrl;
    Meal meal = Meal();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.mainBackgrounColor,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(100),
          child: Column(
            children: [
              Text(_patient?.user.fullName ?? ""),
              Text(_patient?.user.weight.toString() ?? ""),
              Text(_patient?.user.height.toString() ?? ""),
              Text(_patient?.user.isNutritionist.toString() ?? ""),
              TextFormField(
                controller: _mealNote,
              ),
              IconButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    _photoUrl = await _storage.uploadImage(file);
                  },
                  icon: const Icon(Icons.photo)),
              ElevatedButton(
                  onPressed: () {
                    meal.photoUrl = _photoUrl;
                    meal.patientId = _patient?.user.uid;
                    meal.patientNote = _mealNote.text;
                    meal.nutritionistId = _patient?.nutritionistId;
                    meal.date = DateTime.now().toString();

                    _mealManager.addMeal(meal);
                  },
                  child: Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
