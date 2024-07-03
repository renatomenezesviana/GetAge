// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Calculates Differences Between Fractional Dates

Future<int> newCustomAction2(String MaiorYYYYMMDD, String MenorYYYYMMDD) async {
  FFAppState().APPdiferencas = -1;
  // Using try to avoid interrupting an Action Flow
  try {
    DateTime dt1 = DateTime.parse(MaiorYYYYMMDD);
    DateTime dt2 = DateTime.parse(MenorYYYYMMDD);
    FFAppState().APP2000 = dt1;
    FFAppState().APP1900 = dt2; // Remember FlutterFlow Calendar minimum 1970

    Duration diff = dt1.difference(dt2);

    FFAppState().APPdays = diff.inDays;
//output (in days): 1198

    FFAppState().APPhours = diff.inHours;
//output (in hours): 28752

    FFAppState().APPminutes = diff.inMinutes;
//output (in minutes): 1725170

    FFAppState().APPseconds = diff.inSeconds;
//output (in seconds): 103510200
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
    FFAppState().APPdiferencas = 0;
    return 0;
// Using try to avoid interrupting an Action Flow
  } catch (e) {
    return -1;
  }
}
