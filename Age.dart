// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Define App Values all persisted:
// APPidade integer
// APPStringData string
// APPDATA DateTime
/////////////////////////////////////

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<int> converteStringParaDataIdadeAgora(String HyphensYYYYMMDD) async {
  // OPERATION TO RECEIVE YYYY-MM-DD FORMAT ISO OR DD/MM/YYYY
  // APPIdade or age = -1 FORMAT or Date invalid
  // APPStringData String RECEIVE or FINAL FORMATED ISO
  // APPDATA = String RECEIVE formated to DateTime (UNIX)

  FFAppState().APPidade = -1;
  FFAppState().APPStringData = HyphensYYYYMMDD;
  FFAppState().APPDATA = null;

  final dateInput = HyphensYYYYMMDD;

  if (dateInput.length != 10) {
    return -1;
  }

  // VALIDATE dateInput FORMAT
  String HYFEN = "-";
  String BARRA = "/";
  if ((dateInput.substring(4, 5) == HYFEN) &&
      (dateInput.substring(7, 8) == HYFEN)) {
    BARRA = "-";
  }

  if ((BARRA == '/') &&
      (dateInput.substring(2, 3) == BARRA) &&
      (dateInput.substring(5, 6) == BARRA)) {
    HYFEN = '/';
  }

  if (HYFEN == '-' && BARRA == '/') {
    return -1;
  }

  var string;
  var StringHyfen;

  if (HYFEN == '/') {
    StringHyfen = dateInput.substring(6) +
        '-' +
        dateInput.substring(3, 5) +
        '-' +
        dateInput.substring(0, 2);

    string = StringHyfen;
  } else {
    string = dateInput;
  }

  FFAppState().APPStringData = string;

  final today = DateTime.now();

  // Invalid dateInput causes abort - PREVENT (-1) in DateTime.parse(dateInput)
  // Using try to avoid interrupting an Action Flow
  try {
    DateTime birthDate = DateTime.parse(string);
    FFAppState().APPDATA = birthDate;

    // valid input format... now valid birthDate.month and birthDate.day
    var APPXmesnas = string.substring(5, 7);
    var APPXdianas = string.substring(8);
    var APPXanonas = string.substring(0, 4);

    var mmBirt = int.parse(APPXmesnas);
    var ddBirt = int.parse(APPXdianas);
    var aaBirt = int.parse(APPXanonas);
    var biBirt = aaBirt % 4;

// variables only for debug use FFAppState().APPxxx
// confirming dateInput 0000-00-00 (numeric) DateTime.parse(dateInput) can generate valid date

    var APPbianonas = biBirt;
    var APPmesnas = birthDate.month;
    var APPdianas = birthDate.day;
    var APPanonas = birthDate.year;

// VALIDATE CALENDAR

    int erros = 0;

    if (mmBirt < 1 || ddBirt < 1 || mmBirt > 12 || ddBirt > 31) {
      erros = erros + 1;
    }

    if (mmBirt == 2 && biBirt < 1 && ddBirt > 29) {
      erros = erros + 1;
    }

    if (mmBirt == 2 && biBirt > 0 && ddBirt > 28) {
      erros = erros + 1;
    }

    if ((mmBirt == 4 || mmBirt == 6 || mmBirt == 9 || mmBirt == 11) &&
        ddBirt > 30) {
      erros = erros + 1;
    }

// variable only for debug use FFAppState().APPxxx
    var APPerros = erros;

    if (erros > 0) {
      FFAppState().APPidade = -1;
      return FFAppState().APPidade;
    }

    int age = today.year - birthDate.year;
    final m = today.month - birthDate.month;

    // Prevent year < 1000 variable only for debug use FFAppState().APPxxx
    final menorano = aaBirt;

    // Data input (birth) without hyphens
    final dateString = string;
    final noHyphensDate = dateString.replaceAll('-', '');

    // Date today also without hyphens
    final year = today.year;
    final month = today.month;
    final day = today.day;
    final resultado = (((year * 100) + month) * 100) + day;

    // Calculate age with subtraction today - birth
    final idade = resultado - int.parse(noHyphensDate);

    // Convert age to string guaranteeing up to 4 positions for age
    final idadequatro = idade + 100000000;
    final resultadoString = idadequatro.toString();

    // Get age with four positions of the subtraction result
    final firstFourChars = resultadoString.substring(1, 5);

    // Original calculation does not produce correct result, but maintained when input is invalid
    if (m < 0 || (m == 0 && today.day < birthDate.day)) {
      age--;
    }

    // Check invalid input
    if (age < 0) {
      age = 0;
      FFAppState().APPidade = 0;
    }

    // If input is not invalid, use age with four subtraction positions
    if (age != 0) {
      age = int.parse(firstFourChars);
      FFAppState().APPidade = age;
      return age;
    } else {
      age = 0;
      FFAppState().APPidade = 0;
      return age;
    }
    // Using try to avoid interrupting an Action Flow
  } catch (e) {
    FFAppState().APPidade = -1;
    return -1;
  }
}
