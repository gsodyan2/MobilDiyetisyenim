import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/DataManager/mealManager.dart';
import 'package:flutter_application_1/ThemeRelatedSources/AppColors.dart';
import 'package:flutter_application_1/model/meal.dart';
import 'package:flutter_application_1/model/patient.dart';
import 'package:flutter_application_1/service/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class InsertMeal extends StatefulWidget {
  InsertMeal(this.patient, {super.key});
  final Patient? patient;

  @override
  State<InsertMeal> createState() => _InsertMealState(this.patient);
}

class _InsertMealState extends State<InsertMeal> {
  final Patient? _patient;
  final TextEditingController _noteController = TextEditingController();
  final MealManager _mealManager = MealManager();
  final Meal _meal = Meal();
  String? imageUrl;
  final Storage _storage = Storage();
  _InsertMealState(this._patient);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Öğün Gönder",
                  style: GoogleFonts.bebasNeue(fontSize: 52),
                ),
                Container(
                  height: 600,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.mainBackgrounColor, width: 3.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            height: 350,
                            width: 400,
                            child: Image.network(imageUrl ??
                                "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg")),
                      ),
                      IconButton(
                          onPressed: () async {
                            ImagePicker imagePicker = ImagePicker();
                            XFile? file = await imagePicker.pickImage(
                                source: ImageSource.camera);
                            String? newUrl = await _storage.uploadImage(file);
                            setState(() {
                              imageUrl = newUrl;
                            });
                          },
                          icon: const Icon(Icons.camera_alt_outlined)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.orange[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 40,
                      width: 200,
                      child: TextButton(
                          onPressed: () {
                            _meal.nutritionistId = _patient?.nutritionistId;
                            _meal.photoUrl = imageUrl!;
                            _meal.patientId = _patient?.user.uid;
                            _meal.date = DateTime.now().toString();
                            _meal.patientNote = _noteController.text;

                            _mealManager.addMeal(_meal);
                          },
                          style: TextButton.styleFrom(),
                          child: const Text(
                            'Gönder',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
