import 'package:flutter/material.dart';
import '../../global_index.dart';

class BottomSheetUtils {
  static void provideHelpAndTaskInfoBottomSheet(
    BuildContext context, {
    bool? isGetTaskInfoPage = false,
  }) {
    double screenHeight = MediaQuery.of(context).size.height;
    double desiredHeight = screenHeight * 0.97;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: desiredHeight,
          child: ProvideHelpScreen(
            isGetTaskInfoPage: isGetTaskInfoPage,
          ),
        );
      },
    );
  }

  static void askHelpBottomSheet(
    BuildContext context, {
    bool? isGetTaskInfoPage = false,
  }) {
    double screenHeight = MediaQuery.of(context).size.height;
    double desiredHeight = screenHeight * 0.97;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: desiredHeight,
          child: const AskHelpPage(),
        );
      },
    );
  }
}
