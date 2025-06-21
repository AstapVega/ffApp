import '/components/scrollchart3_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'buff_widget.dart' show BuffWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuffModel extends FlutterFlowModel<BuffWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for scrollchart3 component.
  late Scrollchart3Model scrollchart3Model;

  @override
  void initState(BuildContext context) {
    scrollchart3Model = createModel(context, () => Scrollchart3Model());
  }

  @override
  void dispose() {
    scrollchart3Model.dispose();
  }
}
