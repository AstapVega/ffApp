import '/components/my_chart1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'scrollchart3_widget.dart' show Scrollchart3Widget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Scrollchart3Model extends FlutterFlowModel<Scrollchart3Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for myChart1 component.
  late MyChart1Model myChart1Model;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    myChart1Model = createModel(context, () => MyChart1Model());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    myChart1Model.dispose();
  }
}
