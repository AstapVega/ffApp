// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DaysShedulleStruct extends BaseStruct {
  DaysShedulleStruct({
    List<StandartIntervalsStruct>? myStandartDayIntervals,
    List<DayShedullIntervalsStruct>? myDayIntervals,
  })  : _myStandartDayIntervals = myStandartDayIntervals,
        _myDayIntervals = myDayIntervals;

  // "MyStandartDayIntervals" field.
  List<StandartIntervalsStruct>? _myStandartDayIntervals;
  List<StandartIntervalsStruct> get myStandartDayIntervals =>
      _myStandartDayIntervals ?? const [];
  set myStandartDayIntervals(List<StandartIntervalsStruct>? val) =>
      _myStandartDayIntervals = val;

  void updateMyStandartDayIntervals(
      Function(List<StandartIntervalsStruct>) updateFn) {
    updateFn(_myStandartDayIntervals ??= []);
  }

  bool hasMyStandartDayIntervals() => _myStandartDayIntervals != null;

  // "MyDayIntervals" field.
  List<DayShedullIntervalsStruct>? _myDayIntervals;
  List<DayShedullIntervalsStruct> get myDayIntervals =>
      _myDayIntervals ?? const [];
  set myDayIntervals(List<DayShedullIntervalsStruct>? val) =>
      _myDayIntervals = val;

  void updateMyDayIntervals(
      Function(List<DayShedullIntervalsStruct>) updateFn) {
    updateFn(_myDayIntervals ??= []);
  }

  bool hasMyDayIntervals() => _myDayIntervals != null;

  static DaysShedulleStruct fromMap(Map<String, dynamic> data) =>
      DaysShedulleStruct(
        myStandartDayIntervals: getStructList(
          data['MyStandartDayIntervals'],
          StandartIntervalsStruct.fromMap,
        ),
        myDayIntervals: getStructList(
          data['MyDayIntervals'],
          DayShedullIntervalsStruct.fromMap,
        ),
      );

  static DaysShedulleStruct? maybeFromMap(dynamic data) => data is Map
      ? DaysShedulleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'MyStandartDayIntervals':
            _myStandartDayIntervals?.map((e) => e.toMap()).toList(),
        'MyDayIntervals': _myDayIntervals?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MyStandartDayIntervals': serializeParam(
          _myStandartDayIntervals,
          ParamType.DataStruct,
          isList: true,
        ),
        'MyDayIntervals': serializeParam(
          _myDayIntervals,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DaysShedulleStruct fromSerializableMap(Map<String, dynamic> data) =>
      DaysShedulleStruct(
        myStandartDayIntervals: deserializeStructParam<StandartIntervalsStruct>(
          data['MyStandartDayIntervals'],
          ParamType.DataStruct,
          true,
          structBuilder: StandartIntervalsStruct.fromSerializableMap,
        ),
        myDayIntervals: deserializeStructParam<DayShedullIntervalsStruct>(
          data['MyDayIntervals'],
          ParamType.DataStruct,
          true,
          structBuilder: DayShedullIntervalsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DaysShedulleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DaysShedulleStruct &&
        listEquality.equals(
            myStandartDayIntervals, other.myStandartDayIntervals) &&
        listEquality.equals(myDayIntervals, other.myDayIntervals);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([myStandartDayIntervals, myDayIntervals]);
}

DaysShedulleStruct createDaysShedulleStruct() => DaysShedulleStruct();
