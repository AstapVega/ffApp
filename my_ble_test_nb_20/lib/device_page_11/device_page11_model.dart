import '/backend/schema/structs/index.dart';
import '/components/device_discrypt_widget.dart';
import '/components/one_sensor_name_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'device_page11_widget.dart' show DevicePage11Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevicePage11Model extends FlutterFlowModel<DevicePage11Widget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  InstantTimer? instantTimerToWrite;
  InstantTimer? instantTimerListViue;
  InstantTimer? instantTimerRearAllDevice;
  InstantTimer? instantTimerTermostat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    instantTimerToWrite?.cancel();
    instantTimerListViue?.cancel();
    instantTimerRearAllDevice?.cancel();
    instantTimerTermostat?.cancel();
  }
}
