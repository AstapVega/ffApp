// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyDeviceStruct extends BaseStruct {
  MyDeviceStruct({
    String? id,
    String? name,
    int? onOff,
    String? face,
    int? tempereSetHigthByte,
    int? tempereSetLowByte,
    int? tempereReadHigthByte,
    int? tempereReadLowByte,
    Color? statusConnectColor,
    int? statusConnectState,
    int? onOffKnobState,
    String? onOffKnobValue,
    bool? handProgModeSwich,
    Color? handModeColor,
    Color? progModeColor,
    bool? handModeVisible,
    bool? progModeVisible,
    String? deviseDiscript,
    String? tempereReadHighByteString,
    String? tempereReadLowByteString,
    Color? tempereReadColor,
    String? sensorDiscript,
    double? heatIconVisible,
    String? settingsSensorName,
    String? deviceHysteresis,
    bool? heatIconVisibleForList,
    bool? keyBlockOnOff,
    bool? sfmModeOnOff,
    bool? color1OnOff,
    bool? color2OnOff,
    bool? color3OnOff,
    bool? color4OnOff,
    bool? color5OnOff,
    bool? color6OnOff,
    bool? color7OnOff,
    bool? color8OnOff,
    Color? deviceColor,
    bool? standartShedullMode,
    bool? customShedullMode,
    Color? customColor,
    Color? day1Select,
    Color? day2Select,
    Color? day3Select,
    Color? day4Select,
    Color? day5Select,
    Color? day6Select,
    Color? day7Select,
  })  : _id = id,
        _name = name,
        _onOff = onOff,
        _face = face,
        _tempereSetHigthByte = tempereSetHigthByte,
        _tempereSetLowByte = tempereSetLowByte,
        _tempereReadHigthByte = tempereReadHigthByte,
        _tempereReadLowByte = tempereReadLowByte,
        _statusConnectColor = statusConnectColor,
        _statusConnectState = statusConnectState,
        _onOffKnobState = onOffKnobState,
        _onOffKnobValue = onOffKnobValue,
        _handProgModeSwich = handProgModeSwich,
        _handModeColor = handModeColor,
        _progModeColor = progModeColor,
        _handModeVisible = handModeVisible,
        _progModeVisible = progModeVisible,
        _deviseDiscript = deviseDiscript,
        _tempereReadHighByteString = tempereReadHighByteString,
        _tempereReadLowByteString = tempereReadLowByteString,
        _tempereReadColor = tempereReadColor,
        _sensorDiscript = sensorDiscript,
        _heatIconVisible = heatIconVisible,
        _settingsSensorName = settingsSensorName,
        _deviceHysteresis = deviceHysteresis,
        _heatIconVisibleForList = heatIconVisibleForList,
        _keyBlockOnOff = keyBlockOnOff,
        _sfmModeOnOff = sfmModeOnOff,
        _color1OnOff = color1OnOff,
        _color2OnOff = color2OnOff,
        _color3OnOff = color3OnOff,
        _color4OnOff = color4OnOff,
        _color5OnOff = color5OnOff,
        _color6OnOff = color6OnOff,
        _color7OnOff = color7OnOff,
        _color8OnOff = color8OnOff,
        _deviceColor = deviceColor,
        _standartShedullMode = standartShedullMode,
        _customShedullMode = customShedullMode,
        _customColor = customColor,
        _day1Select = day1Select,
        _day2Select = day2Select,
        _day3Select = day3Select,
        _day4Select = day4Select,
        _day5Select = day5Select,
        _day6Select = day6Select,
        _day7Select = day7Select;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "on_off" field.
  int? _onOff;
  int get onOff => _onOff ?? 0;
  set onOff(int? val) => _onOff = val;

  void incrementOnOff(int amount) => onOff = onOff + amount;

  bool hasOnOff() => _onOff != null;

  // "FACE" field.
  String? _face;
  String get face => _face ?? '';
  set face(String? val) => _face = val;

  bool hasFace() => _face != null;

  // "TempereSetHigthByte" field.
  int? _tempereSetHigthByte;
  int get tempereSetHigthByte => _tempereSetHigthByte ?? 25;
  set tempereSetHigthByte(int? val) => _tempereSetHigthByte = val;

  void incrementTempereSetHigthByte(int amount) =>
      tempereSetHigthByte = tempereSetHigthByte + amount;

  bool hasTempereSetHigthByte() => _tempereSetHigthByte != null;

  // "TempereSetLowByte" field.
  int? _tempereSetLowByte;
  int get tempereSetLowByte => _tempereSetLowByte ?? 0;
  set tempereSetLowByte(int? val) => _tempereSetLowByte = val;

  void incrementTempereSetLowByte(int amount) =>
      tempereSetLowByte = tempereSetLowByte + amount;

  bool hasTempereSetLowByte() => _tempereSetLowByte != null;

  // "TempereReadHigthByte" field.
  int? _tempereReadHigthByte;
  int get tempereReadHigthByte => _tempereReadHigthByte ?? 25;
  set tempereReadHigthByte(int? val) => _tempereReadHigthByte = val;

  void incrementTempereReadHigthByte(int amount) =>
      tempereReadHigthByte = tempereReadHigthByte + amount;

  bool hasTempereReadHigthByte() => _tempereReadHigthByte != null;

  // "TempereReadLowByte" field.
  int? _tempereReadLowByte;
  int get tempereReadLowByte => _tempereReadLowByte ?? 0;
  set tempereReadLowByte(int? val) => _tempereReadLowByte = val;

  void incrementTempereReadLowByte(int amount) =>
      tempereReadLowByte = tempereReadLowByte + amount;

  bool hasTempereReadLowByte() => _tempereReadLowByte != null;

  // "StatusConnectColor" field.
  Color? _statusConnectColor;
  Color get statusConnectColor =>
      _statusConnectColor ?? const Color(0xFFE1DDDD);
  set statusConnectColor(Color? val) => _statusConnectColor = val;

  bool hasStatusConnectColor() => _statusConnectColor != null;

  // "StatusConnectState" field.
  int? _statusConnectState;
  int get statusConnectState => _statusConnectState ?? 2;
  set statusConnectState(int? val) => _statusConnectState = val;

  void incrementStatusConnectState(int amount) =>
      statusConnectState = statusConnectState + amount;

  bool hasStatusConnectState() => _statusConnectState != null;

  // "OnOffKnobState" field.
  int? _onOffKnobState;
  int get onOffKnobState => _onOffKnobState ?? 1;
  set onOffKnobState(int? val) => _onOffKnobState = val;

  void incrementOnOffKnobState(int amount) =>
      onOffKnobState = onOffKnobState + amount;

  bool hasOnOffKnobState() => _onOffKnobState != null;

  // "OnOffKnobValue" field.
  String? _onOffKnobValue;
  String get onOffKnobValue => _onOffKnobValue ?? 'off';
  set onOffKnobValue(String? val) => _onOffKnobValue = val;

  bool hasOnOffKnobValue() => _onOffKnobValue != null;

  // "handProgModeSwich" field.
  bool? _handProgModeSwich;
  bool get handProgModeSwich => _handProgModeSwich ?? false;
  set handProgModeSwich(bool? val) => _handProgModeSwich = val;

  bool hasHandProgModeSwich() => _handProgModeSwich != null;

  // "handModeColor" field.
  Color? _handModeColor;
  Color get handModeColor => _handModeColor ?? const Color(0xFFB5BCCF);
  set handModeColor(Color? val) => _handModeColor = val;

  bool hasHandModeColor() => _handModeColor != null;

  // "progModeColor" field.
  Color? _progModeColor;
  Color get progModeColor => _progModeColor ?? const Color(0x59B5BCCF);
  set progModeColor(Color? val) => _progModeColor = val;

  bool hasProgModeColor() => _progModeColor != null;

  // "handModeVisible" field.
  bool? _handModeVisible;
  bool get handModeVisible => _handModeVisible ?? true;
  set handModeVisible(bool? val) => _handModeVisible = val;

  bool hasHandModeVisible() => _handModeVisible != null;

  // "progModeVisible" field.
  bool? _progModeVisible;
  bool get progModeVisible => _progModeVisible ?? false;
  set progModeVisible(bool? val) => _progModeVisible = val;

  bool hasProgModeVisible() => _progModeVisible != null;

  // "deviseDiscript" field.
  String? _deviseDiscript;
  String get deviseDiscript => _deviseDiscript ?? 'Термостат';
  set deviseDiscript(String? val) => _deviseDiscript = val;

  bool hasDeviseDiscript() => _deviseDiscript != null;

  // "tempereReadHighByteString" field.
  String? _tempereReadHighByteString;
  String get tempereReadHighByteString => _tempereReadHighByteString ?? '23';
  set tempereReadHighByteString(String? val) =>
      _tempereReadHighByteString = val;

  bool hasTempereReadHighByteString() => _tempereReadHighByteString != null;

  // "tempereReadLowByteString" field.
  String? _tempereReadLowByteString;
  String get tempereReadLowByteString => _tempereReadLowByteString ?? '0';
  set tempereReadLowByteString(String? val) => _tempereReadLowByteString = val;

  bool hasTempereReadLowByteString() => _tempereReadLowByteString != null;

  // "tempereReadColor" field.
  Color? _tempereReadColor;
  Color get tempereReadColor => _tempereReadColor ?? const Color(0xFF6E6C6C);
  set tempereReadColor(Color? val) => _tempereReadColor = val;

  bool hasTempereReadColor() => _tempereReadColor != null;

  // "sensorDiscript" field.
  String? _sensorDiscript;
  String get sensorDiscript => _sensorDiscript ?? 'Пол :';
  set sensorDiscript(String? val) => _sensorDiscript = val;

  bool hasSensorDiscript() => _sensorDiscript != null;

  // "HeatIconVisible" field.
  double? _heatIconVisible;
  double get heatIconVisible => _heatIconVisible ?? 0.0;
  set heatIconVisible(double? val) => _heatIconVisible = val;

  void incrementHeatIconVisible(double amount) =>
      heatIconVisible = heatIconVisible + amount;

  bool hasHeatIconVisible() => _heatIconVisible != null;

  // "settingsSensorName" field.
  String? _settingsSensorName;
  String get settingsSensorName =>
      _settingsSensorName ?? 'Гистерезис,  “Пол”, °С';
  set settingsSensorName(String? val) => _settingsSensorName = val;

  bool hasSettingsSensorName() => _settingsSensorName != null;

  // "deviceHysteresis" field.
  String? _deviceHysteresis;
  String get deviceHysteresis => _deviceHysteresis ?? '0.5';
  set deviceHysteresis(String? val) => _deviceHysteresis = val;

  bool hasDeviceHysteresis() => _deviceHysteresis != null;

  // "HeatIconVisibleForList" field.
  bool? _heatIconVisibleForList;
  bool get heatIconVisibleForList => _heatIconVisibleForList ?? false;
  set heatIconVisibleForList(bool? val) => _heatIconVisibleForList = val;

  bool hasHeatIconVisibleForList() => _heatIconVisibleForList != null;

  // "keyBlockOnOff" field.
  bool? _keyBlockOnOff;
  bool get keyBlockOnOff => _keyBlockOnOff ?? false;
  set keyBlockOnOff(bool? val) => _keyBlockOnOff = val;

  bool hasKeyBlockOnOff() => _keyBlockOnOff != null;

  // "sfmModeOnOff" field.
  bool? _sfmModeOnOff;
  bool get sfmModeOnOff => _sfmModeOnOff ?? false;
  set sfmModeOnOff(bool? val) => _sfmModeOnOff = val;

  bool hasSfmModeOnOff() => _sfmModeOnOff != null;

  // "color1OnOff" field.
  bool? _color1OnOff;
  bool get color1OnOff => _color1OnOff ?? false;
  set color1OnOff(bool? val) => _color1OnOff = val;

  bool hasColor1OnOff() => _color1OnOff != null;

  // "color2OnOff" field.
  bool? _color2OnOff;
  bool get color2OnOff => _color2OnOff ?? true;
  set color2OnOff(bool? val) => _color2OnOff = val;

  bool hasColor2OnOff() => _color2OnOff != null;

  // "color3OnOff" field.
  bool? _color3OnOff;
  bool get color3OnOff => _color3OnOff ?? false;
  set color3OnOff(bool? val) => _color3OnOff = val;

  bool hasColor3OnOff() => _color3OnOff != null;

  // "color4OnOff" field.
  bool? _color4OnOff;
  bool get color4OnOff => _color4OnOff ?? false;
  set color4OnOff(bool? val) => _color4OnOff = val;

  bool hasColor4OnOff() => _color4OnOff != null;

  // "color5OnOff" field.
  bool? _color5OnOff;
  bool get color5OnOff => _color5OnOff ?? false;
  set color5OnOff(bool? val) => _color5OnOff = val;

  bool hasColor5OnOff() => _color5OnOff != null;

  // "color6OnOff" field.
  bool? _color6OnOff;
  bool get color6OnOff => _color6OnOff ?? false;
  set color6OnOff(bool? val) => _color6OnOff = val;

  bool hasColor6OnOff() => _color6OnOff != null;

  // "color7OnOff" field.
  bool? _color7OnOff;
  bool get color7OnOff => _color7OnOff ?? false;
  set color7OnOff(bool? val) => _color7OnOff = val;

  bool hasColor7OnOff() => _color7OnOff != null;

  // "color8OnOff" field.
  bool? _color8OnOff;
  bool get color8OnOff => _color8OnOff ?? false;
  set color8OnOff(bool? val) => _color8OnOff = val;

  bool hasColor8OnOff() => _color8OnOff != null;

  // "deviceColor" field.
  Color? _deviceColor;
  Color get deviceColor => _deviceColor ?? const Color(0xF3BD231B);
  set deviceColor(Color? val) => _deviceColor = val;

  bool hasDeviceColor() => _deviceColor != null;

  // "standartShedullMode" field.
  bool? _standartShedullMode;
  bool get standartShedullMode => _standartShedullMode ?? true;
  set standartShedullMode(bool? val) => _standartShedullMode = val;

  bool hasStandartShedullMode() => _standartShedullMode != null;

  // "customShedullMode" field.
  bool? _customShedullMode;
  bool get customShedullMode => _customShedullMode ?? false;
  set customShedullMode(bool? val) => _customShedullMode = val;

  bool hasCustomShedullMode() => _customShedullMode != null;

  // "customColor" field.
  Color? _customColor;
  Color get customColor => _customColor ?? const Color(0xFF090909);
  set customColor(Color? val) => _customColor = val;

  bool hasCustomColor() => _customColor != null;

  // "day1Select" field.
  Color? _day1Select;
  Color get day1Select => _day1Select ?? const Color(0xFF838A9D);
  set day1Select(Color? val) => _day1Select = val;

  bool hasDay1Select() => _day1Select != null;

  // "day2Select" field.
  Color? _day2Select;
  Color get day2Select => _day2Select ?? Colors.white;
  set day2Select(Color? val) => _day2Select = val;

  bool hasDay2Select() => _day2Select != null;

  // "day3Select" field.
  Color? _day3Select;
  Color get day3Select => _day3Select ?? Colors.white;
  set day3Select(Color? val) => _day3Select = val;

  bool hasDay3Select() => _day3Select != null;

  // "day4Select" field.
  Color? _day4Select;
  Color get day4Select => _day4Select ?? Colors.white;
  set day4Select(Color? val) => _day4Select = val;

  bool hasDay4Select() => _day4Select != null;

  // "day5Select" field.
  Color? _day5Select;
  Color get day5Select => _day5Select ?? Colors.white;
  set day5Select(Color? val) => _day5Select = val;

  bool hasDay5Select() => _day5Select != null;

  // "day6Select" field.
  Color? _day6Select;
  Color get day6Select => _day6Select ?? Colors.white;
  set day6Select(Color? val) => _day6Select = val;

  bool hasDay6Select() => _day6Select != null;

  // "day7Select" field.
  Color? _day7Select;
  Color get day7Select => _day7Select ?? Colors.white;
  set day7Select(Color? val) => _day7Select = val;

  bool hasDay7Select() => _day7Select != null;

  static MyDeviceStruct fromMap(Map<String, dynamic> data) => MyDeviceStruct(
        id: data['ID'] as String?,
        name: data['Name'] as String?,
        onOff: castToType<int>(data['on_off']),
        face: data['FACE'] as String?,
        tempereSetHigthByte: castToType<int>(data['TempereSetHigthByte']),
        tempereSetLowByte: castToType<int>(data['TempereSetLowByte']),
        tempereReadHigthByte: castToType<int>(data['TempereReadHigthByte']),
        tempereReadLowByte: castToType<int>(data['TempereReadLowByte']),
        statusConnectColor: getSchemaColor(data['StatusConnectColor']),
        statusConnectState: castToType<int>(data['StatusConnectState']),
        onOffKnobState: castToType<int>(data['OnOffKnobState']),
        onOffKnobValue: data['OnOffKnobValue'] as String?,
        handProgModeSwich: data['handProgModeSwich'] as bool?,
        handModeColor: getSchemaColor(data['handModeColor']),
        progModeColor: getSchemaColor(data['progModeColor']),
        handModeVisible: data['handModeVisible'] as bool?,
        progModeVisible: data['progModeVisible'] as bool?,
        deviseDiscript: data['deviseDiscript'] as String?,
        tempereReadHighByteString: data['tempereReadHighByteString'] as String?,
        tempereReadLowByteString: data['tempereReadLowByteString'] as String?,
        tempereReadColor: getSchemaColor(data['tempereReadColor']),
        sensorDiscript: data['sensorDiscript'] as String?,
        heatIconVisible: castToType<double>(data['HeatIconVisible']),
        settingsSensorName: data['settingsSensorName'] as String?,
        deviceHysteresis: data['deviceHysteresis'] as String?,
        heatIconVisibleForList: data['HeatIconVisibleForList'] as bool?,
        keyBlockOnOff: data['keyBlockOnOff'] as bool?,
        sfmModeOnOff: data['sfmModeOnOff'] as bool?,
        color1OnOff: data['color1OnOff'] as bool?,
        color2OnOff: data['color2OnOff'] as bool?,
        color3OnOff: data['color3OnOff'] as bool?,
        color4OnOff: data['color4OnOff'] as bool?,
        color5OnOff: data['color5OnOff'] as bool?,
        color6OnOff: data['color6OnOff'] as bool?,
        color7OnOff: data['color7OnOff'] as bool?,
        color8OnOff: data['color8OnOff'] as bool?,
        deviceColor: getSchemaColor(data['deviceColor']),
        standartShedullMode: data['standartShedullMode'] as bool?,
        customShedullMode: data['customShedullMode'] as bool?,
        customColor: getSchemaColor(data['customColor']),
        day1Select: getSchemaColor(data['day1Select']),
        day2Select: getSchemaColor(data['day2Select']),
        day3Select: getSchemaColor(data['day3Select']),
        day4Select: getSchemaColor(data['day4Select']),
        day5Select: getSchemaColor(data['day5Select']),
        day6Select: getSchemaColor(data['day6Select']),
        day7Select: getSchemaColor(data['day7Select']),
      );

  static MyDeviceStruct? maybeFromMap(dynamic data) =>
      data is Map ? MyDeviceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ID': _id,
        'Name': _name,
        'on_off': _onOff,
        'FACE': _face,
        'TempereSetHigthByte': _tempereSetHigthByte,
        'TempereSetLowByte': _tempereSetLowByte,
        'TempereReadHigthByte': _tempereReadHigthByte,
        'TempereReadLowByte': _tempereReadLowByte,
        'StatusConnectColor': _statusConnectColor,
        'StatusConnectState': _statusConnectState,
        'OnOffKnobState': _onOffKnobState,
        'OnOffKnobValue': _onOffKnobValue,
        'handProgModeSwich': _handProgModeSwich,
        'handModeColor': _handModeColor,
        'progModeColor': _progModeColor,
        'handModeVisible': _handModeVisible,
        'progModeVisible': _progModeVisible,
        'deviseDiscript': _deviseDiscript,
        'tempereReadHighByteString': _tempereReadHighByteString,
        'tempereReadLowByteString': _tempereReadLowByteString,
        'tempereReadColor': _tempereReadColor,
        'sensorDiscript': _sensorDiscript,
        'HeatIconVisible': _heatIconVisible,
        'settingsSensorName': _settingsSensorName,
        'deviceHysteresis': _deviceHysteresis,
        'HeatIconVisibleForList': _heatIconVisibleForList,
        'keyBlockOnOff': _keyBlockOnOff,
        'sfmModeOnOff': _sfmModeOnOff,
        'color1OnOff': _color1OnOff,
        'color2OnOff': _color2OnOff,
        'color3OnOff': _color3OnOff,
        'color4OnOff': _color4OnOff,
        'color5OnOff': _color5OnOff,
        'color6OnOff': _color6OnOff,
        'color7OnOff': _color7OnOff,
        'color8OnOff': _color8OnOff,
        'deviceColor': _deviceColor,
        'standartShedullMode': _standartShedullMode,
        'customShedullMode': _customShedullMode,
        'customColor': _customColor,
        'day1Select': _day1Select,
        'day2Select': _day2Select,
        'day3Select': _day3Select,
        'day4Select': _day4Select,
        'day5Select': _day5Select,
        'day6Select': _day6Select,
        'day7Select': _day7Select,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID': serializeParam(
          _id,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'on_off': serializeParam(
          _onOff,
          ParamType.int,
        ),
        'FACE': serializeParam(
          _face,
          ParamType.String,
        ),
        'TempereSetHigthByte': serializeParam(
          _tempereSetHigthByte,
          ParamType.int,
        ),
        'TempereSetLowByte': serializeParam(
          _tempereSetLowByte,
          ParamType.int,
        ),
        'TempereReadHigthByte': serializeParam(
          _tempereReadHigthByte,
          ParamType.int,
        ),
        'TempereReadLowByte': serializeParam(
          _tempereReadLowByte,
          ParamType.int,
        ),
        'StatusConnectColor': serializeParam(
          _statusConnectColor,
          ParamType.Color,
        ),
        'StatusConnectState': serializeParam(
          _statusConnectState,
          ParamType.int,
        ),
        'OnOffKnobState': serializeParam(
          _onOffKnobState,
          ParamType.int,
        ),
        'OnOffKnobValue': serializeParam(
          _onOffKnobValue,
          ParamType.String,
        ),
        'handProgModeSwich': serializeParam(
          _handProgModeSwich,
          ParamType.bool,
        ),
        'handModeColor': serializeParam(
          _handModeColor,
          ParamType.Color,
        ),
        'progModeColor': serializeParam(
          _progModeColor,
          ParamType.Color,
        ),
        'handModeVisible': serializeParam(
          _handModeVisible,
          ParamType.bool,
        ),
        'progModeVisible': serializeParam(
          _progModeVisible,
          ParamType.bool,
        ),
        'deviseDiscript': serializeParam(
          _deviseDiscript,
          ParamType.String,
        ),
        'tempereReadHighByteString': serializeParam(
          _tempereReadHighByteString,
          ParamType.String,
        ),
        'tempereReadLowByteString': serializeParam(
          _tempereReadLowByteString,
          ParamType.String,
        ),
        'tempereReadColor': serializeParam(
          _tempereReadColor,
          ParamType.Color,
        ),
        'sensorDiscript': serializeParam(
          _sensorDiscript,
          ParamType.String,
        ),
        'HeatIconVisible': serializeParam(
          _heatIconVisible,
          ParamType.double,
        ),
        'settingsSensorName': serializeParam(
          _settingsSensorName,
          ParamType.String,
        ),
        'deviceHysteresis': serializeParam(
          _deviceHysteresis,
          ParamType.String,
        ),
        'HeatIconVisibleForList': serializeParam(
          _heatIconVisibleForList,
          ParamType.bool,
        ),
        'keyBlockOnOff': serializeParam(
          _keyBlockOnOff,
          ParamType.bool,
        ),
        'sfmModeOnOff': serializeParam(
          _sfmModeOnOff,
          ParamType.bool,
        ),
        'color1OnOff': serializeParam(
          _color1OnOff,
          ParamType.bool,
        ),
        'color2OnOff': serializeParam(
          _color2OnOff,
          ParamType.bool,
        ),
        'color3OnOff': serializeParam(
          _color3OnOff,
          ParamType.bool,
        ),
        'color4OnOff': serializeParam(
          _color4OnOff,
          ParamType.bool,
        ),
        'color5OnOff': serializeParam(
          _color5OnOff,
          ParamType.bool,
        ),
        'color6OnOff': serializeParam(
          _color6OnOff,
          ParamType.bool,
        ),
        'color7OnOff': serializeParam(
          _color7OnOff,
          ParamType.bool,
        ),
        'color8OnOff': serializeParam(
          _color8OnOff,
          ParamType.bool,
        ),
        'deviceColor': serializeParam(
          _deviceColor,
          ParamType.Color,
        ),
        'standartShedullMode': serializeParam(
          _standartShedullMode,
          ParamType.bool,
        ),
        'customShedullMode': serializeParam(
          _customShedullMode,
          ParamType.bool,
        ),
        'customColor': serializeParam(
          _customColor,
          ParamType.Color,
        ),
        'day1Select': serializeParam(
          _day1Select,
          ParamType.Color,
        ),
        'day2Select': serializeParam(
          _day2Select,
          ParamType.Color,
        ),
        'day3Select': serializeParam(
          _day3Select,
          ParamType.Color,
        ),
        'day4Select': serializeParam(
          _day4Select,
          ParamType.Color,
        ),
        'day5Select': serializeParam(
          _day5Select,
          ParamType.Color,
        ),
        'day6Select': serializeParam(
          _day6Select,
          ParamType.Color,
        ),
        'day7Select': serializeParam(
          _day7Select,
          ParamType.Color,
        ),
      }.withoutNulls;

  static MyDeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      MyDeviceStruct(
        id: deserializeParam(
          data['ID'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        onOff: deserializeParam(
          data['on_off'],
          ParamType.int,
          false,
        ),
        face: deserializeParam(
          data['FACE'],
          ParamType.String,
          false,
        ),
        tempereSetHigthByte: deserializeParam(
          data['TempereSetHigthByte'],
          ParamType.int,
          false,
        ),
        tempereSetLowByte: deserializeParam(
          data['TempereSetLowByte'],
          ParamType.int,
          false,
        ),
        tempereReadHigthByte: deserializeParam(
          data['TempereReadHigthByte'],
          ParamType.int,
          false,
        ),
        tempereReadLowByte: deserializeParam(
          data['TempereReadLowByte'],
          ParamType.int,
          false,
        ),
        statusConnectColor: deserializeParam(
          data['StatusConnectColor'],
          ParamType.Color,
          false,
        ),
        statusConnectState: deserializeParam(
          data['StatusConnectState'],
          ParamType.int,
          false,
        ),
        onOffKnobState: deserializeParam(
          data['OnOffKnobState'],
          ParamType.int,
          false,
        ),
        onOffKnobValue: deserializeParam(
          data['OnOffKnobValue'],
          ParamType.String,
          false,
        ),
        handProgModeSwich: deserializeParam(
          data['handProgModeSwich'],
          ParamType.bool,
          false,
        ),
        handModeColor: deserializeParam(
          data['handModeColor'],
          ParamType.Color,
          false,
        ),
        progModeColor: deserializeParam(
          data['progModeColor'],
          ParamType.Color,
          false,
        ),
        handModeVisible: deserializeParam(
          data['handModeVisible'],
          ParamType.bool,
          false,
        ),
        progModeVisible: deserializeParam(
          data['progModeVisible'],
          ParamType.bool,
          false,
        ),
        deviseDiscript: deserializeParam(
          data['deviseDiscript'],
          ParamType.String,
          false,
        ),
        tempereReadHighByteString: deserializeParam(
          data['tempereReadHighByteString'],
          ParamType.String,
          false,
        ),
        tempereReadLowByteString: deserializeParam(
          data['tempereReadLowByteString'],
          ParamType.String,
          false,
        ),
        tempereReadColor: deserializeParam(
          data['tempereReadColor'],
          ParamType.Color,
          false,
        ),
        sensorDiscript: deserializeParam(
          data['sensorDiscript'],
          ParamType.String,
          false,
        ),
        heatIconVisible: deserializeParam(
          data['HeatIconVisible'],
          ParamType.double,
          false,
        ),
        settingsSensorName: deserializeParam(
          data['settingsSensorName'],
          ParamType.String,
          false,
        ),
        deviceHysteresis: deserializeParam(
          data['deviceHysteresis'],
          ParamType.String,
          false,
        ),
        heatIconVisibleForList: deserializeParam(
          data['HeatIconVisibleForList'],
          ParamType.bool,
          false,
        ),
        keyBlockOnOff: deserializeParam(
          data['keyBlockOnOff'],
          ParamType.bool,
          false,
        ),
        sfmModeOnOff: deserializeParam(
          data['sfmModeOnOff'],
          ParamType.bool,
          false,
        ),
        color1OnOff: deserializeParam(
          data['color1OnOff'],
          ParamType.bool,
          false,
        ),
        color2OnOff: deserializeParam(
          data['color2OnOff'],
          ParamType.bool,
          false,
        ),
        color3OnOff: deserializeParam(
          data['color3OnOff'],
          ParamType.bool,
          false,
        ),
        color4OnOff: deserializeParam(
          data['color4OnOff'],
          ParamType.bool,
          false,
        ),
        color5OnOff: deserializeParam(
          data['color5OnOff'],
          ParamType.bool,
          false,
        ),
        color6OnOff: deserializeParam(
          data['color6OnOff'],
          ParamType.bool,
          false,
        ),
        color7OnOff: deserializeParam(
          data['color7OnOff'],
          ParamType.bool,
          false,
        ),
        color8OnOff: deserializeParam(
          data['color8OnOff'],
          ParamType.bool,
          false,
        ),
        deviceColor: deserializeParam(
          data['deviceColor'],
          ParamType.Color,
          false,
        ),
        standartShedullMode: deserializeParam(
          data['standartShedullMode'],
          ParamType.bool,
          false,
        ),
        customShedullMode: deserializeParam(
          data['customShedullMode'],
          ParamType.bool,
          false,
        ),
        customColor: deserializeParam(
          data['customColor'],
          ParamType.Color,
          false,
        ),
        day1Select: deserializeParam(
          data['day1Select'],
          ParamType.Color,
          false,
        ),
        day2Select: deserializeParam(
          data['day2Select'],
          ParamType.Color,
          false,
        ),
        day3Select: deserializeParam(
          data['day3Select'],
          ParamType.Color,
          false,
        ),
        day4Select: deserializeParam(
          data['day4Select'],
          ParamType.Color,
          false,
        ),
        day5Select: deserializeParam(
          data['day5Select'],
          ParamType.Color,
          false,
        ),
        day6Select: deserializeParam(
          data['day6Select'],
          ParamType.Color,
          false,
        ),
        day7Select: deserializeParam(
          data['day7Select'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'MyDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MyDeviceStruct &&
        id == other.id &&
        name == other.name &&
        onOff == other.onOff &&
        face == other.face &&
        tempereSetHigthByte == other.tempereSetHigthByte &&
        tempereSetLowByte == other.tempereSetLowByte &&
        tempereReadHigthByte == other.tempereReadHigthByte &&
        tempereReadLowByte == other.tempereReadLowByte &&
        statusConnectColor == other.statusConnectColor &&
        statusConnectState == other.statusConnectState &&
        onOffKnobState == other.onOffKnobState &&
        onOffKnobValue == other.onOffKnobValue &&
        handProgModeSwich == other.handProgModeSwich &&
        handModeColor == other.handModeColor &&
        progModeColor == other.progModeColor &&
        handModeVisible == other.handModeVisible &&
        progModeVisible == other.progModeVisible &&
        deviseDiscript == other.deviseDiscript &&
        tempereReadHighByteString == other.tempereReadHighByteString &&
        tempereReadLowByteString == other.tempereReadLowByteString &&
        tempereReadColor == other.tempereReadColor &&
        sensorDiscript == other.sensorDiscript &&
        heatIconVisible == other.heatIconVisible &&
        settingsSensorName == other.settingsSensorName &&
        deviceHysteresis == other.deviceHysteresis &&
        heatIconVisibleForList == other.heatIconVisibleForList &&
        keyBlockOnOff == other.keyBlockOnOff &&
        sfmModeOnOff == other.sfmModeOnOff &&
        color1OnOff == other.color1OnOff &&
        color2OnOff == other.color2OnOff &&
        color3OnOff == other.color3OnOff &&
        color4OnOff == other.color4OnOff &&
        color5OnOff == other.color5OnOff &&
        color6OnOff == other.color6OnOff &&
        color7OnOff == other.color7OnOff &&
        color8OnOff == other.color8OnOff &&
        deviceColor == other.deviceColor &&
        standartShedullMode == other.standartShedullMode &&
        customShedullMode == other.customShedullMode &&
        customColor == other.customColor &&
        day1Select == other.day1Select &&
        day2Select == other.day2Select &&
        day3Select == other.day3Select &&
        day4Select == other.day4Select &&
        day5Select == other.day5Select &&
        day6Select == other.day6Select &&
        day7Select == other.day7Select;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        onOff,
        face,
        tempereSetHigthByte,
        tempereSetLowByte,
        tempereReadHigthByte,
        tempereReadLowByte,
        statusConnectColor,
        statusConnectState,
        onOffKnobState,
        onOffKnobValue,
        handProgModeSwich,
        handModeColor,
        progModeColor,
        handModeVisible,
        progModeVisible,
        deviseDiscript,
        tempereReadHighByteString,
        tempereReadLowByteString,
        tempereReadColor,
        sensorDiscript,
        heatIconVisible,
        settingsSensorName,
        deviceHysteresis,
        heatIconVisibleForList,
        keyBlockOnOff,
        sfmModeOnOff,
        color1OnOff,
        color2OnOff,
        color3OnOff,
        color4OnOff,
        color5OnOff,
        color6OnOff,
        color7OnOff,
        color8OnOff,
        deviceColor,
        standartShedullMode,
        customShedullMode,
        customColor,
        day1Select,
        day2Select,
        day3Select,
        day4Select,
        day5Select,
        day6Select,
        day7Select
      ]);
}

MyDeviceStruct createMyDeviceStruct({
  String? id,
  String? name,
  int? onOff,
  String? face,
  int? tempereSetHigthByte,
  int? tempereSetLowByte,
  int? tempereReadHigthByte,
  int? tempereReadLowByte,
  Color? statusConnectColor,
  int? statusConnectState,
  int? onOffKnobState,
  String? onOffKnobValue,
  bool? handProgModeSwich,
  Color? handModeColor,
  Color? progModeColor,
  bool? handModeVisible,
  bool? progModeVisible,
  String? deviseDiscript,
  String? tempereReadHighByteString,
  String? tempereReadLowByteString,
  Color? tempereReadColor,
  String? sensorDiscript,
  double? heatIconVisible,
  String? settingsSensorName,
  String? deviceHysteresis,
  bool? heatIconVisibleForList,
  bool? keyBlockOnOff,
  bool? sfmModeOnOff,
  bool? color1OnOff,
  bool? color2OnOff,
  bool? color3OnOff,
  bool? color4OnOff,
  bool? color5OnOff,
  bool? color6OnOff,
  bool? color7OnOff,
  bool? color8OnOff,
  Color? deviceColor,
  bool? standartShedullMode,
  bool? customShedullMode,
  Color? customColor,
  Color? day1Select,
  Color? day2Select,
  Color? day3Select,
  Color? day4Select,
  Color? day5Select,
  Color? day6Select,
  Color? day7Select,
}) =>
    MyDeviceStruct(
      id: id,
      name: name,
      onOff: onOff,
      face: face,
      tempereSetHigthByte: tempereSetHigthByte,
      tempereSetLowByte: tempereSetLowByte,
      tempereReadHigthByte: tempereReadHigthByte,
      tempereReadLowByte: tempereReadLowByte,
      statusConnectColor: statusConnectColor,
      statusConnectState: statusConnectState,
      onOffKnobState: onOffKnobState,
      onOffKnobValue: onOffKnobValue,
      handProgModeSwich: handProgModeSwich,
      handModeColor: handModeColor,
      progModeColor: progModeColor,
      handModeVisible: handModeVisible,
      progModeVisible: progModeVisible,
      deviseDiscript: deviseDiscript,
      tempereReadHighByteString: tempereReadHighByteString,
      tempereReadLowByteString: tempereReadLowByteString,
      tempereReadColor: tempereReadColor,
      sensorDiscript: sensorDiscript,
      heatIconVisible: heatIconVisible,
      settingsSensorName: settingsSensorName,
      deviceHysteresis: deviceHysteresis,
      heatIconVisibleForList: heatIconVisibleForList,
      keyBlockOnOff: keyBlockOnOff,
      sfmModeOnOff: sfmModeOnOff,
      color1OnOff: color1OnOff,
      color2OnOff: color2OnOff,
      color3OnOff: color3OnOff,
      color4OnOff: color4OnOff,
      color5OnOff: color5OnOff,
      color6OnOff: color6OnOff,
      color7OnOff: color7OnOff,
      color8OnOff: color8OnOff,
      deviceColor: deviceColor,
      standartShedullMode: standartShedullMode,
      customShedullMode: customShedullMode,
      customColor: customColor,
      day1Select: day1Select,
      day2Select: day2Select,
      day3Select: day3Select,
      day4Select: day4Select,
      day5Select: day5Select,
      day6Select: day6Select,
      day7Select: day7Select,
    );
