import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectedDeviceId =
          prefs.getString('ff_selectedDeviceId') ?? _selectedDeviceId;
    });
    _safeInit(() {
      _ListOfMyDevice1 = prefs
              .getStringList('ff_ListOfMyDevice1')
              ?.map((x) {
                try {
                  return MyDeviceStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ListOfMyDevice1;
    });
    _safeInit(() {
      _TempereSetLowByte =
          prefs.getInt('ff_TempereSetLowByte') ?? _TempereSetLowByte;
    });
    _safeInit(() {
      _TempereSetHigthByte =
          prefs.getInt('ff_TempereSetHigthByte') ?? _TempereSetHigthByte;
    });
    _safeInit(() {
      _FaceBufer = prefs.getString('ff_FaceBufer') ?? _FaceBufer;
    });
    _safeInit(() {
      _deviseDiscript = prefs.getString('ff_deviseDiscript') ?? _deviseDiscript;
    });
    _safeInit(() {
      _tempereReadHighByteString =
          prefs.getString('ff_tempereReadHighByteString') ??
              _tempereReadHighByteString;
    });
    _safeInit(() {
      _tempereReadLowByteString =
          prefs.getString('ff_tempereReadLowByteString') ??
              _tempereReadLowByteString;
    });
    _safeInit(() {
      _sensorDiscript = prefs.getString('ff_sensorDiscript') ?? _sensorDiscript;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_command')) {
        try {
          final serializedData = prefs.getString('ff_command') ?? '{}';
          _command =
              CommandStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _sliderOffset = prefs.getDouble('ff_sliderOffset') ?? _sliderOffset;
    });
    _safeInit(() {
      _customColor =
          _colorFromIntValue(prefs.getInt('ff_customColor')) ?? _customColor;
    });
    _safeInit(() {
      _cololorPicker = prefs.getBool('ff_cololorPicker') ?? _cololorPicker;
    });
    _safeInit(() {
      _colorHistory = prefs
              .getStringList('ff_colorHistory')
              ?.map((x) => Color(int.tryParse(x) ?? 0))
              .toList() ??
          _colorHistory;
    });
    _safeInit(() {
      _DemoMode = prefs.getBool('ff_DemoMode') ?? _DemoMode;
    });
    _safeInit(() {
      _myDeviceShedulle = prefs
              .getStringList('ff_myDeviceShedulle')
              ?.map((x) {
                try {
                  return DeviceShedulleStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _myDeviceShedulle;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _bleActionType = 0;
  int get bleActionType => _bleActionType;
  set bleActionType(int value) {
    _bleActionType = value;
  }

  List<BleDeviceStruct> _ListBleDevice = [];
  List<BleDeviceStruct> get ListBleDevice => _ListBleDevice;
  set ListBleDevice(List<BleDeviceStruct> value) {
    _ListBleDevice = value;
  }

  void addToListBleDevice(BleDeviceStruct value) {
    ListBleDevice.add(value);
  }

  void removeFromListBleDevice(BleDeviceStruct value) {
    ListBleDevice.remove(value);
  }

  void removeAtIndexFromListBleDevice(int index) {
    ListBleDevice.removeAt(index);
  }

  void updateListBleDeviceAtIndex(
    int index,
    BleDeviceStruct Function(BleDeviceStruct) updateFn,
  ) {
    ListBleDevice[index] = updateFn(_ListBleDevice[index]);
  }

  void insertAtIndexInListBleDevice(int index, BleDeviceStruct value) {
    ListBleDevice.insert(index, value);
  }

  String _bleDeviceText = '';
  String get bleDeviceText => _bleDeviceText;
  set bleDeviceText(String value) {
    _bleDeviceText = value;
  }

  int _bleScanReady = 0;
  int get bleScanReady => _bleScanReady;
  set bleScanReady(int value) {
    _bleScanReady = value;
  }

  bool _visibleON = true;
  bool get visibleON => _visibleON;
  set visibleON(bool value) {
    _visibleON = value;
  }

  int _Scaner = 0;
  int get Scaner => _Scaner;
  set Scaner(int value) {
    _Scaner = value;
  }

  List<String> _MyList = [];
  List<String> get MyList => _MyList;
  set MyList(List<String> value) {
    _MyList = value;
  }

  void addToMyList(String value) {
    MyList.add(value);
  }

  void removeFromMyList(String value) {
    MyList.remove(value);
  }

  void removeAtIndexFromMyList(int index) {
    MyList.removeAt(index);
  }

  void updateMyListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MyList[index] = updateFn(_MyList[index]);
  }

  void insertAtIndexInMyList(int index, String value) {
    MyList.insert(index, value);
  }

  bool _isUpdate = false;
  bool get isUpdate => _isUpdate;
  set isUpdate(bool value) {
    _isUpdate = value;
  }

  int _TimerDevider = 0;
  int get TimerDevider => _TimerDevider;
  set TimerDevider(int value) {
    _TimerDevider = value;
  }

  String _selectedDeviceId = '';
  String get selectedDeviceId => _selectedDeviceId;
  set selectedDeviceId(String value) {
    _selectedDeviceId = value;
    prefs.setString('ff_selectedDeviceId', value);
  }

  int _readPlatform = 0;
  int get readPlatform => _readPlatform;
  set readPlatform(int value) {
    _readPlatform = value;
  }

  List<MyDeviceStruct> _ListOfMyDevice1 = [];
  List<MyDeviceStruct> get ListOfMyDevice1 => _ListOfMyDevice1;
  set ListOfMyDevice1(List<MyDeviceStruct> value) {
    _ListOfMyDevice1 = value;
    prefs.setStringList(
        'ff_ListOfMyDevice1', value.map((x) => x.serialize()).toList());
  }

  void addToListOfMyDevice1(MyDeviceStruct value) {
    ListOfMyDevice1.add(value);
    prefs.setStringList('ff_ListOfMyDevice1',
        _ListOfMyDevice1.map((x) => x.serialize()).toList());
  }

  void removeFromListOfMyDevice1(MyDeviceStruct value) {
    ListOfMyDevice1.remove(value);
    prefs.setStringList('ff_ListOfMyDevice1',
        _ListOfMyDevice1.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListOfMyDevice1(int index) {
    ListOfMyDevice1.removeAt(index);
    prefs.setStringList('ff_ListOfMyDevice1',
        _ListOfMyDevice1.map((x) => x.serialize()).toList());
  }

  void updateListOfMyDevice1AtIndex(
    int index,
    MyDeviceStruct Function(MyDeviceStruct) updateFn,
  ) {
    ListOfMyDevice1[index] = updateFn(_ListOfMyDevice1[index]);
    prefs.setStringList('ff_ListOfMyDevice1',
        _ListOfMyDevice1.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListOfMyDevice1(int index, MyDeviceStruct value) {
    ListOfMyDevice1.insert(index, value);
    prefs.setStringList('ff_ListOfMyDevice1',
        _ListOfMyDevice1.map((x) => x.serialize()).toList());
  }

  int _BLEspeedStop = 0;
  int get BLEspeedStop => _BLEspeedStop;
  set BLEspeedStop(int value) {
    _BLEspeedStop = value;
  }

  int _ScanSinglMode = 0;
  int get ScanSinglMode => _ScanSinglMode;
  set ScanSinglMode(int value) {
    _ScanSinglMode = value;
  }

  BleActionStructStruct _myBleActionStruct =
      BleActionStructStruct.fromSerializableMap(jsonDecode('{\"mode\":\"0\"}'));
  BleActionStructStruct get myBleActionStruct => _myBleActionStruct;
  set myBleActionStruct(BleActionStructStruct value) {
    _myBleActionStruct = value;
  }

  void updateMyBleActionStructStruct(Function(BleActionStructStruct) updateFn) {
    updateFn(_myBleActionStruct);
  }

  int _LinkState = 0;
  int get LinkState => _LinkState;
  set LinkState(int value) {
    _LinkState = value;
  }

  int _ReadTimer = 0;
  int get ReadTimer => _ReadTimer;
  set ReadTimer(int value) {
    _ReadTimer = value;
  }

  int _readmode = 0;
  int get readmode => _readmode;
  set readmode(int value) {
    _readmode = value;
  }

  int _ValiuePlusMinus = 0;
  int get ValiuePlusMinus => _ValiuePlusMinus;
  set ValiuePlusMinus(int value) {
    _ValiuePlusMinus = value;
  }

  bool _loadConnect = true;
  bool get loadConnect => _loadConnect;
  set loadConnect(bool value) {
    _loadConnect = value;
  }

  int _ScanReady = 0;
  int get ScanReady => _ScanReady;
  set ScanReady(int value) {
    _ScanReady = value;
  }

  int _tempereLowByte = 0;
  int get tempereLowByte => _tempereLowByte;
  set tempereLowByte(int value) {
    _tempereLowByte = value;
  }

  int _tempereHigthByte = 0;
  int get tempereHigthByte => _tempereHigthByte;
  set tempereHigthByte(int value) {
    _tempereHigthByte = value;
  }

  int _DevicelistDataUpdate = 0;
  int get DevicelistDataUpdate => _DevicelistDataUpdate;
  set DevicelistDataUpdate(int value) {
    _DevicelistDataUpdate = value;
  }

  int _NewDataToWrite = 0;
  int get NewDataToWrite => _NewDataToWrite;
  set NewDataToWrite(int value) {
    _NewDataToWrite = value;
  }

  int _TempereSetLowByte = 0;
  int get TempereSetLowByte => _TempereSetLowByte;
  set TempereSetLowByte(int value) {
    _TempereSetLowByte = value;
    prefs.setInt('ff_TempereSetLowByte', value);
  }

  int _TempereSetHigthByte = 25;
  int get TempereSetHigthByte => _TempereSetHigthByte;
  set TempereSetHigthByte(int value) {
    _TempereSetHigthByte = value;
    prefs.setInt('ff_TempereSetHigthByte', value);
  }

  Color _StatusConnectColor = Color(4292992477);
  Color get StatusConnectColor => _StatusConnectColor;
  set StatusConnectColor(Color value) {
    _StatusConnectColor = value;
  }

  int _StatusConnectState = 0;
  int get StatusConnectState => _StatusConnectState;
  set StatusConnectState(int value) {
    _StatusConnectState = value;
  }

  int _resetStatusFields = 0;
  int get resetStatusFields => _resetStatusFields;
  set resetStatusFields(int value) {
    _resetStatusFields = value;
  }

  double _TempereSetFloat = 25.0;
  double get TempereSetFloat => _TempereSetFloat;
  set TempereSetFloat(double value) {
    _TempereSetFloat = value;
  }

  int _TempereReadLowByte = 2;
  int get TempereReadLowByte => _TempereReadLowByte;
  set TempereReadLowByte(int value) {
    _TempereReadLowByte = value;
  }

  int _TempereReadHigthByte = 0;
  int get TempereReadHigthByte => _TempereReadHigthByte;
  set TempereReadHigthByte(int value) {
    _TempereReadHigthByte = value;
  }

  String _FaceBufer = '';
  String get FaceBufer => _FaceBufer;
  set FaceBufer(String value) {
    _FaceBufer = value;
    prefs.setString('ff_FaceBufer', value);
  }

  Color _StatusConnectColorBufer = Colors.transparent;
  Color get StatusConnectColorBufer => _StatusConnectColorBufer;
  set StatusConnectColorBufer(Color value) {
    _StatusConnectColorBufer = value;
  }

  String _OnOffKnobValueBufer = '';
  String get OnOffKnobValueBufer => _OnOffKnobValueBufer;
  set OnOffKnobValueBufer(String value) {
    _OnOffKnobValueBufer = value;
  }

  Color _HandModeColor = Colors.transparent;
  Color get HandModeColor => _HandModeColor;
  set HandModeColor(Color value) {
    _HandModeColor = value;
  }

  Color _ProgModeColor = Colors.transparent;
  Color get ProgModeColor => _ProgModeColor;
  set ProgModeColor(Color value) {
    _ProgModeColor = value;
  }

  Color _SfmModeColor = Colors.transparent;
  Color get SfmModeColor => _SfmModeColor;
  set SfmModeColor(Color value) {
    _SfmModeColor = value;
  }

  bool _HandModeVisible = false;
  bool get HandModeVisible => _HandModeVisible;
  set HandModeVisible(bool value) {
    _HandModeVisible = value;
  }

  bool _ProgModeVisible = false;
  bool get ProgModeVisible => _ProgModeVisible;
  set ProgModeVisible(bool value) {
    _ProgModeVisible = value;
  }

  bool _HandProgModeSwich = false;
  bool get HandProgModeSwich => _HandProgModeSwich;
  set HandProgModeSwich(bool value) {
    _HandProgModeSwich = value;
  }

  String _deviseDiscript = 'Термостат';
  String get deviseDiscript => _deviseDiscript;
  set deviseDiscript(String value) {
    _deviseDiscript = value;
    prefs.setString('ff_deviseDiscript', value);
  }

  String _tempereReadHighByteString = '25';
  String get tempereReadHighByteString => _tempereReadHighByteString;
  set tempereReadHighByteString(String value) {
    _tempereReadHighByteString = value;
    prefs.setString('ff_tempereReadHighByteString', value);
  }

  String _tempereReadLowByteString = '0';
  String get tempereReadLowByteString => _tempereReadLowByteString;
  set tempereReadLowByteString(String value) {
    _tempereReadLowByteString = value;
    prefs.setString('ff_tempereReadLowByteString', value);
  }

  String _test = '';
  String get test => _test;
  set test(String value) {
    _test = value;
  }

  String _sensorDiscript = 'Пол';
  String get sensorDiscript => _sensorDiscript;
  set sensorDiscript(String value) {
    _sensorDiscript = value;
    prefs.setString('ff_sensorDiscript', value);
  }

  CommandStruct _command = CommandStruct.fromSerializableMap(jsonDecode(
      '{\"writeState\":\"1\",\"readState\":\"2\",\"writeTemper\":\"3\",\"readTemper\":\"4\"}'));
  CommandStruct get command => _command;
  set command(CommandStruct value) {
    _command = value;
    prefs.setString('ff_command', value.serialize());
  }

  void updateCommandStruct(Function(CommandStruct) updateFn) {
    updateFn(_command);
    prefs.setString('ff_command', _command.serialize());
  }

  double _sliderOffset = 100.0;
  double get sliderOffset => _sliderOffset;
  set sliderOffset(double value) {
    _sliderOffset = value;
    prefs.setDouble('ff_sliderOffset', value);
  }

  bool _HeatIconVisible = false;
  bool get HeatIconVisible => _HeatIconVisible;
  set HeatIconVisible(bool value) {
    _HeatIconVisible = value;
  }

  double _deviceHysteresis = 1.0;
  double get deviceHysteresis => _deviceHysteresis;
  set deviceHysteresis(double value) {
    _deviceHysteresis = value;
  }

  String _settingsSensorName = 'Гистерезис, “Пол”, °С';
  String get settingsSensorName => _settingsSensorName;
  set settingsSensorName(String value) {
    _settingsSensorName = value;
  }

  String _GesterezisOUT = '0.5';
  String get GesterezisOUT => _GesterezisOUT;
  set GesterezisOUT(String value) {
    _GesterezisOUT = value;
  }

  List<String> _GesterezisValue = ['0.5', '1.0'];
  List<String> get GesterezisValue => _GesterezisValue;
  set GesterezisValue(List<String> value) {
    _GesterezisValue = value;
  }

  void addToGesterezisValue(String value) {
    GesterezisValue.add(value);
  }

  void removeFromGesterezisValue(String value) {
    GesterezisValue.remove(value);
  }

  void removeAtIndexFromGesterezisValue(int index) {
    GesterezisValue.removeAt(index);
  }

  void updateGesterezisValueAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    GesterezisValue[index] = updateFn(_GesterezisValue[index]);
  }

  void insertAtIndexInGesterezisValue(int index, String value) {
    GesterezisValue.insert(index, value);
  }

  String _deviceSensorName = '';
  String get deviceSensorName => _deviceSensorName;
  set deviceSensorName(String value) {
    _deviceSensorName = value;
  }

  bool _keyBlockOnOff = false;
  bool get keyBlockOnOff => _keyBlockOnOff;
  set keyBlockOnOff(bool value) {
    _keyBlockOnOff = value;
  }

  bool _sfmModeOnOff = false;
  bool get sfmModeOnOff => _sfmModeOnOff;
  set sfmModeOnOff(bool value) {
    _sfmModeOnOff = value;
  }

  bool _color1OnOff = false;
  bool get color1OnOff => _color1OnOff;
  set color1OnOff(bool value) {
    _color1OnOff = value;
  }

  bool _color2OnOff = true;
  bool get color2OnOff => _color2OnOff;
  set color2OnOff(bool value) {
    _color2OnOff = value;
  }

  bool _color3OnOff = false;
  bool get color3OnOff => _color3OnOff;
  set color3OnOff(bool value) {
    _color3OnOff = value;
  }

  bool _color4OnOff = false;
  bool get color4OnOff => _color4OnOff;
  set color4OnOff(bool value) {
    _color4OnOff = value;
  }

  bool _color5OnOff = false;
  bool get color5OnOff => _color5OnOff;
  set color5OnOff(bool value) {
    _color5OnOff = value;
  }

  bool _color6OnOff = false;
  bool get color6OnOff => _color6OnOff;
  set color6OnOff(bool value) {
    _color6OnOff = value;
  }

  bool _color7OnOff = false;
  bool get color7OnOff => _color7OnOff;
  set color7OnOff(bool value) {
    _color7OnOff = value;
  }

  bool _color8OnOff = false;
  bool get color8OnOff => _color8OnOff;
  set color8OnOff(bool value) {
    _color8OnOff = value;
  }

  Color _deviceColor = Color(4292480526);
  Color get deviceColor => _deviceColor;
  set deviceColor(Color value) {
    _deviceColor = value;
  }

  bool _standartShedullMode = false;
  bool get standartShedullMode => _standartShedullMode;
  set standartShedullMode(bool value) {
    _standartShedullMode = value;
  }

  bool _customShedullMode = false;
  bool get customShedullMode => _customShedullMode;
  set customShedullMode(bool value) {
    _customShedullMode = value;
  }

  Color _customColor = Colors.transparent;
  Color get customColor => _customColor;
  set customColor(Color value) {
    _customColor = value;
    prefs.setInt('ff_customColor', value.value);
  }

  bool _cololorPicker = false;
  bool get cololorPicker => _cololorPicker;
  set cololorPicker(bool value) {
    _cololorPicker = value;
    prefs.setBool('ff_cololorPicker', value);
  }

  List<Color> _colorPalet = [Color(4284814099), Color(4284408185)];
  List<Color> get colorPalet => _colorPalet;
  set colorPalet(List<Color> value) {
    _colorPalet = value;
  }

  void addToColorPalet(Color value) {
    colorPalet.add(value);
  }

  void removeFromColorPalet(Color value) {
    colorPalet.remove(value);
  }

  void removeAtIndexFromColorPalet(int index) {
    colorPalet.removeAt(index);
  }

  void updateColorPaletAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    colorPalet[index] = updateFn(_colorPalet[index]);
  }

  void insertAtIndexInColorPalet(int index, Color value) {
    colorPalet.insert(index, value);
  }

  Color _bufercolor = Color(4284482821);
  Color get bufercolor => _bufercolor;
  set bufercolor(Color value) {
    _bufercolor = value;
  }

  List<Color> _colorHistory = [Color(4281979584)];
  List<Color> get colorHistory => _colorHistory;
  set colorHistory(List<Color> value) {
    _colorHistory = value;
    prefs.setStringList(
        'ff_colorHistory', value.map((x) => x.value.toString()).toList());
  }

  void addToColorHistory(Color value) {
    colorHistory.add(value);
    prefs.setStringList('ff_colorHistory',
        _colorHistory.map((x) => x.value.toString()).toList());
  }

  void removeFromColorHistory(Color value) {
    colorHistory.remove(value);
    prefs.setStringList('ff_colorHistory',
        _colorHistory.map((x) => x.value.toString()).toList());
  }

  void removeAtIndexFromColorHistory(int index) {
    colorHistory.removeAt(index);
    prefs.setStringList('ff_colorHistory',
        _colorHistory.map((x) => x.value.toString()).toList());
  }

  void updateColorHistoryAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    colorHistory[index] = updateFn(_colorHistory[index]);
    prefs.setStringList('ff_colorHistory',
        _colorHistory.map((x) => x.value.toString()).toList());
  }

  void insertAtIndexInColorHistory(int index, Color value) {
    colorHistory.insert(index, value);
    prefs.setStringList('ff_colorHistory',
        _colorHistory.map((x) => x.value.toString()).toList());
  }

  Color _colorFromPicker = Colors.transparent;
  Color get colorFromPicker => _colorFromPicker;
  set colorFromPicker(Color value) {
    _colorFromPicker = value;
  }

  bool _isColorHistoryFull = false;
  bool get isColorHistoryFull => _isColorHistoryFull;
  set isColorHistoryFull(bool value) {
    _isColorHistoryFull = value;
  }

  String _debugString = '';
  String get debugString => _debugString;
  set debugString(String value) {
    _debugString = value;
  }

  double _debugDouble = 0.0;
  double get debugDouble => _debugDouble;
  set debugDouble(double value) {
    _debugDouble = value;
  }

  int _debugInteger = 0;
  int get debugInteger => _debugInteger;
  set debugInteger(int value) {
    _debugInteger = value;
  }

  int _DayIntervalIndex = 0;
  int get DayIntervalIndex => _DayIntervalIndex;
  set DayIntervalIndex(int value) {
    _DayIntervalIndex = value;
  }

  bool _DemoMode = false;
  bool get DemoMode => _DemoMode;
  set DemoMode(bool value) {
    _DemoMode = value;
    prefs.setBool('ff_DemoMode', value);
  }

  bool _DeviceListState = false;
  bool get DeviceListState => _DeviceListState;
  set DeviceListState(bool value) {
    _DeviceListState = value;
  }

  List<SinglIntervalStruct> _deviceShedulleList = [];
  List<SinglIntervalStruct> get deviceShedulleList => _deviceShedulleList;
  set deviceShedulleList(List<SinglIntervalStruct> value) {
    _deviceShedulleList = value;
  }

  void addToDeviceShedulleList(SinglIntervalStruct value) {
    deviceShedulleList.add(value);
  }

  void removeFromDeviceShedulleList(SinglIntervalStruct value) {
    deviceShedulleList.remove(value);
  }

  void removeAtIndexFromDeviceShedulleList(int index) {
    deviceShedulleList.removeAt(index);
  }

  void updateDeviceShedulleListAtIndex(
    int index,
    SinglIntervalStruct Function(SinglIntervalStruct) updateFn,
  ) {
    deviceShedulleList[index] = updateFn(_deviceShedulleList[index]);
  }

  void insertAtIndexInDeviceShedulleList(int index, SinglIntervalStruct value) {
    deviceShedulleList.insert(index, value);
  }

  List<DeviceShedulleStruct> _myDeviceShedulle = [
    DeviceShedulleStruct.fromSerializableMap(jsonDecode(
        '{\"ID\":\"Hello World\",\"day1IntervalsCustom\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day1IntervalsStandart\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day2IntervalsCustom\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day2IntervalsStandart\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day3IntervalsCustom\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day3IntervalsStandart\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day4IntervalsCustom\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day4IntervalsStandart\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day5IntervalsCustom\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day5IntervalsStandart\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day6IntervalsCustom\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day6IntervalsStandart\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day7IntervalsCustom\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"day7IntervalsStandart\":\"[\\\"{\\\\\\\"icon\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureHigtByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"temperatureLowByte\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeHour\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"timeMinut\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\",\"days\":\"[\\\"{\\\\\\\"dayIntervalsCustom\\\\\\\":\\\\\\\"[\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"temperatureHigtByte\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"26\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"temperatureLowByte\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"5\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"timeHour\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"07\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"timeMinut\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"00\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\"]\\\\\\\",\\\\\\\"dayIntervalsStandart\\\\\\\":\\\\\\\"[\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"icon\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"temperatureHigtByte\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"26\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"temperatureLowByte\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"5\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"timeHour\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"07\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"timeMinut\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"00\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\"]\\\\\\\"}\\\"]\"}'))
  ];
  List<DeviceShedulleStruct> get myDeviceShedulle => _myDeviceShedulle;
  set myDeviceShedulle(List<DeviceShedulleStruct> value) {
    _myDeviceShedulle = value;
    prefs.setStringList(
        'ff_myDeviceShedulle', value.map((x) => x.serialize()).toList());
  }

  void addToMyDeviceShedulle(DeviceShedulleStruct value) {
    myDeviceShedulle.add(value);
    prefs.setStringList('ff_myDeviceShedulle',
        _myDeviceShedulle.map((x) => x.serialize()).toList());
  }

  void removeFromMyDeviceShedulle(DeviceShedulleStruct value) {
    myDeviceShedulle.remove(value);
    prefs.setStringList('ff_myDeviceShedulle',
        _myDeviceShedulle.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMyDeviceShedulle(int index) {
    myDeviceShedulle.removeAt(index);
    prefs.setStringList('ff_myDeviceShedulle',
        _myDeviceShedulle.map((x) => x.serialize()).toList());
  }

  void updateMyDeviceShedulleAtIndex(
    int index,
    DeviceShedulleStruct Function(DeviceShedulleStruct) updateFn,
  ) {
    myDeviceShedulle[index] = updateFn(_myDeviceShedulle[index]);
    prefs.setStringList('ff_myDeviceShedulle',
        _myDeviceShedulle.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMyDeviceShedulle(int index, DeviceShedulleStruct value) {
    myDeviceShedulle.insert(index, value);
    prefs.setStringList('ff_myDeviceShedulle',
        _myDeviceShedulle.map((x) => x.serialize()).toList());
  }

  List<Color> _day1Select = [Color(4286810781), Color(4294967295)];
  List<Color> get day1Select => _day1Select;
  set day1Select(List<Color> value) {
    _day1Select = value;
  }

  void addToDay1Select(Color value) {
    day1Select.add(value);
  }

  void removeFromDay1Select(Color value) {
    day1Select.remove(value);
  }

  void removeAtIndexFromDay1Select(int index) {
    day1Select.removeAt(index);
  }

  void updateDay1SelectAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    day1Select[index] = updateFn(_day1Select[index]);
  }

  void insertAtIndexInDay1Select(int index, Color value) {
    day1Select.insert(index, value);
  }

  List<Color> _day2Select = [Color(4294967295), Color(4294967295)];
  List<Color> get day2Select => _day2Select;
  set day2Select(List<Color> value) {
    _day2Select = value;
  }

  void addToDay2Select(Color value) {
    day2Select.add(value);
  }

  void removeFromDay2Select(Color value) {
    day2Select.remove(value);
  }

  void removeAtIndexFromDay2Select(int index) {
    day2Select.removeAt(index);
  }

  void updateDay2SelectAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    day2Select[index] = updateFn(_day2Select[index]);
  }

  void insertAtIndexInDay2Select(int index, Color value) {
    day2Select.insert(index, value);
  }

  List<Color> _day3Select = [Color(4294967295), Color(4294967295)];
  List<Color> get day3Select => _day3Select;
  set day3Select(List<Color> value) {
    _day3Select = value;
  }

  void addToDay3Select(Color value) {
    day3Select.add(value);
  }

  void removeFromDay3Select(Color value) {
    day3Select.remove(value);
  }

  void removeAtIndexFromDay3Select(int index) {
    day3Select.removeAt(index);
  }

  void updateDay3SelectAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    day3Select[index] = updateFn(_day3Select[index]);
  }

  void insertAtIndexInDay3Select(int index, Color value) {
    day3Select.insert(index, value);
  }

  List<Color> _day4Select = [Color(4294967295), Color(4294967295)];
  List<Color> get day4Select => _day4Select;
  set day4Select(List<Color> value) {
    _day4Select = value;
  }

  void addToDay4Select(Color value) {
    day4Select.add(value);
  }

  void removeFromDay4Select(Color value) {
    day4Select.remove(value);
  }

  void removeAtIndexFromDay4Select(int index) {
    day4Select.removeAt(index);
  }

  void updateDay4SelectAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    day4Select[index] = updateFn(_day4Select[index]);
  }

  void insertAtIndexInDay4Select(int index, Color value) {
    day4Select.insert(index, value);
  }

  List<Color> _day5Select = [Color(4294967295), Color(4294967295)];
  List<Color> get day5Select => _day5Select;
  set day5Select(List<Color> value) {
    _day5Select = value;
  }

  void addToDay5Select(Color value) {
    day5Select.add(value);
  }

  void removeFromDay5Select(Color value) {
    day5Select.remove(value);
  }

  void removeAtIndexFromDay5Select(int index) {
    day5Select.removeAt(index);
  }

  void updateDay5SelectAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    day5Select[index] = updateFn(_day5Select[index]);
  }

  void insertAtIndexInDay5Select(int index, Color value) {
    day5Select.insert(index, value);
  }

  List<Color> _day6Select = [Color(4294967295), Color(4294967295)];
  List<Color> get day6Select => _day6Select;
  set day6Select(List<Color> value) {
    _day6Select = value;
  }

  void addToDay6Select(Color value) {
    day6Select.add(value);
  }

  void removeFromDay6Select(Color value) {
    day6Select.remove(value);
  }

  void removeAtIndexFromDay6Select(int index) {
    day6Select.removeAt(index);
  }

  void updateDay6SelectAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    day6Select[index] = updateFn(_day6Select[index]);
  }

  void insertAtIndexInDay6Select(int index, Color value) {
    day6Select.insert(index, value);
  }

  List<Color> _day7Select = [Color(4294967295), Color(4294967295)];
  List<Color> get day7Select => _day7Select;
  set day7Select(List<Color> value) {
    _day7Select = value;
  }

  void addToDay7Select(Color value) {
    day7Select.add(value);
  }

  void removeFromDay7Select(Color value) {
    day7Select.remove(value);
  }

  void removeAtIndexFromDay7Select(int index) {
    day7Select.removeAt(index);
  }

  void updateDay7SelectAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    day7Select[index] = updateFn(_day7Select[index]);
  }

  void insertAtIndexInDay7Select(int index, Color value) {
    day7Select.insert(index, value);
  }

  List<String> _copyDayList = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четвер',
    'Пятница',
    'Суббота',
    'Воскресение'
  ];
  List<String> get copyDayList => _copyDayList;
  set copyDayList(List<String> value) {
    _copyDayList = value;
  }

  void addToCopyDayList(String value) {
    copyDayList.add(value);
  }

  void removeFromCopyDayList(String value) {
    copyDayList.remove(value);
  }

  void removeAtIndexFromCopyDayList(int index) {
    copyDayList.removeAt(index);
  }

  void updateCopyDayListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    copyDayList[index] = updateFn(_copyDayList[index]);
  }

  void insertAtIndexInCopyDayList(int index, String value) {
    copyDayList.insert(index, value);
  }

  bool _copyDayOK = false;
  bool get copyDayOK => _copyDayOK;
  set copyDayOK(bool value) {
    _copyDayOK = value;
  }

  String _copyDayValue = '';
  String get copyDayValue => _copyDayValue;
  set copyDayValue(String value) {
    _copyDayValue = value;
  }

  int _curentDay = 0;
  int get curentDay => _curentDay;
  set curentDay(int value) {
    _curentDay = value;
  }

  int _curentInterval = 0;
  int get curentInterval => _curentInterval;
  set curentInterval(int value) {
    _curentInterval = value;
  }

  String _selectedDayName = '';
  String get selectedDayName => _selectedDayName;
  set selectedDayName(String value) {
    _selectedDayName = value;
  }

  bool _copyDayListMode = false;
  bool get copyDayListMode => _copyDayListMode;
  set copyDayListMode(bool value) {
    _copyDayListMode = value;
  }

  bool _intervalIconOnOff = false;
  bool get intervalIconOnOff => _intervalIconOnOff;
  set intervalIconOnOff(bool value) {
    _intervalIconOnOff = value;
  }

  String _intervalIcon = '';
  String get intervalIcon => _intervalIcon;
  set intervalIcon(String value) {
    _intervalIcon = value;
  }

  String _TempereSheduleHigthByte = '';
  String get TempereSheduleHigthByte => _TempereSheduleHigthByte;
  set TempereSheduleHigthByte(String value) {
    _TempereSheduleHigthByte = value;
  }

  String _TempereSheduleLowByte = '';
  String get TempereSheduleLowByte => _TempereSheduleLowByte;
  set TempereSheduleLowByte(String value) {
    _TempereSheduleLowByte = value;
  }

  String _HourShedule = '';
  String get HourShedule => _HourShedule;
  set HourShedule(String value) {
    _HourShedule = value;
  }

  String _MinutShedule = '';
  String get MinutShedule => _MinutShedule;
  set MinutShedule(String value) {
    _MinutShedule = value;
  }

  bool _HourMinutMode = false;
  bool get HourMinutMode => _HourMinutMode;
  set HourMinutMode(bool value) {
    _HourMinutMode = value;
  }

  Color _HourBorder = Color(16777215);
  Color get HourBorder => _HourBorder;
  set HourBorder(Color value) {
    _HourBorder = value;
  }

  Color _MinutBorder = Color(16777215);
  Color get MinutBorder => _MinutBorder;
  set MinutBorder(Color value) {
    _MinutBorder = value;
  }

  bool _dialogActivity = false;
  bool get dialogActivity => _dialogActivity;
  set dialogActivity(bool value) {
    _dialogActivity = value;
  }

  double _SliderPageHigth = 0.0;
  double get SliderPageHigth => _SliderPageHigth;
  set SliderPageHigth(double value) {
    _SliderPageHigth = value;
  }

  int _APPcurrentRightMinute = 0;
  int get APPcurrentRightMinute => _APPcurrentRightMinute;
  set APPcurrentRightMinute(int value) {
    _APPcurrentRightMinute = value;
  }

  List<int> _APPmeasuredData1 = [];
  List<int> get APPmeasuredData1 => _APPmeasuredData1;
  set APPmeasuredData1(List<int> value) {
    _APPmeasuredData1 = value;
  }

  void addToAPPmeasuredData1(int value) {
    APPmeasuredData1.add(value);
  }

  void removeFromAPPmeasuredData1(int value) {
    APPmeasuredData1.remove(value);
  }

  void removeAtIndexFromAPPmeasuredData1(int index) {
    APPmeasuredData1.removeAt(index);
  }

  void updateAPPmeasuredData1AtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    APPmeasuredData1[index] = updateFn(_APPmeasuredData1[index]);
  }

  void insertAtIndexInAPPmeasuredData1(int index, int value) {
    APPmeasuredData1.insert(index, value);
  }

  List<int> _APPmeasuredData2 = [];
  List<int> get APPmeasuredData2 => _APPmeasuredData2;
  set APPmeasuredData2(List<int> value) {
    _APPmeasuredData2 = value;
  }

  void addToAPPmeasuredData2(int value) {
    APPmeasuredData2.add(value);
  }

  void removeFromAPPmeasuredData2(int value) {
    APPmeasuredData2.remove(value);
  }

  void removeAtIndexFromAPPmeasuredData2(int index) {
    APPmeasuredData2.removeAt(index);
  }

  void updateAPPmeasuredData2AtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    APPmeasuredData2[index] = updateFn(_APPmeasuredData2[index]);
  }

  void insertAtIndexInAPPmeasuredData2(int index, int value) {
    APPmeasuredData2.insert(index, value);
  }

  int _scrollleft = 0;
  int get scrollleft => _scrollleft;
  set scrollleft(int value) {
    _scrollleft = value;
  }

  int _scrollrigth = 0;
  int get scrollrigth => _scrollrigth;
  set scrollrigth(int value) {
    _scrollrigth = value;
  }

  List<LineChartStruct> _LineCharData1 = [];
  List<LineChartStruct> get LineCharData1 => _LineCharData1;
  set LineCharData1(List<LineChartStruct> value) {
    _LineCharData1 = value;
  }

  void addToLineCharData1(LineChartStruct value) {
    LineCharData1.add(value);
  }

  void removeFromLineCharData1(LineChartStruct value) {
    LineCharData1.remove(value);
  }

  void removeAtIndexFromLineCharData1(int index) {
    LineCharData1.removeAt(index);
  }

  void updateLineCharData1AtIndex(
    int index,
    LineChartStruct Function(LineChartStruct) updateFn,
  ) {
    LineCharData1[index] = updateFn(_LineCharData1[index]);
  }

  void insertAtIndexInLineCharData1(int index, LineChartStruct value) {
    LineCharData1.insert(index, value);
  }

  List<LineChartStruct> _LineCharData2 = [];
  List<LineChartStruct> get LineCharData2 => _LineCharData2;
  set LineCharData2(List<LineChartStruct> value) {
    _LineCharData2 = value;
  }

  void addToLineCharData2(LineChartStruct value) {
    LineCharData2.add(value);
  }

  void removeFromLineCharData2(LineChartStruct value) {
    LineCharData2.remove(value);
  }

  void removeAtIndexFromLineCharData2(int index) {
    LineCharData2.removeAt(index);
  }

  void updateLineCharData2AtIndex(
    int index,
    LineChartStruct Function(LineChartStruct) updateFn,
  ) {
    LineCharData2[index] = updateFn(_LineCharData2[index]);
  }

  void insertAtIndexInLineCharData2(int index, LineChartStruct value) {
    LineCharData2.insert(index, value);
  }

  double _LineCharMinX = 0.0;
  double get LineCharMinX => _LineCharMinX;
  set LineCharMinX(double value) {
    _LineCharMinX = value;
  }

  double _LineCharMaxX = 1439.0;
  double get LineCharMaxX => _LineCharMaxX;
  set LineCharMaxX(double value) {
    _LineCharMaxX = value;
  }

  String _TimerComander = '';
  String get TimerComander => _TimerComander;
  set TimerComander(String value) {
    _TimerComander = value;
  }

  int _dataChartLength = 0;
  int get dataChartLength => _dataChartLength;
  set dataChartLength(int value) {
    _dataChartLength = value;
  }

  List<String> _selectIntervalList = ['Сегодня'];
  List<String> get selectIntervalList => _selectIntervalList;
  set selectIntervalList(List<String> value) {
    _selectIntervalList = value;
  }

  void addToSelectIntervalList(String value) {
    selectIntervalList.add(value);
  }

  void removeFromSelectIntervalList(String value) {
    selectIntervalList.remove(value);
  }

  void removeAtIndexFromSelectIntervalList(int index) {
    selectIntervalList.removeAt(index);
  }

  void updateSelectIntervalListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectIntervalList[index] = updateFn(_selectIntervalList[index]);
  }

  void insertAtIndexInSelectIntervalList(int index, String value) {
    selectIntervalList.insert(index, value);
  }

  String _selectedInterval = 'Сегодня';
  String get selectedInterval => _selectedInterval;
  set selectedInterval(String value) {
    _selectedInterval = value;
  }

  bool _intervalListMode = false;
  bool get intervalListMode => _intervalListMode;
  set intervalListMode(bool value) {
    _intervalListMode = value;
  }

  bool _LineChartZoom = false;
  bool get LineChartZoom => _LineChartZoom;
  set LineChartZoom(bool value) {
    _LineChartZoom = value;
  }

  String _LineChartOut = '11.05.81';
  String get LineChartOut => _LineChartOut;
  set LineChartOut(String value) {
    _LineChartOut = value;
  }

  bool _LineChartOnTap = false;
  bool get LineChartOnTap => _LineChartOnTap;
  set LineChartOnTap(bool value) {
    _LineChartOnTap = value;
  }

  bool _panoramaMode = false;
  bool get panoramaMode => _panoramaMode;
  set panoramaMode(bool value) {
    _panoramaMode = value;
  }

  List<LineChartStruct> _panoramaLineCharData1 = [];
  List<LineChartStruct> get panoramaLineCharData1 => _panoramaLineCharData1;
  set panoramaLineCharData1(List<LineChartStruct> value) {
    _panoramaLineCharData1 = value;
  }

  void addToPanoramaLineCharData1(LineChartStruct value) {
    panoramaLineCharData1.add(value);
  }

  void removeFromPanoramaLineCharData1(LineChartStruct value) {
    panoramaLineCharData1.remove(value);
  }

  void removeAtIndexFromPanoramaLineCharData1(int index) {
    panoramaLineCharData1.removeAt(index);
  }

  void updatePanoramaLineCharData1AtIndex(
    int index,
    LineChartStruct Function(LineChartStruct) updateFn,
  ) {
    panoramaLineCharData1[index] = updateFn(_panoramaLineCharData1[index]);
  }

  void insertAtIndexInPanoramaLineCharData1(int index, LineChartStruct value) {
    panoramaLineCharData1.insert(index, value);
  }

  List<LineChartStruct> _panoramaLineCharData2 = [];
  List<LineChartStruct> get panoramaLineCharData2 => _panoramaLineCharData2;
  set panoramaLineCharData2(List<LineChartStruct> value) {
    _panoramaLineCharData2 = value;
  }

  void addToPanoramaLineCharData2(LineChartStruct value) {
    panoramaLineCharData2.add(value);
  }

  void removeFromPanoramaLineCharData2(LineChartStruct value) {
    panoramaLineCharData2.remove(value);
  }

  void removeAtIndexFromPanoramaLineCharData2(int index) {
    panoramaLineCharData2.removeAt(index);
  }

  void updatePanoramaLineCharData2AtIndex(
    int index,
    LineChartStruct Function(LineChartStruct) updateFn,
  ) {
    panoramaLineCharData2[index] = updateFn(_panoramaLineCharData2[index]);
  }

  void insertAtIndexInPanoramaLineCharData2(int index, LineChartStruct value) {
    panoramaLineCharData2.insert(index, value);
  }

  double _tooltipLineChartX = 0.0;
  double get tooltipLineChartX => _tooltipLineChartX;
  set tooltipLineChartX(double value) {
    _tooltipLineChartX = value;
  }

  int _LineChartUnixTimePoint = 0;
  int get LineChartUnixTimePoint => _LineChartUnixTimePoint;
  set LineChartUnixTimePoint(int value) {
    _LineChartUnixTimePoint = value;
  }

  bool _NextChartDay = false;
  bool get NextChartDay => _NextChartDay;
  set NextChartDay(bool value) {
    _NextChartDay = value;
  }

  int _scrollChannel = 0;
  int get scrollChannel => _scrollChannel;
  set scrollChannel(int value) {
    _scrollChannel = value;
  }

  String _selectIntervalOut = '';
  String get selectIntervalOut => _selectIntervalOut;
  set selectIntervalOut(String value) {
    _selectIntervalOut = value;
  }

  int _startDateForSlider = 1;
  int get startDateForSlider => _startDateForSlider;
  set startDateForSlider(int value) {
    _startDateForSlider = value;
  }

  int _endDateForSlider = 3;
  int get endDateForSlider => _endDateForSlider;
  set endDateForSlider(int value) {
    _endDateForSlider = value;
  }

  int _nStepsForSlider = 3;
  int get nStepsForSlider => _nStepsForSlider;
  set nStepsForSlider(int value) {
    _nStepsForSlider = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
