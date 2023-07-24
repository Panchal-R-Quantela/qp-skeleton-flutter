import 'package:flutter/material.dart';

class BaseTheme {
  static ThemeData buildLightTheme(BuildContext context,
      {Color? primaryColor,
      Color? primaryColorDark,
      Color? secondaryColor,
      Color? errorColor,
      Color? primaryTextColor,
      Color? backgroundColor,
      Color? floatingActionColor,
      Color? iconColor,
      Color? unselectedColor,
      /*Text Theme colors*/
      Color? titleTextColor,
      Color? bodyLargeColor,
      Color? titleMediumColor,
      /*----*/
      Color? drawerBgColor,
      Color? cardColor,
      InputDecorationTheme? inputDecorationTheme,
      ColorScheme? colorScheme}) {
    /*ColorScheme(
        brightness: Brightness.light,
        primary: qpPrimaryColor,
        onPrimary: qpPrimaryColor,
        secondary: qpSecondaryColor,
        onSecondary: qpSecondaryColor,
        error: qpErrorColor,
        onError: qpErrorColor,
        background: qpBackgroundColor,
        onBackground: qpBackgroundColor,
        surface: qpSecondaryColor,
        onSurface: qpSecondaryColor)*/

    var qpPrimaryColor = colorScheme != null
        ? colorScheme.primary
        : primaryColor ?? const Color.fromARGB(255, 166, 168, 254);
    var qpPrimaryColorDark =
        primaryColorDark ?? const Color.fromARGB(255, 82, 83, 126);
    var qpSecondaryColor = colorScheme != null
        ? colorScheme.secondary
        : secondaryColor ?? const Color.fromARGB(255, 62, 62, 70);
    var qpErrorColor =
        colorScheme != null ? colorScheme.error : errorColor ?? Colors.red;
    var qpPrimaryTextColor =
        primaryTextColor ?? const Color.fromARGB(255, 62, 62, 70);
    var secondaryTextColor = const Color.fromARGB(255, 166, 168, 254);
    var primaryGradient =
        const LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]);
    var qpBackgroundColor = backgroundColor ?? Colors.white;
    var qpFloatingActionColor = floatingActionColor ?? qpPrimaryColor;
    var qpIconColor = iconColor ?? Colors.blueGrey;
    var qpUnselectedColor = unselectedColor ?? Colors.grey;

    /*----- Text theme -----*/
    var qpTitleTextColor = titleTextColor ?? Colors.black45;
    var qpBodyLargeColor = bodyLargeColor ?? qpPrimaryTextColor;
    var qpTitleMediumColor = titleMediumColor ?? Colors.black45;

    var qpDrawerBgColor = drawerBgColor ?? Colors.white;
    var qpCardColor = cardColor ?? Colors.white;

    var qpInputDecorationTheme = inputDecorationTheme ??
        InputDecorationTheme(
            labelStyle: TextStyle(color: qpPrimaryTextColor),
            errorStyle: TextStyle(color: qpErrorColor),
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: qpPrimaryColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: qpPrimaryColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: qpPrimaryColor),
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
            primary: qpPrimaryColor,
            onPrimary: qpPrimaryColor,
            secondary: qpSecondaryColor,
            onSecondary: qpSecondaryColor,
            error: qpErrorColor,
            onError: qpErrorColor,
            background: qpBackgroundColor,
            onBackground: qpBackgroundColor,
            surface: qpSecondaryColor,
            onSurface: qpSecondaryColor),
        drawerTheme: DrawerThemeData(
            backgroundColor: qpDrawerBgColor, shadowColor: qpPrimaryColor),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: qpTitleTextColor),
          titleMedium: TextStyle(color: qpTitleMediumColor),
          titleSmall: TextStyle(color: qpTitleMediumColor),
          //EditText
          bodyLarge: TextStyle(color: qpBodyLargeColor, fontSize: 20),
          // text
          bodySmall: const TextStyle(color: Colors.blue),
          bodyMedium: const TextStyle(color: Colors.green, fontSize: 30),
          //Dashboard text
          //Text Color
          headlineLarge: TextStyle(color: qpBodyLargeColor),
          headlineMedium: TextStyle(color: qpBodyLargeColor),
          headlineSmall: TextStyle(color: qpBodyLargeColor),
          displayLarge: TextStyle(color: qpBodyLargeColor),
          displayMedium: TextStyle(color: qpBodyLargeColor),
          displaySmall: TextStyle(color: qpBodyLargeColor),
          labelLarge: TextStyle(color: qpBodyLargeColor),
          labelMedium: TextStyle(color: qpBodyLargeColor),
          labelSmall: TextStyle(color: qpBodyLargeColor),
        ),
        scaffoldBackgroundColor: Colors.white,
        popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: qpFloatingActionColor),
        iconTheme: IconThemeData(color: qpIconColor),
        primaryColor: qpPrimaryColor,
        primaryColorDark: qpPrimaryColorDark,
        brightness: Brightness.light,
        unselectedWidgetColor: qpUnselectedColor,
        secondaryHeaderColor: qpSecondaryColor,
        inputDecorationTheme: qpInputDecorationTheme,
        cardColor: qpCardColor,
        cardTheme: CardTheme(color: qpCardColor),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(qpPrimaryColor),
          checkColor: MaterialStateProperty.all(qpSecondaryColor),
        ),
        appBarTheme: AppBarTheme(
            color: qpPrimaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle:
                const TextStyle(color: Colors.white, fontSize: 16)));
  }

  static ThemeData buildDarkTheme(BuildContext context,
      {Color? primaryColor,
      Color? primaryColorDark,
      Color? secondaryColor,
      Color? errorColor,
      Color? primaryTextColor,
      Color? backgroundColor,
      Color? floatingActionColor,
      Color? iconColor,
      Color? unselectedColor,
      /*Text Theme colors*/
      Color? titleTextColor,
      Color? bodyLargeColor,
      Color? titleMediumColor,
      /*----*/
      Color? drawerBgColor,
      Color? cardColor,
      InputDecorationTheme? inputDecorationTheme,
      ColorScheme? colorScheme}) {
    var qpPrimaryColor = colorScheme != null
        ? colorScheme.primary
        : primaryColor ?? const Color.fromARGB(255, 62, 62, 70);
    var qpPrimaryColorDark =
        primaryColorDark ?? const Color.fromARGB(255, 82, 83, 126);
    var qpSecondaryColor = colorScheme != null
        ? colorScheme.secondary
        : secondaryColor ?? const Color.fromARGB(255, 166, 168, 254);
    var qpErrorColor =
        colorScheme != null ? colorScheme.error : errorColor ?? Colors.red;
    var qpPrimaryTextColor =
        primaryTextColor ?? const Color.fromARGB(255, 166, 168, 254);
    var secondaryTextColor = const Color.fromARGB(255, 62, 62, 70);
    var primaryGradient =
        const LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]);
    var qpBackgroundColor = backgroundColor ?? const Color(0xff1c1c1c);
    var qpFloatingActionColor = floatingActionColor ?? qpPrimaryColor;
    var qpIconColor = iconColor ?? Colors.white;
    var qpUnselectedColor = unselectedColor ?? Colors.grey;

    /*----- Text theme -----*/
    var qpTitleTextColor = titleTextColor ?? qpPrimaryTextColor;
    var qpBodyLargeColor = bodyLargeColor ?? qpPrimaryTextColor;
    var qpTitleMediumColor = titleMediumColor ?? Colors.white;

    var qpDrawerBgColor = drawerBgColor ?? const Color(0xff1f1f1f);
    var qpCardColor = cardColor ?? const Color(0xff1f1f1f);

    /* const qpPrimaryColor = Color(0xFF2697FF);
    const qpSecondaryColor = Color(0xFF2A2D3E);
    const bgColor = Color(0xFF212332);*/

    var inputDecorationColor = Colors.grey;

    var qpInputDecorationTheme = inputDecorationTheme ??
        InputDecorationTheme(
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
            primary: qpPrimaryColor,
            onPrimary: qpPrimaryColor,
            secondary: qpSecondaryColor,
            onSecondary: qpSecondaryColor,
            error: qpErrorColor,
            onError: qpErrorColor,
            background: qpBackgroundColor,
            onBackground: qpBackgroundColor,
            surface: qpSecondaryColor,
            onSurface: qpSecondaryColor),
        drawerTheme: DrawerThemeData(backgroundColor: qpDrawerBgColor),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: qpTitleTextColor),
          titleMedium: TextStyle(color: qpTitleMediumColor),
          titleSmall: TextStyle(color: qpTitleMediumColor),
          //EditText
          bodyLarge: TextStyle(color: qpBodyLargeColor, fontSize: 20),
          bodySmall: const TextStyle(color: Colors.blue),
          bodyMedium: const TextStyle(color: Colors.red, fontSize: 30),
          //Dashboard Text
          //Text Color
          headlineLarge: TextStyle(color: qpBodyLargeColor),
          headlineMedium: TextStyle(color: qpBodyLargeColor),
          headlineSmall: TextStyle(color: qpBodyLargeColor),
          displayLarge: TextStyle(color: qpBodyLargeColor),
          displayMedium: TextStyle(color: qpBodyLargeColor),
          displaySmall: TextStyle(color: qpBodyLargeColor),
          labelLarge: TextStyle(color: qpBodyLargeColor),
          labelMedium: TextStyle(color: qpBodyLargeColor),
          labelSmall: TextStyle(color: qpBodyLargeColor),
        ),
        scaffoldBackgroundColor: qpBackgroundColor,
        popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: qpFloatingActionColor),
        iconTheme: IconThemeData(color: qpIconColor),
        primaryColor: qpPrimaryColor,
        primaryColorDark: qpPrimaryColorDark,
        brightness: Brightness.light,
        unselectedWidgetColor: qpUnselectedColor,
        secondaryHeaderColor: qpSecondaryColor,
        inputDecorationTheme: qpInputDecorationTheme,
        cardColor: qpCardColor,
        cardTheme: CardTheme(color: qpCardColor),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(qpSecondaryColor),
          checkColor: MaterialStateProperty.all(qpPrimaryColor),
        ),
        appBarTheme: AppBarTheme(
            color: qpPrimaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle:
                const TextStyle(color: Colors.white, fontSize: 16)));
  }
}
