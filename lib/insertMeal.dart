import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/model/patient.dart';

class InsertMeal extends StatefulWidget {
  InsertMeal(this.patient, {super.key});
  final Patient? patient;

  @override
  State<InsertMeal> createState() => _InsertMealState(this.patient);
}

final TextEditingController _mealNote = TextEditingController();

class _InsertMealState extends State<InsertMeal> {
  final Patient? _patient;
  _InsertMealState(this._patient);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(_patient?.user.fullName ?? ""),
          ],
        ),
      ),
    );
  }
}
