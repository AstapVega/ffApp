import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'termostat_widget.dart' show TermostatWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TermostatModel extends FlutterFlowModel<TermostatWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? TimerLongPressUP;
  InstantTimer? TimerLongPressDOWN;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    TimerLongPressUP?.cancel();
    TimerLongPressDOWN?.cancel();
  }
}
