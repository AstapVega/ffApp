import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_timer_model.dart';
export 'home_page_timer_model.dart';

/// Первоначальная страница  когда устройтсво  еще не добавлено , но есть
/// такая возможность
class HomePageTimerWidget extends StatefulWidget {
  const HomePageTimerWidget({super.key});

  static String routeName = 'HomePageTimer';
  static String routePath = '/homePageTimer';

  @override
  State<HomePageTimerWidget> createState() => _HomePageTimerWidgetState();
}

class _HomePageTimerWidgetState extends State<HomePageTimerWidget> {
  late HomePageTimerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageTimerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(bluetoothPermission);
      await actions.calculateAdjusted(
        FFAppConstants.Height,
      );
      await actions.bleCustomAction(
        context,
        BleActionStructStruct(
          mode: FFAppConstants.showPlatform,
        ),
      );

      context.goNamed(
        HomePageDeviceWidget.routeName,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Align(
        alignment: AlignmentDirectional(0.0, -1.0),
        child: Container(
          width: 390.0,
          height: 45.9,
          decoration: BoxDecoration(
            color: Color(0x3657636C),
          ),
        ),
      ),
    );
  }
}
