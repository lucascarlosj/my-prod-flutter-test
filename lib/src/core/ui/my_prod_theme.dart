import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/src/core/ui/constants.dart';

class MyProdTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsConstants.rustyOrange,
      ),
      backgroundColor: ColorsConstants.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: ColorsConstants.black,
        fontFamily: FontConstants.family,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: ColorsConstants.white,
      labelStyle: TextStyle(
        color: ColorsConstants.paleGrey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstants.rustyOrange,
        foregroundColor: ColorsConstants.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    fontFamily: FontConstants.family,
  );
}
