// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BleActionStructStruct extends BaseStruct {
  BleActionStructStruct({
    int? mode,
    String? id,
    String? face,
  })  : _mode = mode,
        _id = id,
        _face = face;

  // "mode" field.
  int? _mode;
  int get mode => _mode ?? 0;
  set mode(int? val) => _mode = val;

  void incrementMode(int amount) => mode = mode + amount;

  bool hasMode() => _mode != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "FACE" field.
  String? _face;
  String get face => _face ?? '';
  set face(String? val) => _face = val;

  bool hasFace() => _face != null;

  static BleActionStructStruct fromMap(Map<String, dynamic> data) =>
      BleActionStructStruct(
        mode: castToType<int>(data['mode']),
        id: data['ID'] as String?,
        face: data['FACE'] as String?,
      );

  static BleActionStructStruct? maybeFromMap(dynamic data) => data is Map
      ? BleActionStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mode': _mode,
        'ID': _id,
        'FACE': _face,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mode': serializeParam(
          _mode,
          ParamType.int,
        ),
        'ID': serializeParam(
          _id,
          ParamType.String,
        ),
        'FACE': serializeParam(
          _face,
          ParamType.String,
        ),
      }.withoutNulls;

  static BleActionStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      BleActionStructStruct(
        mode: deserializeParam(
          data['mode'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['ID'],
          ParamType.String,
          false,
        ),
        face: deserializeParam(
          data['FACE'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BleActionStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BleActionStructStruct &&
        mode == other.mode &&
        id == other.id &&
        face == other.face;
  }

  @override
  int get hashCode => const ListEquality().hash([mode, id, face]);
}

BleActionStructStruct createBleActionStructStruct({
  int? mode,
  String? id,
  String? face,
}) =>
    BleActionStructStruct(
      mode: mode,
      id: id,
      face: face,
    );
