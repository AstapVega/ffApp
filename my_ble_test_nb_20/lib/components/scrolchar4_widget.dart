import '/components/my_chart1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scrolchar4_model.dart';
export 'scrolchar4_model.dart';

class Scrolchar4Widget extends StatefulWidget {
  const Scrolchar4Widget({super.key});

  @override
  State<Scrolchar4Widget> createState() => _Scrolchar4WidgetState();
}

class _Scrolchar4WidgetState extends State<Scrolchar4Widget> {
  late Scrolchar4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Scrolchar4Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: wrapWithModel(
                model: _model.myChart1Model,
                updateCallback: () => safeSetState(() {}),
                child: MyChart1Widget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
