import 'package:flutter/material.dart';

class BaseTheme {
  static ThemeData buildLightTheme(BuildContext context) {
    var primaryColor = const Color.fromARGB(255, 166, 168, 254);
    var primaryColorDark = const Color.fromARGB(255, 82, 83, 126);
    var secondaryColor = const Color.fromARGB(255, 62, 62, 70);
    var errorColor = Colors.red;
    var primaryTextColor = const Color.fromARGB(255, 62, 62, 70);
    var secondaryTextColor = const Color.fromARGB(255, 166, 168, 254);
    var primaryGradient =
        const LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]);
    var backgroundColor = Colors.white;
    var floatingActionColor = primaryColor;
    var iconColor = Colors.blueGrey;
    var unselectedColor = Colors.grey;

    /*----- Text theme -----*/
    var titleTextColor = Colors.black45;
    var bodyLargeColor = primaryTextColor;
    var titleMediumColor = Colors.black45;

    var drawerBgColor = Colors.white;
    var cardColor = Colors.white;

    var inputDecorationTheme = InputDecorationTheme(
        labelStyle: TextStyle(color: primaryTextColor),
        errorStyle: TextStyle(color: errorColor),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: primaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: primaryColor),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ));

    ThemeData base = ThemeData.light();
    return base.copyWith(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: primaryColor,
            secondary: secondaryColor,
            onSecondary: secondaryColor,
            error: errorColor,
            onError: errorColor,
            background: backgroundColor,
            onBackground: backgroundColor,
            surface: secondaryColor,
            onSurface: secondaryColor),
        drawerTheme: DrawerThemeData(
            backgroundColor: drawerBgColor, shadowColor: primaryColor),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: titleTextColor),
          titleMedium: TextStyle(color: titleMediumColor),
          titleSmall: TextStyle(color: titleMediumColor), //EditText
          bodyLarge: TextStyle(color: bodyLargeColor, fontSize: 20),
          // text
          bodySmall: const TextStyle(color: Colors.blue),
          bodyMedium: const TextStyle(color: Colors.green, fontSize: 30), //Dashboard text
          //Text Color
          headlineLarge: TextStyle(color: bodyLargeColor),
          headlineMedium: TextStyle(color: bodyLargeColor),
          headlineSmall: TextStyle(color: bodyLargeColor),
          displayLarge: TextStyle(color: bodyLargeColor),
          displayMedium: TextStyle(color: bodyLargeColor),
          displaySmall: TextStyle(color: bodyLargeColor),
          labelLarge: TextStyle(color: bodyLargeColor),
          labelMedium: TextStyle(color: bodyLargeColor),
          labelSmall: TextStyle(color: bodyLargeColor),
        ),
        scaffoldBackgroundColor: Colors.white,
        popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: floatingActionColor),
        iconTheme: IconThemeData(color: iconColor),
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        brightness: Brightness.light,
        unselectedWidgetColor: unselectedColor,
        secondaryHeaderColor: secondaryColor,
        inputDecorationTheme: inputDecorationTheme,
        cardColor: cardColor,
        cardTheme: CardTheme(color: cardColor),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(primaryColor),
          checkColor: MaterialStateProperty.all(secondaryColor),
        ));
  }

  static ThemeData buildDarkTheme(BuildContext context) {
    var primaryColor = const Color.fromARGB(255, 62, 62, 70);
    var primaryColorDark = const Color.fromARGB(255, 82, 83, 126);
    var secondaryColor = const Color.fromARGB(255, 166, 168, 254);
    var errorColor = Colors.red;
    var primaryTextColor = const Color.fromARGB(255, 166, 168, 254);
    var secondaryTextColor = const Color.fromARGB(255, 62, 62, 70);
    var primaryGradient =
        const LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]);
    var backgroundColor = const Color(0xff1c1c1c);
    var floatingActionColor = primaryColor;
    var iconColor = Colors.white;
    var unselectedColor = Colors.grey;

    /*----- Text theme -----*/
    var titleTextColor = primaryTextColor;
    var bodyLargeColor = primaryTextColor;
    var titleMediumColor = Colors.white;

    var drawerBgColor = const Color(0xff1f1f1f);
    var cardColor = const Color(0xff1f1f1f);

    /* const primaryColor = Color(0xFF2697FF);
    const secondaryColor = Color(0xFF2A2D3E);
    const bgColor = Color(0xFF212332);*/

    var inputDecorationColor = Colors.grey;

    var inputDecorationTheme = InputDecorationTheme(
        labelStyle: TextStyle(color: inputDecorationColor),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: inputDecorationColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: inputDecorationColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: inputDecorationColor),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        suffixIconColor: inputDecorationColor);

    ThemeData base = ThemeData.dark();
    return base.copyWith(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: primaryColor,
            secondary: secondaryColor,
            onSecondary: secondaryColor,
            error: errorColor,
            onError: errorColor,
            background: backgroundColor,
            onBackground: backgroundColor,
            surface: secondaryColor,
            onSurface: secondaryColor),
        drawerTheme: DrawerThemeData(backgroundColor: drawerBgColor),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: titleTextColor),
          titleMedium: TextStyle(color: titleMediumColor),
          titleSmall:  TextStyle(color:titleMediumColor ), //EditText
          bodyLarge: TextStyle(color: bodyLargeColor, fontSize: 20),
          bodySmall: const TextStyle(color: Colors.blue),
          bodyMedium: const TextStyle(color: Colors.red, fontSize: 30), //Dashboard Text
          //Text Color
          headlineLarge: TextStyle(color: bodyLargeColor),
          headlineMedium: TextStyle(color: bodyLargeColor),
          headlineSmall: TextStyle(color: bodyLargeColor),
          displayLarge: TextStyle(color: bodyLargeColor),
          displayMedium: TextStyle(color: bodyLargeColor),
          displaySmall: TextStyle(color: bodyLargeColor),
          labelLarge: TextStyle(color: bodyLargeColor),
          labelMedium: TextStyle(color: bodyLargeColor),
          labelSmall: TextStyle(color: bodyLargeColor),
        ),
        scaffoldBackgroundColor: backgroundColor,
        popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: floatingActionColor),
        iconTheme: IconThemeData(color: iconColor),
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        brightness: Brightness.light,
        unselectedWidgetColor: unselectedColor,
        secondaryHeaderColor: secondaryColor,
        inputDecorationTheme: inputDecorationTheme,
        cardColor: cardColor,
        cardTheme: CardTheme(color: cardColor),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(secondaryColor),
          checkColor: MaterialStateProperty.all(primaryColor),
        ));
  }
}
