import '/backend/schema/structs/index.dart';
import '/components/color_picker1_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_page44_model.dart';
export 'device_page44_model.dart';

class DevicePage44Widget extends StatefulWidget {
  const DevicePage44Widget({super.key});

  static String routeName = 'device_page_44';
  static String routePath = '/devicePage44';

  @override
  State<DevicePage44Widget> createState() => _DevicePage44WidgetState();
}

class _DevicePage44WidgetState extends State<DevicePage44Widget> {
  late DevicePage44Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevicePage44Model());

    _model.switchValue1 = FFAppState().keyBlockOnOff;
    _model.switchValue2 = FFAppState().sfmModeOnOff;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1EFEF),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 450.0,
              height: 860.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: 450.0,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1EFEF),
                          border: Border.all(
                            color: Color(0xFFF1EFEF),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 45.0,
                                            icon: Icon(
                                              Icons.arrow_back,
                                              color: Color(0xFF969191),
                                              size: 25.0,
                                            ),
                                            onPressed: () async {
                                              context.goNamed(
                                                HomePageDeviceWidget.routeName,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 239.9,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 3.0, 0.0, 0.0),
                                          child: Text(
                                            'Настройки',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF757575),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 62.0, 0.0, 0.0),
                        child: Container(
                          width: 405.5,
                          height: 513.3,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 283.2,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Блокировка кнопок',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 65.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Switch.adaptive(
                                                  value: _model.switchValue1!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.switchValue1 =
                                                            newValue!);
                                                    if (newValue!) {
                                                      await actions
                                                          .playClickSound();
                                                      await actions
                                                          .keyBlockOnOff(
                                                        true,
                                                      );
                                                    } else {
                                                      await actions
                                                          .playClickSound();
                                                      await actions
                                                          .keyBlockOnOff(
                                                        false,
                                                      );
                                                    }
                                                  },
                                                  activeColor:
                                                      Color(0xFFA8B4DB),
                                                  activeTrackColor:
                                                      Color(0xB3E0E3E7),
                                                  inactiveTrackColor:
                                                      Color(0xB3E0E3E7),
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 60.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 283.2,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Работа без датчика t, °С  “SFM”',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 65.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Switch.adaptive(
                                                  value: _model.switchValue2!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.switchValue2 =
                                                            newValue!);
                                                    if (newValue!) {
                                                      await actions
                                                          .playClickSound();
                                                      await actions
                                                          .sfmModeOnOff(
                                                        true,
                                                      );
                                                    } else {
                                                      await actions
                                                          .playClickSound();
                                                      await actions
                                                          .sfmModeOnOff(
                                                        false,
                                                      );
                                                    }
                                                  },
                                                  activeColor:
                                                      Color(0xFFA8B4DB),
                                                  activeTrackColor:
                                                      Color(0xB3E0E3E7),
                                                  inactiveTrackColor:
                                                      Color(0xB3E0E3E7),
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 100.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await actions.bleCustomAction(
                                                    context,
                                                    BleActionStructStruct(
                                                      mode: FFAppConstants
                                                          .ReadConnectStatus,
                                                    ),
                                                  );
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, -1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Container(
                                                            height: 560.0,
                                                            width: 350.0,
                                                            child:
                                                                ColorPicker1Widget(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 59.9,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                    border: Border.all(
                                                      color: Color(0x002D2C2C),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      'Цвет :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .roboto(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF828282),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    80.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 288.4,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      width: 22.0,
                                                      height: 22.0,
                                                      child: custom_widgets
                                                          .CustomChekbox(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        activeFillColor:
                                                            Color(0xFF8A8B90),
                                                        inactiveFillColor:
                                                            Color(0xFF8A8B90),
                                                        activeBorderColor:
                                                            Color(0xFF8A8B90),
                                                        inactiveBorderColor:
                                                            Color(0xFF8A8B90),
                                                        borderWidth: 2.0,
                                                        borderRadius: 3.0,
                                                        checkIcon: FaIcon(
                                                          FontAwesomeIcons
                                                              .check,
                                                          color:
                                                              Color(0xFFEBEBEC),
                                                          size: 17.0,
                                                        ),
                                                        checkIconSize: 18.0,
                                                        iconPaddingLeft: 1.5,
                                                        iconPaddingRight: 0.0,
                                                        iconPaddingTop: 0.5,
                                                        iconPaddingBottom: 0.0,
                                                        enableSound: true,
                                                        state: false,
                                                        clickable: false,
                                                        index: 1,
                                                        onChanged: (isChecked,
                                                            backIndex) async {
                                                          await actions
                                                              .colorAction(
                                                            isChecked,
                                                            backIndex,
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  30.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        child: custom_widgets
                                                            .CustomChekbox(
                                                          width: 22.0,
                                                          height: 22.0,
                                                          activeFillColor:
                                                              Color(0xF3BD231B),
                                                          inactiveFillColor:
                                                              Color(0xF3CF261D),
                                                          activeBorderColor:
                                                              Color(0xF3CF261D),
                                                          inactiveBorderColor:
                                                              Color(0xF3CF261D),
                                                          borderWidth: 2.0,
                                                          borderRadius: 3.0,
                                                          checkIcon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: Color(
                                                                0xFFEBEBEC),
                                                            size: 18.0,
                                                          ),
                                                          checkIconSize: 18.0,
                                                          iconPaddingLeft: 1.6,
                                                          iconPaddingRight: 0.0,
                                                          iconPaddingTop: 0.5,
                                                          iconPaddingBottom:
                                                              0.0,
                                                          enableSound: true,
                                                          state: FFAppState()
                                                              .color2OnOff,
                                                          clickable: true,
                                                          index: 2,
                                                          onChanged: (isChecked,
                                                              backIndex) async {
                                                            await actions
                                                                .colorAction(
                                                              isChecked,
                                                              backIndex,
                                                            );

                                                            FFAppState()
                                                                .update(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  60.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        child: custom_widgets
                                                            .CustomChekbox(
                                                          width: 22.0,
                                                          height: 22.0,
                                                          activeFillColor:
                                                              Color(0xFFF6C143),
                                                          inactiveFillColor:
                                                              Color(0xFFF6C143),
                                                          activeBorderColor:
                                                              Color(0xFFF6C143),
                                                          inactiveBorderColor:
                                                              Color(0xFFF6C143),
                                                          borderWidth: 2.0,
                                                          borderRadius: 3.0,
                                                          checkIcon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: Color(
                                                                0xFFEBEBEC),
                                                            size: 18.0,
                                                          ),
                                                          checkIconSize: 18.0,
                                                          iconPaddingLeft: 1.5,
                                                          iconPaddingRight: 0.0,
                                                          iconPaddingTop: 0.5,
                                                          iconPaddingBottom:
                                                              0.0,
                                                          enableSound: true,
                                                          state: FFAppState()
                                                              .color3OnOff,
                                                          clickable: true,
                                                          index: 3,
                                                          onChanged: (isChecked,
                                                              backIndex) async {
                                                            await actions
                                                                .colorAction(
                                                              isChecked,
                                                              backIndex,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  90.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        child: custom_widgets
                                                            .CustomChekbox(
                                                          width: 22.0,
                                                          height: 22.0,
                                                          activeFillColor:
                                                              Color(0xFF249689),
                                                          inactiveFillColor:
                                                              Color(0xFF249689),
                                                          activeBorderColor:
                                                              Color(0xFF249689),
                                                          inactiveBorderColor:
                                                              Color(0xFF249689),
                                                          borderWidth: 2.0,
                                                          borderRadius: 3.0,
                                                          checkIcon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            size: 18.0,
                                                          ),
                                                          checkIconSize: 18.0,
                                                          iconPaddingLeft: 1.5,
                                                          iconPaddingRight: 0.0,
                                                          iconPaddingTop: 0.5,
                                                          iconPaddingBottom:
                                                              0.0,
                                                          enableSound: true,
                                                          state: FFAppState()
                                                              .color4OnOff,
                                                          clickable: true,
                                                          index: 4,
                                                          onChanged: (isChecked,
                                                              backIndex) async {
                                                            await actions
                                                                .colorAction(
                                                              isChecked,
                                                              backIndex,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  120.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        child: custom_widgets
                                                            .CustomChekbox(
                                                          width: 22.0,
                                                          height: 22.0,
                                                          activeFillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          inactiveFillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          activeBorderColor:
                                                              Color(0xFF8A8B90),
                                                          inactiveBorderColor:
                                                              Color(0xFF8A8B90),
                                                          borderWidth: 2.0,
                                                          borderRadius: 3.0,
                                                          checkIcon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: Color(
                                                                0xFF8A8B90),
                                                            size: 18.0,
                                                          ),
                                                          checkIconSize: 18.0,
                                                          iconPaddingLeft: 1.5,
                                                          iconPaddingRight: 0.0,
                                                          iconPaddingTop: 0.5,
                                                          iconPaddingBottom:
                                                              0.0,
                                                          enableSound: true,
                                                          state: FFAppState()
                                                              .color5OnOff,
                                                          clickable: true,
                                                          index: 5,
                                                          onChanged: (isChecked,
                                                              backIndex) async {
                                                            await actions
                                                                .colorAction(
                                                              isChecked,
                                                              backIndex,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  150.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        child: custom_widgets
                                                            .CustomChekbox(
                                                          width: 22.0,
                                                          height: 22.0,
                                                          activeFillColor:
                                                              Color(0xFF3A86F5),
                                                          inactiveFillColor:
                                                              Color(0xFF3A86F5),
                                                          activeBorderColor:
                                                              Color(0xFF3A86F5),
                                                          inactiveBorderColor:
                                                              Color(0xFF3A86F5),
                                                          borderWidth: 2.0,
                                                          borderRadius: 3.0,
                                                          checkIcon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: Color(
                                                                0xFFEBEBEC),
                                                            size: 18.0,
                                                          ),
                                                          checkIconSize: 18.0,
                                                          iconPaddingLeft: 1.5,
                                                          iconPaddingRight: 0.0,
                                                          iconPaddingTop: 0.5,
                                                          iconPaddingBottom:
                                                              0.0,
                                                          enableSound: true,
                                                          state: FFAppState()
                                                              .color6OnOff,
                                                          clickable: true,
                                                          index: 6,
                                                          onChanged: (isChecked,
                                                              backIndex) async {
                                                            await actions
                                                                .colorAction(
                                                              isChecked,
                                                              backIndex,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  180.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        child: custom_widgets
                                                            .CustomChekbox(
                                                          width: 22.0,
                                                          height: 22.0,
                                                          activeFillColor:
                                                              Color(0xFFDA328A),
                                                          inactiveFillColor:
                                                              Color(0xFFDA328A),
                                                          activeBorderColor:
                                                              Color(0xFFDA328A),
                                                          inactiveBorderColor:
                                                              Color(0xFFDA328A),
                                                          borderWidth: 2.0,
                                                          borderRadius: 3.0,
                                                          checkIcon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: Color(
                                                                0xFFEBEBEC),
                                                            size: 18.0,
                                                          ),
                                                          checkIconSize: 18.0,
                                                          iconPaddingLeft: 1.5,
                                                          iconPaddingRight: 0.0,
                                                          iconPaddingTop: 0.5,
                                                          iconPaddingBottom:
                                                              0.0,
                                                          enableSound: true,
                                                          state: FFAppState()
                                                              .color7OnOff,
                                                          clickable: true,
                                                          index: 7,
                                                          onChanged: (isChecked,
                                                              backIndex) async {
                                                            await actions
                                                                .colorAction(
                                                              isChecked,
                                                              backIndex,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  210.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        child: custom_widgets
                                                            .CustomChekbox(
                                                          width: 22.0,
                                                          height: 22.0,
                                                          activeFillColor:
                                                              Color(0xFF9E69A5),
                                                          inactiveFillColor:
                                                              Color(0xFF9E69A5),
                                                          activeBorderColor:
                                                              Color(0xFF9E69A5),
                                                          inactiveBorderColor:
                                                              Color(0xFF9E69A5),
                                                          borderWidth: 2.0,
                                                          borderRadius: 3.0,
                                                          checkIcon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: Color(
                                                                0xFFEBEBEC),
                                                            size: 18.0,
                                                          ),
                                                          checkIconSize: 18.0,
                                                          iconPaddingLeft: 1.5,
                                                          iconPaddingRight: 0.0,
                                                          iconPaddingTop: 0.5,
                                                          iconPaddingBottom:
                                                              0.0,
                                                          enableSound: true,
                                                          state: FFAppState()
                                                              .color8OnOff,
                                                          clickable: true,
                                                          index: 8,
                                                          onChanged: (isChecked,
                                                              backIndex) async {
                                                            await actions
                                                                .colorAction(
                                                              isChecked,
                                                              backIndex,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      width: 22.0,
                                                      height: 22.0,
                                                      child: custom_widgets
                                                          .CustomChekbox(
                                                        width: 22.0,
                                                        height: 22.0,
                                                        activeFillColor:
                                                            Color(0xFF8A8B90),
                                                        inactiveFillColor:
                                                            Color(0xFF8A8B90),
                                                        activeBorderColor:
                                                            Color(0xFF8A8B90),
                                                        inactiveBorderColor:
                                                            Color(0xFF8A8B90),
                                                        borderWidth: 2.0,
                                                        borderRadius: 3.0,
                                                        checkIcon: FaIcon(
                                                          FontAwesomeIcons
                                                              .check,
                                                          color:
                                                              Color(0xFFEBEBEC),
                                                          size: 17.0,
                                                        ),
                                                        checkIconSize: 18.0,
                                                        iconPaddingLeft: 1.5,
                                                        iconPaddingRight: 0.0,
                                                        iconPaddingTop: 0.5,
                                                        iconPaddingBottom: 0.0,
                                                        enableSound: true,
                                                        state: FFAppState()
                                                            .color1OnOff,
                                                        clickable: true,
                                                        index: 1,
                                                        onChanged: (isChecked,
                                                            backIndex) async {
                                                          await actions
                                                              .colorAction(
                                                            isChecked,
                                                            backIndex,
                                                          );

                                                          FFAppState()
                                                              .update(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 145.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              width: 49.08,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -0.04),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: [
                                                        FFAppState()
                                                            .GesterezisValue
                                                            .firstOrNull!,
                                                        FFAppState()
                                                            .GesterezisValue
                                                            .elementAtOrNull(1)!
                                                      ],
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .dropDownValue =
                                                            val);
                                                        await actions
                                                            .gesterezisUpdate(
                                                          _model.dropDownValue!,
                                                        );
                                                      },
                                                      width: 50.0,
                                                      height: 35.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF5C5B5B),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.1,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 0.0,
                                                              ),
                                                      hintText: FFAppState()
                                                          .GesterezisOUT,
                                                      icon: Icon(
                                                        FFIcons.karrowdown,
                                                        color:
                                                            Colors.transparent,
                                                        size: 1.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                      labelText: '',
                                                      labelTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 262.21,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  FFAppState()
                                                      .settingsSensorName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
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
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 215.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 38.89,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 283.2,
                                              height: 33.39,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Text(
                                                  'Сброс настроек устройства',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 65.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          Color(0x00F5F5F9),
                                                      icon: Icon(
                                                        Icons.restart_alt_sharp,
                                                        color:
                                                            Color(0xE63A79DA),
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 270.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 283.2,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Удаление устройства !',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 17.0, 0.0),
                                            child: Container(
                                              width: 50.5,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await actions
                                                          .bleCustomAction(
                                                        context,
                                                        BleActionStructStruct(
                                                          mode: FFAppConstants
                                                              .delitTHISdevice,
                                                        ),
                                                      );
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  2000));

                                                      FFAppState()
                                                          .update(() {});

                                                      context.goNamed(
                                                        HomePageDeviceWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    text: 'Button',
                                                    icon: Icon(
                                                      Icons.delete_forever,
                                                      size: 28.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconColor:
                                                          Color(0xF3CF261D),
                                                      color: Color(0x00F0F0F2),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xF3CF261D),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 330.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 112.3,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 283.2,
                                              height: 24.5,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Информация :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 65.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Color(0x002D2C2C),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 54.0),
                                            child: Container(
                                              width: 300.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Устройство :   термостат  LTC 090',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFB5BCCF),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 26.0),
                                            child: Container(
                                              width: 300.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'ID :',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFB5BCCF),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 300.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Версия ПО :   vs 01.02.25',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFB5BCCF),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.72, 0.93),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.goNamed(
                                      MyDropDownWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  text: 'Debug',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: 450.0,
                        height: 58.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1EFEF),
                          border: Border.all(
                            color: Color(0xFFF1EFEF),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.goNamed(
                                          DevicePage11Widget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 55.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.goNamed(
                                                  DevicePage11Widget.routeName,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Icon(
                                                FFIcons.kmyslider,
                                                color: Color(0xFF989BA7),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState().standartShedullMode ==
                                            true) {
                                          await actions.updateDayInterval(
                                            'updateStandartDayIntervalsUI',
                                          );

                                          context.goNamed(
                                            DevicePage22Widget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          await actions.updateDayInterval(
                                            'updateDayIntervalsUI',
                                          );

                                          context.goNamed(
                                            DevicePage22CopyWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 55.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 2.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (FFAppState()
                                                        .standartShedullMode ==
                                                    true) {
                                                  await actions
                                                      .updateDayInterval(
                                                    'updateStandartDayIntervalsUI',
                                                  );

                                                  context.goNamed(
                                                    DevicePage22Widget
                                                        .routeName,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  await actions
                                                      .updateDayInterval(
                                                    'updateDayIntervalsUI',
                                                  );

                                                  context.goNamed(
                                                    DevicePage22CopyWidget
                                                        .routeName,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                FFIcons.kshedull,
                                                color: Color(0xFF989BA7),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.goNamed(
                                          DevicePage33Widget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 55.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.goNamed(
                                                  DevicePage33Widget.routeName,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Icon(
                                                FFIcons.kcharts,
                                                color: Color(0xFF989BA7),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState().standartShedullMode ==
                                            true) {
                                          await actions.updateDayInterval(
                                            'updateStandartDayIntervalsUI',
                                          );

                                          context.goNamed(
                                            DevicePage22Widget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          await actions.updateDayInterval(
                                            'updateDayIntervalsUI',
                                          );

                                          context.goNamed(
                                            DevicePage22CopyWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 55.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (FFAppState()
                                                        .standartShedullMode ==
                                                    true) {
                                                  context.goNamed(
                                                    DevicePage22Widget
                                                        .routeName,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  context.goNamed(
                                                    DevicePage22CopyWidget
                                                        .routeName,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons.settings_sharp,
                                                color: Color(0xE63A79DA),
                                                size: 24.0,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
