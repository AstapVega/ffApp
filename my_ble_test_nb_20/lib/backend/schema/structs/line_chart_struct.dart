// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LineChartStruct extends BaseStruct {
  LineChartStruct({
    int? time,
    int? temper,
  })  : _time = time,
        _temper = temper;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  set time(int? val) => _time = val;

  void incrementTime(int amount) => time = time + amount;

  bool hasTime() => _time != null;

  // "temper" field.
  int? _temper;
  int get temper => _temper ?? 0;
  set temper(int? val) => _temper = val;

  void incrementTemper(int amount) => temper = temper + amount;

  bool hasTemper() => _temper != null;

  static LineChartStruct fromMap(Map<String, dynamic> data) => LineChartStruct(
        time: castToType<int>(data['time']),
        temper: castToType<int>(data['temper']),
      );

  static LineChartStruct? maybeFromMap(dynamic data) => data is Map
      ? LineChartStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'temper': _temper,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.int,
        ),
        'temper': serializeParam(
          _temper,
          ParamType.int,
        ),
      }.withoutNulls;

  static LineChartStruct fromSerializableMap(Map<String, dynamic> data) =>
      LineChartStruct(
        time: deserializeParam(
          data['time'],
          ParamType.int,
          false,
        ),
        temper: deserializeParam(
          data['temper'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LineChartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LineChartStruct &&
        time == other.time &&
        temper == other.temper;
  }

  @override
  int get hashCode => const ListEquality().hash([time, temper]);
}

LineChartStruct createLineChartStruct({
  int? time,
  int? temper,
}) =>
    LineChartStruct(
      time: time,
      temper: temper,
    );
