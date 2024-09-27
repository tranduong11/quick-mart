import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
