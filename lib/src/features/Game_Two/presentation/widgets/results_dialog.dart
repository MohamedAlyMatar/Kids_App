import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ResultsDialog {
  static void show(BuildContext context, int score, int timeTaken) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      title: 'Game Results',
      desc: 'Your final score is $score\nYou answered in $timeTaken seconds',
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }
}
