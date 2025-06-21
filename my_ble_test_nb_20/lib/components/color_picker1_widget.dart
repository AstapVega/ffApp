import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'color_picker1_model.dart';
export 'color_picker1_model.dart';

class ColorPicker1Widget extends StatefulWidget {
  const ColorPicker1Widget({super.key});

  @override
  State<ColorPicker1Widget> createState() => _ColorPicker1WidgetState();
}

class _ColorPicker1WidgetState extends State<ColorPicker1Widget> {
  late ColorPicker1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorPicker1Model());

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

    return Container(
      width: 394.5,
      height: 500.0,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Container(
          width: 390.0,
          height: 500.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: 390.0,
                  height: 300.0,
                  child: custom_widgets.MyColorPicker(
                    width: 390.0,
                    height: 300.0,
                    pickerColor: FFAppState().deviceColor,
                    displayThumbColor: false,
                    hexInputBar: false,
                    availableColors: FFAppState().colorPalet,
                    setMyPaletteType: MyPaletteType.hsvWithHue,
                    setMyColorLabelType: MyColorLabelType.values,
                    onColorChanged: (color) async {
                      await actions.onColorChangeAction(
                        color,
                      );

                      safeSetState(() {});
                    },
                    onColorSelected: (selectedColor) async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: Container(
                    width: 390.0,
                    height: 159.1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final myColorHistory =
                                    FFAppState().colorHistory.toList();

                                return GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0.0,
                                    0,
                                    30.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 0.0,
                                    childAspectRatio: 1.06,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: myColorHistory.length,
                                  itemBuilder: (context, myColorHistoryIndex) {
                                    final myColorHistoryItem =
                                        myColorHistory[myColorHistoryIndex];
                                    return Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await actions
                                                    .selectHistoryColor(
                                                  myColorHistoryIndex,
                                                );

                                                safeSetState(() {});
                                              },
                                              onLongPress: () async {
                                                await actions
                                                    .selectHistoryColor(
                                                  myColorHistoryIndex,
                                                );
                                                await actions.delitHistoryColor(
                                                  2,
                                                );

                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 40.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    myColorHistoryItem,
                                                    Color(0xFFA50E0E),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    bottomRight:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                  border: Border.all(
                                                    color: Color(0x7BC5C4C4),
                                                    width: 0.7,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await actions.onColorSelectedAction();
                      await actions.customColorPicker(
                        FFAppState().colorFromPicker,
                      );

                      safeSetState(() {});
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 90.09,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                        border: Border.all(
                          color: Color(0x00E3E1E1),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'ВЫБРАТЬ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF2F80ED),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 110.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 86.69,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                        border: Border.all(
                          color: Color(0x00E3E1E1),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'ВЫХОД',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF333333),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await actions.delitHistoryColor(
                        1,
                      );

                      safeSetState(() {});
                    },
                    child: Container(
                      width: 90.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                        border: Border.all(
                          color: Color(0x00E3E1E1),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'УДАЛИТЬ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF2F80ED),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
