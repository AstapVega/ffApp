import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_chart1_copy_model.dart';
export 'my_chart1_copy_model.dart';

class MyChart1CopyWidget extends StatefulWidget {
  const MyChart1CopyWidget({super.key});

  @override
  State<MyChart1CopyWidget> createState() => _MyChart1CopyWidgetState();
}

class _MyChart1CopyWidgetState extends State<MyChart1CopyWidget> {
  late MyChart1CopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyChart1CopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.myChart1action(
        'generate',
      );
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5),
        callback: (timer) async {
          await actions.myChart1action(
            'rotate',
          );

          safeSetState(() {});
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
      child: Container(
        width: 780.0,
        height: 250.0,
        child: custom_widgets.TestLineChart1(
          width: 780.0,
          height: 250.0,
          inputDATA1: FFAppState().APPmeasuredData1,
          inputDATA2: FFAppState().APPmeasuredData2,
          onTap: (curentTapTime) async {},
          getUnixXmin: (curentUnixXmin) async {},
        ),
      ),
    );
  }
}
