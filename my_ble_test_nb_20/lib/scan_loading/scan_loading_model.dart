import '/components/loading_indicate_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/index.dart';
import 'scan_loading_widget.dart' show ScanLoadingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanLoadingModel extends FlutterFlowModel<ScanLoadingWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Model for Loading_Indicate component.
  late LoadingIndicateModel loadingIndicateModel;

  @override
  void initState(BuildContext context) {
    loadingIndicateModel = createModel(context, () => LoadingIndicateModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    loadingIndicateModel.dispose();
  }
}
