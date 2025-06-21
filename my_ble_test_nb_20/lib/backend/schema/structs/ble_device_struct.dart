// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BleDeviceStruct extends BaseStruct {
  BleDeviceStruct({
    String? name,
    String? id,
    int? rssi,
    int? onOff,
  })  : _name = name,
        _id = id,
        _rssi = rssi,
        _onOff = onOff;

  // "name" field.
  String? _name;
  String get name => _name ?? '0';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '0';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "rssi" field.
  int? _rssi;
  int get rssi => _rssi ?? 0;
  set rssi(int? val) => _rssi = val;

  void incrementRssi(int amount) => rssi = rssi + amount;

  bool hasRssi() => _rssi != null;

  // "on_off" field.
  int? _onOff;
  int get onOff => _onOff ?? 0;
  set onOff(int? val) => _onOff = val;

  void incrementOnOff(int amount) => onOff = onOff + amount;

  bool hasOnOff() => _onOff != null;

  static BleDeviceStruct fromMap(Map<String, dynamic> data) => BleDeviceStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        rssi: castToType<int>(data['rssi']),
        onOff: castToType<int>(data['on_off']),
      );

  static BleDeviceStruct? maybeFromMap(dynamic data) => data is Map
      ? BleDeviceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'rssi': _rssi,
        'on_off': _onOff,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'rssi': serializeParam(
          _rssi,
          ParamType.int,
        ),
        'on_off': serializeParam(
          _onOff,
          ParamType.int,
        ),
      }.withoutNulls;

  static BleDeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      BleDeviceStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        rssi: deserializeParam(
          data['rssi'],
          ParamType.int,
          false,
        ),
        onOff: deserializeParam(
          data['on_off'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BleDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BleDeviceStruct &&
        name == other.name &&
        id == other.id &&
        rssi == other.rssi &&
        onOff == other.onOff;
  }

  @override
  int get hashCode => const ListEquality().hash([name, id, rssi, onOff]);
}

BleDeviceStruct createBleDeviceStruct({
  String? name,
  String? id,
  int? rssi,
  int? onOff,
}) =>
    BleDeviceStruct(
      name: name,
      id: id,
      rssi: rssi,
      onOff: onOff,
    );
