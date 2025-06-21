import '/components/set_interval_tempere_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'set_interval_tempere_widget.dart' show SetIntervalTempereWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetIntervalTempereModel
    extends FlutterFlowModel<SetIntervalTempereWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? Timer_longpresPlus;
  InstantTimer? Timer_longpresMinus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    Timer_longpresPlus?.cancel();
    Timer_longpresMinus?.cancel();
  }
}
