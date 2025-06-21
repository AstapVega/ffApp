import 'package:collection/collection.dart';

enum MyPaletteType {
  hsv,
  hsvWithHue,
  hsvWithSaturation,
  hsvWithValue,
  hsl,
  hslWithLightness,
  hslWithSaturation,
  hueWheel,
}

enum MyColorLabelType {
  rgb,
  hsv,
  hsl,
  hex,
}

enum MyCupertinoDatePickerMode {
  date,
  time,
  dateAndTime,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MyPaletteType):
      return MyPaletteType.values.deserialize(value) as T?;
    case (MyColorLabelType):
      return MyColorLabelType.values.deserialize(value) as T?;
    case (MyCupertinoDatePickerMode):
      return MyCupertinoDatePickerMode.values.deserialize(value) as T?;
    default:
      return null;
  }
}
