// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceShedulleStruct extends BaseStruct {
  DeviceShedulleStruct({
    String? id,
    List<MyShedullIntervalsStruct>? day1IntervalsCustom,
    List<MyStandartIntervalsStruct>? day1IntervalsStandart,
    List<MyShedullIntervalsStruct>? day2IntervalsCustom,
    List<MyStandartIntervalsStruct>? day2IntervalsStandart,
    List<MyShedullIntervalsStruct>? day3IntervalsCustom,
    List<MyStandartIntervalsStruct>? day3IntervalsStandart,
    List<MyShedullIntervalsStruct>? day4IntervalsCustom,
    List<MyStandartIntervalsStruct>? day4IntervalsStandart,
    List<MyShedullIntervalsStruct>? day5IntervalsCustom,
    List<MyStandartIntervalsStruct>? day5IntervalsStandart,
    List<MyShedullIntervalsStruct>? day6IntervalsCustom,
    List<MyStandartIntervalsStruct>? day6IntervalsStandart,
    List<MyShedullIntervalsStruct>? day7IntervalsCustom,
    List<MyStandartIntervalsStruct>? day7IntervalsStandart,
    List<OneDayStruct>? days,
  })  : _id = id,
        _day1IntervalsCustom = day1IntervalsCustom,
        _day1IntervalsStandart = day1IntervalsStandart,
        _day2IntervalsCustom = day2IntervalsCustom,
        _day2IntervalsStandart = day2IntervalsStandart,
        _day3IntervalsCustom = day3IntervalsCustom,
        _day3IntervalsStandart = day3IntervalsStandart,
        _day4IntervalsCustom = day4IntervalsCustom,
        _day4IntervalsStandart = day4IntervalsStandart,
        _day5IntervalsCustom = day5IntervalsCustom,
        _day5IntervalsStandart = day5IntervalsStandart,
        _day6IntervalsCustom = day6IntervalsCustom,
        _day6IntervalsStandart = day6IntervalsStandart,
        _day7IntervalsCustom = day7IntervalsCustom,
        _day7IntervalsStandart = day7IntervalsStandart,
        _days = days;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "day1IntervalsCustom" field.
  List<MyShedullIntervalsStruct>? _day1IntervalsCustom;
  List<MyShedullIntervalsStruct> get day1IntervalsCustom =>
      _day1IntervalsCustom ?? const [];
  set day1IntervalsCustom(List<MyShedullIntervalsStruct>? val) =>
      _day1IntervalsCustom = val;

  void updateDay1IntervalsCustom(
      Function(List<MyShedullIntervalsStruct>) updateFn) {
    updateFn(_day1IntervalsCustom ??= []);
  }

  bool hasDay1IntervalsCustom() => _day1IntervalsCustom != null;

  // "day1IntervalsStandart" field.
  List<MyStandartIntervalsStruct>? _day1IntervalsStandart;
  List<MyStandartIntervalsStruct> get day1IntervalsStandart =>
      _day1IntervalsStandart ?? const [];
  set day1IntervalsStandart(List<MyStandartIntervalsStruct>? val) =>
      _day1IntervalsStandart = val;

  void updateDay1IntervalsStandart(
      Function(List<MyStandartIntervalsStruct>) updateFn) {
    updateFn(_day1IntervalsStandart ??= []);
  }

  bool hasDay1IntervalsStandart() => _day1IntervalsStandart != null;

  // "day2IntervalsCustom" field.
  List<MyShedullIntervalsStruct>? _day2IntervalsCustom;
  List<MyShedullIntervalsStruct> get day2IntervalsCustom =>
      _day2IntervalsCustom ?? const [];
  set day2IntervalsCustom(List<MyShedullIntervalsStruct>? val) =>
      _day2IntervalsCustom = val;

  void updateDay2IntervalsCustom(
      Function(List<MyShedullIntervalsStruct>) updateFn) {
    updateFn(_day2IntervalsCustom ??= []);
  }

  bool hasDay2IntervalsCustom() => _day2IntervalsCustom != null;

  // "day2IntervalsStandart" field.
  List<MyStandartIntervalsStruct>? _day2IntervalsStandart;
  List<MyStandartIntervalsStruct> get day2IntervalsStandart =>
      _day2IntervalsStandart ?? const [];
  set day2IntervalsStandart(List<MyStandartIntervalsStruct>? val) =>
      _day2IntervalsStandart = val;

  void updateDay2IntervalsStandart(
      Function(List<MyStandartIntervalsStruct>) updateFn) {
    updateFn(_day2IntervalsStandart ??= []);
  }

  bool hasDay2IntervalsStandart() => _day2IntervalsStandart != null;

  // "day3IntervalsCustom" field.
  List<MyShedullIntervalsStruct>? _day3IntervalsCustom;
  List<MyShedullIntervalsStruct> get day3IntervalsCustom =>
      _day3IntervalsCustom ?? const [];
  set day3IntervalsCustom(List<MyShedullIntervalsStruct>? val) =>
      _day3IntervalsCustom = val;

  void updateDay3IntervalsCustom(
      Function(List<MyShedullIntervalsStruct>) updateFn) {
    updateFn(_day3IntervalsCustom ??= []);
  }

  bool hasDay3IntervalsCustom() => _day3IntervalsCustom != null;

  // "day3IntervalsStandart" field.
  List<MyStandartIntervalsStruct>? _day3IntervalsStandart;
  List<MyStandartIntervalsStruct> get day3IntervalsStandart =>
      _day3IntervalsStandart ?? const [];
  set day3IntervalsStandart(List<MyStandartIntervalsStruct>? val) =>
      _day3IntervalsStandart = val;

  void updateDay3IntervalsStandart(
      Function(List<MyStandartIntervalsStruct>) updateFn) {
    updateFn(_day3IntervalsStandart ??= []);
  }

  bool hasDay3IntervalsStandart() => _day3IntervalsStandart != null;

  // "day4IntervalsCustom" field.
  List<MyShedullIntervalsStruct>? _day4IntervalsCustom;
  List<MyShedullIntervalsStruct> get day4IntervalsCustom =>
      _day4IntervalsCustom ?? const [];
  set day4IntervalsCustom(List<MyShedullIntervalsStruct>? val) =>
      _day4IntervalsCustom = val;

  void updateDay4IntervalsCustom(
      Function(List<MyShedullIntervalsStruct>) updateFn) {
    updateFn(_day4IntervalsCustom ??= []);
  }

  bool hasDay4IntervalsCustom() => _day4IntervalsCustom != null;

  // "day4IntervalsStandart" field.
  List<MyStandartIntervalsStruct>? _day4IntervalsStandart;
  List<MyStandartIntervalsStruct> get day4IntervalsStandart =>
      _day4IntervalsStandart ?? const [];
  set day4IntervalsStandart(List<MyStandartIntervalsStruct>? val) =>
      _day4IntervalsStandart = val;

  void updateDay4IntervalsStandart(
      Function(List<MyStandartIntervalsStruct>) updateFn) {
    updateFn(_day4IntervalsStandart ??= []);
  }

  bool hasDay4IntervalsStandart() => _day4IntervalsStandart != null;

  // "day5IntervalsCustom" field.
  List<MyShedullIntervalsStruct>? _day5IntervalsCustom;
  List<MyShedullIntervalsStruct> get day5IntervalsCustom =>
      _day5IntervalsCustom ?? const [];
  set day5IntervalsCustom(List<MyShedullIntervalsStruct>? val) =>
      _day5IntervalsCustom = val;

  void updateDay5IntervalsCustom(
      Function(List<MyShedullIntervalsStruct>) updateFn) {
    updateFn(_day5IntervalsCustom ??= []);
  }

  bool hasDay5IntervalsCustom() => _day5IntervalsCustom != null;

  // "day5IntervalsStandart" field.
  List<MyStandartIntervalsStruct>? _day5IntervalsStandart;
  List<MyStandartIntervalsStruct> get day5IntervalsStandart =>
      _day5IntervalsStandart ?? const [];
  set day5IntervalsStandart(List<MyStandartIntervalsStruct>? val) =>
      _day5IntervalsStandart = val;

  void updateDay5IntervalsStandart(
      Function(List<MyStandartIntervalsStruct>) updateFn) {
    updateFn(_day5IntervalsStandart ??= []);
  }

  bool hasDay5IntervalsStandart() => _day5IntervalsStandart != null;

  // "day6IntervalsCustom" field.
  List<MyShedullIntervalsStruct>? _day6IntervalsCustom;
  List<MyShedullIntervalsStruct> get day6IntervalsCustom =>
      _day6IntervalsCustom ?? const [];
  set day6IntervalsCustom(List<MyShedullIntervalsStruct>? val) =>
      _day6IntervalsCustom = val;

  void updateDay6IntervalsCustom(
      Function(List<MyShedullIntervalsStruct>) updateFn) {
    updateFn(_day6IntervalsCustom ??= []);
  }

  bool hasDay6IntervalsCustom() => _day6IntervalsCustom != null;

  // "day6IntervalsStandart" field.
  List<MyStandartIntervalsStruct>? _day6IntervalsStandart;
  List<MyStandartIntervalsStruct> get day6IntervalsStandart =>
      _day6IntervalsStandart ?? const [];
  set day6IntervalsStandart(List<MyStandartIntervalsStruct>? val) =>
      _day6IntervalsStandart = val;

  void updateDay6IntervalsStandart(
      Function(List<MyStandartIntervalsStruct>) updateFn) {
    updateFn(_day6IntervalsStandart ??= []);
  }

  bool hasDay6IntervalsStandart() => _day6IntervalsStandart != null;

  // "day7IntervalsCustom" field.
  List<MyShedullIntervalsStruct>? _day7IntervalsCustom;
  List<MyShedullIntervalsStruct> get day7IntervalsCustom =>
      _day7IntervalsCustom ?? const [];
  set day7IntervalsCustom(List<MyShedullIntervalsStruct>? val) =>
      _day7IntervalsCustom = val;

  void updateDay7IntervalsCustom(
      Function(List<MyShedullIntervalsStruct>) updateFn) {
    updateFn(_day7IntervalsCustom ??= []);
  }

  bool hasDay7IntervalsCustom() => _day7IntervalsCustom != null;

  // "day7IntervalsStandart" field.
  List<MyStandartIntervalsStruct>? _day7IntervalsStandart;
  List<MyStandartIntervalsStruct> get day7IntervalsStandart =>
      _day7IntervalsStandart ?? const [];
  set day7IntervalsStandart(List<MyStandartIntervalsStruct>? val) =>
      _day7IntervalsStandart = val;

  void updateDay7IntervalsStandart(
      Function(List<MyStandartIntervalsStruct>) updateFn) {
    updateFn(_day7IntervalsStandart ??= []);
  }

  bool hasDay7IntervalsStandart() => _day7IntervalsStandart != null;

  // "days" field.
  List<OneDayStruct>? _days;
  List<OneDayStruct> get days => _days ?? const [];
  set days(List<OneDayStruct>? val) => _days = val;

  void updateDays(Function(List<OneDayStruct>) updateFn) {
    updateFn(_days ??= []);
  }

  bool hasDays() => _days != null;

  static DeviceShedulleStruct fromMap(Map<String, dynamic> data) =>
      DeviceShedulleStruct(
        id: data['ID'] as String?,
        day1IntervalsCustom: getStructList(
          data['day1IntervalsCustom'],
          MyShedullIntervalsStruct.fromMap,
        ),
        day1IntervalsStandart: getStructList(
          data['day1IntervalsStandart'],
          MyStandartIntervalsStruct.fromMap,
        ),
        day2IntervalsCustom: getStructList(
          data['day2IntervalsCustom'],
          MyShedullIntervalsStruct.fromMap,
        ),
        day2IntervalsStandart: getStructList(
          data['day2IntervalsStandart'],
          MyStandartIntervalsStruct.fromMap,
        ),
        day3IntervalsCustom: getStructList(
          data['day3IntervalsCustom'],
          MyShedullIntervalsStruct.fromMap,
        ),
        day3IntervalsStandart: getStructList(
          data['day3IntervalsStandart'],
          MyStandartIntervalsStruct.fromMap,
        ),
        day4IntervalsCustom: getStructList(
          data['day4IntervalsCustom'],
          MyShedullIntervalsStruct.fromMap,
        ),
        day4IntervalsStandart: getStructList(
          data['day4IntervalsStandart'],
          MyStandartIntervalsStruct.fromMap,
        ),
        day5IntervalsCustom: getStructList(
          data['day5IntervalsCustom'],
          MyShedullIntervalsStruct.fromMap,
        ),
        day5IntervalsStandart: getStructList(
          data['day5IntervalsStandart'],
          MyStandartIntervalsStruct.fromMap,
        ),
        day6IntervalsCustom: getStructList(
          data['day6IntervalsCustom'],
          MyShedullIntervalsStruct.fromMap,
        ),
        day6IntervalsStandart: getStructList(
          data['day6IntervalsStandart'],
          MyStandartIntervalsStruct.fromMap,
        ),
        day7IntervalsCustom: getStructList(
          data['day7IntervalsCustom'],
          MyShedullIntervalsStruct.fromMap,
        ),
        day7IntervalsStandart: getStructList(
          data['day7IntervalsStandart'],
          MyStandartIntervalsStruct.fromMap,
        ),
        days: getStructList(
          data['days'],
          OneDayStruct.fromMap,
        ),
      );

  static DeviceShedulleStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceShedulleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID': _id,
        'day1IntervalsCustom':
            _day1IntervalsCustom?.map((e) => e.toMap()).toList(),
        'day1IntervalsStandart':
            _day1IntervalsStandart?.map((e) => e.toMap()).toList(),
        'day2IntervalsCustom':
            _day2IntervalsCustom?.map((e) => e.toMap()).toList(),
        'day2IntervalsStandart':
            _day2IntervalsStandart?.map((e) => e.toMap()).toList(),
        'day3IntervalsCustom':
            _day3IntervalsCustom?.map((e) => e.toMap()).toList(),
        'day3IntervalsStandart':
            _day3IntervalsStandart?.map((e) => e.toMap()).toList(),
        'day4IntervalsCustom':
            _day4IntervalsCustom?.map((e) => e.toMap()).toList(),
        'day4IntervalsStandart':
            _day4IntervalsStandart?.map((e) => e.toMap()).toList(),
        'day5IntervalsCustom':
            _day5IntervalsCustom?.map((e) => e.toMap()).toList(),
        'day5IntervalsStandart':
            _day5IntervalsStandart?.map((e) => e.toMap()).toList(),
        'day6IntervalsCustom':
            _day6IntervalsCustom?.map((e) => e.toMap()).toList(),
        'day6IntervalsStandart':
            _day6IntervalsStandart?.map((e) => e.toMap()).toList(),
        'day7IntervalsCustom':
            _day7IntervalsCustom?.map((e) => e.toMap()).toList(),
        'day7IntervalsStandart':
            _day7IntervalsStandart?.map((e) => e.toMap()).toList(),
        'days': _days?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID': serializeParam(
          _id,
          ParamType.String,
        ),
        'day1IntervalsCustom': serializeParam(
          _day1IntervalsCustom,
          ParamType.DataStruct,
          isList: true,
        ),
        'day1IntervalsStandart': serializeParam(
          _day1IntervalsStandart,
          ParamType.DataStruct,
          isList: true,
        ),
        'day2IntervalsCustom': serializeParam(
          _day2IntervalsCustom,
          ParamType.DataStruct,
          isList: true,
        ),
        'day2IntervalsStandart': serializeParam(
          _day2IntervalsStandart,
          ParamType.DataStruct,
          isList: true,
        ),
        'day3IntervalsCustom': serializeParam(
          _day3IntervalsCustom,
          ParamType.DataStruct,
          isList: true,
        ),
        'day3IntervalsStandart': serializeParam(
          _day3IntervalsStandart,
          ParamType.DataStruct,
          isList: true,
        ),
        'day4IntervalsCustom': serializeParam(
          _day4IntervalsCustom,
          ParamType.DataStruct,
          isList: true,
        ),
        'day4IntervalsStandart': serializeParam(
          _day4IntervalsStandart,
          ParamType.DataStruct,
          isList: true,
        ),
        'day5IntervalsCustom': serializeParam(
          _day5IntervalsCustom,
          ParamType.DataStruct,
          isList: true,
        ),
        'day5IntervalsStandart': serializeParam(
          _day5IntervalsStandart,
          ParamType.DataStruct,
          isList: true,
        ),
        'day6IntervalsCustom': serializeParam(
          _day6IntervalsCustom,
          ParamType.DataStruct,
          isList: true,
        ),
        'day6IntervalsStandart': serializeParam(
          _day6IntervalsStandart,
          ParamType.DataStruct,
          isList: true,
        ),
        'day7IntervalsCustom': serializeParam(
          _day7IntervalsCustom,
          ParamType.DataStruct,
          isList: true,
        ),
        'day7IntervalsStandart': serializeParam(
          _day7IntervalsStandart,
          ParamType.DataStruct,
          isList: true,
        ),
        'days': serializeParam(
          _days,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DeviceShedulleStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceShedulleStruct(
        id: deserializeParam(
          data['ID'],
          ParamType.String,
          false,
        ),
        day1IntervalsCustom: deserializeStructParam<MyShedullIntervalsStruct>(
          data['day1IntervalsCustom'],
          ParamType.DataStruct,
          true,
          structBuilder: MyShedullIntervalsStruct.fromSerializableMap,
        ),
        day1IntervalsStandart:
            deserializeStructParam<MyStandartIntervalsStruct>(
          data['day1IntervalsStandart'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStandartIntervalsStruct.fromSerializableMap,
        ),
        day2IntervalsCustom: deserializeStructParam<MyShedullIntervalsStruct>(
          data['day2IntervalsCustom'],
          ParamType.DataStruct,
          true,
          structBuilder: MyShedullIntervalsStruct.fromSerializableMap,
        ),
        day2IntervalsStandart:
            deserializeStructParam<MyStandartIntervalsStruct>(
          data['day2IntervalsStandart'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStandartIntervalsStruct.fromSerializableMap,
        ),
        day3IntervalsCustom: deserializeStructParam<MyShedullIntervalsStruct>(
          data['day3IntervalsCustom'],
          ParamType.DataStruct,
          true,
          structBuilder: MyShedullIntervalsStruct.fromSerializableMap,
        ),
        day3IntervalsStandart:
            deserializeStructParam<MyStandartIntervalsStruct>(
          data['day3IntervalsStandart'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStandartIntervalsStruct.fromSerializableMap,
        ),
        day4IntervalsCustom: deserializeStructParam<MyShedullIntervalsStruct>(
          data['day4IntervalsCustom'],
          ParamType.DataStruct,
          true,
          structBuilder: MyShedullIntervalsStruct.fromSerializableMap,
        ),
        day4IntervalsStandart:
            deserializeStructParam<MyStandartIntervalsStruct>(
          data['day4IntervalsStandart'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStandartIntervalsStruct.fromSerializableMap,
        ),
        day5IntervalsCustom: deserializeStructParam<MyShedullIntervalsStruct>(
          data['day5IntervalsCustom'],
          ParamType.DataStruct,
          true,
          structBuilder: MyShedullIntervalsStruct.fromSerializableMap,
        ),
        day5IntervalsStandart:
            deserializeStructParam<MyStandartIntervalsStruct>(
          data['day5IntervalsStandart'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStandartIntervalsStruct.fromSerializableMap,
        ),
        day6IntervalsCustom: deserializeStructParam<MyShedullIntervalsStruct>(
          data['day6IntervalsCustom'],
          ParamType.DataStruct,
          true,
          structBuilder: MyShedullIntervalsStruct.fromSerializableMap,
        ),
        day6IntervalsStandart:
            deserializeStructParam<MyStandartIntervalsStruct>(
          data['day6IntervalsStandart'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStandartIntervalsStruct.fromSerializableMap,
        ),
        day7IntervalsCustom: deserializeStructParam<MyShedullIntervalsStruct>(
          data['day7IntervalsCustom'],
          ParamType.DataStruct,
          true,
          structBuilder: MyShedullIntervalsStruct.fromSerializableMap,
        ),
        day7IntervalsStandart:
            deserializeStructParam<MyStandartIntervalsStruct>(
          data['day7IntervalsStandart'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStandartIntervalsStruct.fromSerializableMap,
        ),
        days: deserializeStructParam<OneDayStruct>(
          data['days'],
          ParamType.DataStruct,
          true,
          structBuilder: OneDayStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeviceShedulleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeviceShedulleStruct &&
        id == other.id &&
        listEquality.equals(day1IntervalsCustom, other.day1IntervalsCustom) &&
        listEquality.equals(
            day1IntervalsStandart, other.day1IntervalsStandart) &&
        listEquality.equals(day2IntervalsCustom, other.day2IntervalsCustom) &&
        listEquality.equals(
            day2IntervalsStandart, other.day2IntervalsStandart) &&
        listEquality.equals(day3IntervalsCustom, other.day3IntervalsCustom) &&
        listEquality.equals(
            day3IntervalsStandart, other.day3IntervalsStandart) &&
        listEquality.equals(day4IntervalsCustom, other.day4IntervalsCustom) &&
        listEquality.equals(
            day4IntervalsStandart, other.day4IntervalsStandart) &&
        listEquality.equals(day5IntervalsCustom, other.day5IntervalsCustom) &&
        listEquality.equals(
            day5IntervalsStandart, other.day5IntervalsStandart) &&
        listEquality.equals(day6IntervalsCustom, other.day6IntervalsCustom) &&
        listEquality.equals(
            day6IntervalsStandart, other.day6IntervalsStandart) &&
        listEquality.equals(day7IntervalsCustom, other.day7IntervalsCustom) &&
        listEquality.equals(
            day7IntervalsStandart, other.day7IntervalsStandart) &&
        listEquality.equals(days, other.days);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        day1IntervalsCustom,
        day1IntervalsStandart,
        day2IntervalsCustom,
        day2IntervalsStandart,
        day3IntervalsCustom,
        day3IntervalsStandart,
        day4IntervalsCustom,
        day4IntervalsStandart,
        day5IntervalsCustom,
        day5IntervalsStandart,
        day6IntervalsCustom,
        day6IntervalsStandart,
        day7IntervalsCustom,
        day7IntervalsStandart,
        days
      ]);
}

DeviceShedulleStruct createDeviceShedulleStruct({
  String? id,
}) =>
    DeviceShedulleStruct(
      id: id,
    );
