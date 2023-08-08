import 'package:flutter/material.dart';
import '../../../global_index.dart';

class Stepperwidget extends StatelessWidget {
  const Stepperwidget({Key? key}) : super(key: key);

  List<Step> stepList() => [
        const Step(
            title: Text(
              'Task In Progress',
              style: TextStyle(color: AppColors.white),
            ),
            content: Center(
              child: Text(
                'Account',
                style: TextStyle(color: AppColors.white),
              ),
            )),
        const Step(
            title: Text(
              'Payment',
              style: TextStyle(color: AppColors.white),
            ),
            content: Center(
              child: Text(
                'Address',
                style: TextStyle(color: AppColors.white),
              ),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: stepList(),
    );
  }
}
