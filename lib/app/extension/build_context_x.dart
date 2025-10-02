import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension BuildContextX on BuildContext {
  ShadThemeData get shadTheme => ShadTheme.of(this);
  ShadColorScheme get colorScheme => shadTheme.colorScheme;
  ShadTextTheme get textTheme => shadTheme.textTheme;
}
