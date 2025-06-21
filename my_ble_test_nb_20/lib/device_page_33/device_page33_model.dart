import '/components/my_chart1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'device_page33_widget.dart' show DevicePage33Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevicePage33Model extends FlutterFlowModel<DevicePage33Widget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  InstantTimer? scrollRigth;
  InstantTimer? scrollLeft;
  InstantTimer? scrollRigth2;
  InstantTimer? scrollLeft2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    scrollRigth?.cancel();
    scrollLeft?.cancel();
    scrollRigth2?.cancel();
    scrollLeft2?.cancel();
  }
}
