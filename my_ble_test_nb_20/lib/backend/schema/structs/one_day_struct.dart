// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OneDayStruct extends BaseStruct {
  OneDayStruct({
    List<MyShedullIntervalsStruct>? dayIntervalsCustom,
    List<MyStandartIntervalsStruct>? dayIntervalsStandart,
  })  : _dayIntervalsCustom = dayIntervalsCustom,
        _dayIntervalsStandart = dayIntervalsStandart;

  // "dayIntervalsCustom" field.
  List<MyShedullIntervalsStruct>? _dayIntervalsCustom;
  List<MyShedullIntervalsStruct> get dayIntervalsCustom =>
      _dayIntervalsCustom ?? const [];
  set dayIntervalsCustom(List<MyShedullIntervalsStruct>? val) =>
      _dayIntervalsCustom = val;

  void updateDayIntervalsCustom(
      Function(List<MyShedullIntervalsStruct>) updateFn) {
    updateFn(_dayIntervalsCustom ??= []);
  }

  bool hasDayIntervalsCustom() => _dayIntervalsCustom != null;

  // "dayIntervalsStandart" field.
  List<MyStandartIntervalsStruct>? _dayIntervalsStandart;
  List<MyStandartIntervalsStruct> get dayIntervalsStandart =>
      _dayIntervalsStandart ?? const [];
  set dayIntervalsStandart(List<MyStandartIntervalsStruct>? val) =>
      _dayIntervalsStandart = val;

  void updateDayIntervalsStandart(
      Function(List<MyStandartIntervalsStruct>) updateFn) {
    updateFn(_dayIntervalsStandart ??= []);
  }

  bool hasDayIntervalsStandart() => _dayIntervalsStandart != null;

  static OneDayStruct fromMap(Map<String, dynamic> data) => OneDayStruct(
        dayIntervalsCustom: getStructList(
          data['dayIntervalsCustom'],
          MyShedullIntervalsStruct.fromMap,
        ),
        dayIntervalsStandart: getStructList(
          data['dayIntervalsStandart'],
          MyStandartIntervalsStruct.fromMap,
        ),
      );

  static OneDayStruct? maybeFromMap(dynamic data) =>
      data is Map ? OneDayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'dayIntervalsCustom':
            _dayIntervalsCustom?.map((e) => e.toMap()).toList(),
        'dayIntervalsStandart':
            _dayIntervalsStandart?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dayIntervalsCustom': serializeParam(
          _dayIntervalsCustom,
          ParamType.DataStruct,
          isList: true,
        ),
        'dayIntervalsStandart': serializeParam(
          _dayIntervalsStandart,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static OneDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      OneDayStruct(
        dayIntervalsCustom: deserializeStructParam<MyShedullIntervalsStruct>(
          data['dayIntervalsCustom'],
          ParamType.DataStruct,
          true,
          structBuilder: MyShedullIntervalsStruct.fromSerializableMap,
        ),
        dayIntervalsStandart: deserializeStructParam<MyStandartIntervalsStruct>(
          data['dayIntervalsStandart'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStandartIntervalsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OneDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OneDayStruct &&
        listEquality.equals(dayIntervalsCustom, other.dayIntervalsCustom) &&
        listEquality.equals(dayIntervalsStandart, other.dayIntervalsStandart);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dayIntervalsCustom, dayIntervalsStandart]);
}

OneDayStruct createOneDayStruct() => OneDayStruct();
