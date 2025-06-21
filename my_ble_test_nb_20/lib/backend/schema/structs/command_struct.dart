// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommandStruct extends BaseStruct {
  CommandStruct({
    int? writeState,
    int? readState,
    int? writeTemper,
    int? readTemper,
  })  : _writeState = writeState,
        _readState = readState,
        _writeTemper = writeTemper,
        _readTemper = readTemper;

  // "writeState" field.
  int? _writeState;
  int get writeState => _writeState ?? 1;
  set writeState(int? val) => _writeState = val;

  void incrementWriteState(int amount) => writeState = writeState + amount;

  bool hasWriteState() => _writeState != null;

  // "readState" field.
  int? _readState;
  int get readState => _readState ?? 2;
  set readState(int? val) => _readState = val;

  void incrementReadState(int amount) => readState = readState + amount;

  bool hasReadState() => _readState != null;

  // "writeTemper" field.
  int? _writeTemper;
  int get writeTemper => _writeTemper ?? 3;
  set writeTemper(int? val) => _writeTemper = val;

  void incrementWriteTemper(int amount) => writeTemper = writeTemper + amount;

  bool hasWriteTemper() => _writeTemper != null;

  // "readTemper" field.
  int? _readTemper;
  int get readTemper => _readTemper ?? 4;
  set readTemper(int? val) => _readTemper = val;

  void incrementReadTemper(int amount) => readTemper = readTemper + amount;

  bool hasReadTemper() => _readTemper != null;

  static CommandStruct fromMap(Map<String, dynamic> data) => CommandStruct(
        writeState: castToType<int>(data['writeState']),
        readState: castToType<int>(data['readState']),
        writeTemper: castToType<int>(data['writeTemper']),
        readTemper: castToType<int>(data['readTemper']),
      );

  static CommandStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommandStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'writeState': _writeState,
        'readState': _readState,
        'writeTemper': _writeTemper,
        'readTemper': _readTemper,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'writeState': serializeParam(
          _writeState,
          ParamType.int,
        ),
        'readState': serializeParam(
          _readState,
          ParamType.int,
        ),
        'writeTemper': serializeParam(
          _writeTemper,
          ParamType.int,
        ),
        'readTemper': serializeParam(
          _readTemper,
          ParamType.int,
        ),
      }.withoutNulls;

  static CommandStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommandStruct(
        writeState: deserializeParam(
          data['writeState'],
          ParamType.int,
          false,
        ),
        readState: deserializeParam(
          data['readState'],
          ParamType.int,
          false,
        ),
        writeTemper: deserializeParam(
          data['writeTemper'],
          ParamType.int,
          false,
        ),
        readTemper: deserializeParam(
          data['readTemper'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CommandStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommandStruct &&
        writeState == other.writeState &&
        readState == other.readState &&
        writeTemper == other.writeTemper &&
        readTemper == other.readTemper;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([writeState, readState, writeTemper, readTemper]);
}

CommandStruct createCommandStruct({
  int? writeState,
  int? readState,
  int? writeTemper,
  int? readTemper,
}) =>
    CommandStruct(
      writeState: writeState,
      readState: readState,
      writeTemper: writeTemper,
      readTemper: readTemper,
    );
