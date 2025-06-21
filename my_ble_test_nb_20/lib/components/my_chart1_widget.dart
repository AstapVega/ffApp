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
import 'my_chart1_model.dart';
export 'my_chart1_model.dart';

class MyChart1Widget extends StatefulWidget {
  const MyChart1Widget({super.key});

  @override
  State<MyChart1Widget> createState() => _MyChart1WidgetState();
}

class _MyChart1WidgetState extends State<MyChart1Widget> {
  late MyChart1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyChart1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5),
        callback: (timer) async {
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
        height: 350.0,
        child: custom_widgets.TestLineChart1(
          width: 780.0,
          height: 350.0,
          inputDATA1: FFAppState().APPmeasuredData1,
          inputDATA2: FFAppState().APPmeasuredData2,
          minX: FFAppState().LineCharMinX,
          maxX: FFAppState().LineCharMaxX,
          minY: 15.0,
          maxY: 30.0,
          gridstepX: 240.0,
          gridstepY: 3.0,
          inputTimeDATA2: FFAppState().LineCharData2,
          fixedTooltip: true,
          inputTimeDATA1: FFAppState().LineCharData1,
          panoramaMode: FFAppState().panoramaMode,
          inputPanoramaTimeDATA1: FFAppState().panoramaLineCharData1,
          inputPanoramaTimeDATA2: FFAppState().panoramaLineCharData2,
          tooltipLinePosition: FFAppState().tooltipLineChartX,
          onTap: (curentTapTime) async {
            await actions.lineChartOut(
              curentTapTime,
              'onTap',
            );

            FFAppState().update(() {});
          },
          getUnixXmin: (curentUnixXmin) async {
            await actions.lineChartOut(
              curentUnixXmin,
              'startXmin',
            );

            FFAppState().update(() {});
          },
        ),
      ),
    );
  }
}
