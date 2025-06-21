// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShedullIntervalsStruct extends BaseStruct {
  ShedullIntervalsStruct({
    String? icon,
    String? temperatureHigtByte,
    String? temperatureLowByte,
    String? timeHour,
    String? timeMinut,
  })  : _icon = icon,
        _temperatureHigtByte = temperatureHigtByte,
        _temperatureLowByte = temperatureLowByte,
        _timeHour = timeHour,
        _timeMinut = timeMinut;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "temperatureHigtByte" field.
  String? _temperatureHigtByte;
  String get temperatureHigtByte => _temperatureHigtByte ?? '';
  set temperatureHigtByte(String? val) => _temperatureHigtByte = val;

  bool hasTemperatureHigtByte() => _temperatureHigtByte != null;

  // "temperatureLowByte" field.
  String? _temperatureLowByte;
  String get temperatureLowByte => _temperatureLowByte ?? '';
  set temperatureLowByte(String? val) => _temperatureLowByte = val;

  bool hasTemperatureLowByte() => _temperatureLowByte != null;

  // "timeHour" field.
  String? _timeHour;
  String get timeHour => _timeHour ?? '';
  set timeHour(String? val) => _timeHour = val;

  bool hasTimeHour() => _timeHour != null;

  // "timeMinut" field.
  String? _timeMinut;
  String get timeMinut => _timeMinut ?? '';
  set timeMinut(String? val) => _timeMinut = val;

  bool hasTimeMinut() => _timeMinut != null;

  static ShedullIntervalsStruct fromMap(Map<String, dynamic> data) =>
      ShedullIntervalsStruct(
        icon: data['icon'] as String?,
        temperatureHigtByte: data['temperatureHigtByte'] as String?,
        temperatureLowByte: data['temperatureLowByte'] as String?,
        timeHour: data['timeHour'] as String?,
        timeMinut: data['timeMinut'] as String?,
      );

  static ShedullIntervalsStruct? maybeFromMap(dynamic data) => data is Map
      ? ShedullIntervalsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'icon': _icon,
        'temperatureHigtByte': _temperatureHigtByte,
        'temperatureLowByte': _temperatureLowByte,
        'timeHour': _timeHour,
        'timeMinut': _timeMinut,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'temperatureHigtByte': serializeParam(
          _temperatureHigtByte,
          ParamType.String,
        ),
        'temperatureLowByte': serializeParam(
          _temperatureLowByte,
          ParamType.String,
        ),
        'timeHour': serializeParam(
          _timeHour,
          ParamType.String,
        ),
        'timeMinut': serializeParam(
          _timeMinut,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShedullIntervalsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ShedullIntervalsStruct(
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        temperatureHigtByte: deserializeParam(
          data['temperatureHigtByte'],
          ParamType.String,
          false,
        ),
        temperatureLowByte: deserializeParam(
          data['temperatureLowByte'],
          ParamType.String,
          false,
        ),
        timeHour: deserializeParam(
          data['timeHour'],
          ParamType.String,
          false,
        ),
        timeMinut: deserializeParam(
          data['timeMinut'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShedullIntervalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShedullIntervalsStruct &&
        icon == other.icon &&
        temperatureHigtByte == other.temperatureHigtByte &&
        temperatureLowByte == other.temperatureLowByte &&
        timeHour == other.timeHour &&
        timeMinut == other.timeMinut;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [icon, temperatureHigtByte, temperatureLowByte, timeHour, timeMinut]);
}

ShedullIntervalsStruct createShedullIntervalsStruct({
  String? icon,
  String? temperatureHigtByte,
  String? temperatureLowByte,
  String? timeHour,
  String? timeMinut,
}) =>
    ShedullIntervalsStruct(
      icon: icon,
      temperatureHigtByte: temperatureHigtByte,
      temperatureLowByte: temperatureLowByte,
      timeHour: timeHour,
      timeMinut: timeMinut,
    );
