import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buttons_f_a_b_model.dart';
export 'buttons_f_a_b_model.dart';

class ButtonsFABWidget extends StatefulWidget {
  const ButtonsFABWidget({super.key});

  static String routeName = 'Buttons-FAB';
  static String routePath = '/buttonsFAB';

  @override
  State<ButtonsFABWidget> createState() => _ButtonsFABWidgetState();
}

class _ButtonsFABWidgetState extends State<ButtonsFABWidget> {
  late ButtonsFABModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonsFABModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
