// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future scrolling(String? mode) async {
  // Add your function code here!

  if (mode == "left") {
    FFAppState().scrollleft = 1;

    FFAppState().update(() {});
  }

  if (mode == "right") {
    FFAppState().scrollrigth = 1;

    FFAppState().update(() {});
  }
}
