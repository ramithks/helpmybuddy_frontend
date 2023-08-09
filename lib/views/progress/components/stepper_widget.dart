import 'package:flutter/material.dart';
import '../../../global_index.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;

  List<Step> stepList() => [
        Step(
          title: const Text(
            'Task In Progress',
            style: TextStyle(color: AppColors.white),
          ),
          content: const Row(
            children: [],
          ),
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text(
            'Payment',
            style: TextStyle(color: AppColors.white),
          ),
          content: const Center(
            child: Text(
              "Congratulations, the task is completed successfully 🎉",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
          isActive: _currentStep == 1,
        ),
      ];

  void _continueButtonPressed() {
    if (_currentStep < stepList().length - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _cancelButtonPressed() {
    // You can leave this empty if you don't want any action on cancel
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepContinue: _continueButtonPressed,
      onStepCancel: _cancelButtonPressed,
      steps: stepList(),
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        // Hide buttons in the second step
        if (_currentStep == 1) {
          return Container(); // Return an empty container to hide buttons
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomButton(
                radius: 8,
                verticalPadding: 8,
                horizontalPadding: 8,
                child: const Text(
                  "Task Done",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  details.onStepContinue?.call();
                },
              ),
              CustomButton(
                backgroundColor: AppColors.opaqueColor,
                radius: 8,
                verticalPadding: 8,
                horizontalPadding: 8,
                child: Text(
                  "cancel task",
                  style: TextStyle(
                    color: AppColors.white50Opacity,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  details.onStepCancel?.call();
                },
              ),
            ],
          );
        }
      },
    );
  }
}
