import 'package:flutter/material.dart';
import 'package:helpmybuddy_frontend/global_index.dart';

class CurrentTaskStatusScreen extends StatelessWidget {
  const CurrentTaskStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      color: AppColors.mainBg,
      child: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                BottomSheetUtils.showBottomSheet(
                  context,
                  isGetTaskInfoPage: true,
                );
                //open the task detailed view
              },
              child: const TaskInfoCard(),
            ),
            const SizedBox(
              height: 20,
            ),
            const StepperWidget(),
          ],
        ),
      ),
    );
  }
}
