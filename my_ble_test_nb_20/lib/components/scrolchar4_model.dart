import '/components/my_chart1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scrolchar4_widget.dart' show Scrolchar4Widget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Scrolchar4Model extends FlutterFlowModel<Scrolchar4Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for myChart1 component.
  late MyChart1Model myChart1Model;

  @override
  void initState(BuildContext context) {
    myChart1Model = createModel(context, () => MyChart1Model());
  }

  @override
  void dispose() {
    myChart1Model.dispose();
  }
}
