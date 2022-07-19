// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crayon_payment_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrayonPaymentColorPalette _$CrayonPaymentColorPaletteFromJson(
        Map<String, dynamic> json) =>
    CrayonPaymentColorPalette(
      primary: json['primary'] as String?,
      secondary: json['secondary'] as String?,
      tertiary: json['tertiary'] as String?,
      quaternary: json['quaternary'] as String?,
      quinary: json['quinary'] as String?,
      senary: json['senary'] as String?,
      septenary: json['septenary'] as String?,
      octonary: json['octonary'] as String?,
      nonary: json['nonary'] as String?,
      denary: json['denary'] as String?,
      infoIcon: json['infoIcon'] as String?,
      panelColorPrimary: json['panelColorPrimary'] as String?,
      panelColorSecondary: json['panelColorSecondary'] as String?,
      panelColorTertiary: json['panelColorTertiary'] as String?,
    );

Map<String, dynamic> _$CrayonPaymentColorPaletteToJson(
        CrayonPaymentColorPalette instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'tertiary': instance.tertiary,
      'quaternary': instance.quaternary,
      'quinary': instance.quinary,
      'senary': instance.senary,
      'septenary': instance.septenary,
      'octonary': instance.octonary,
      'nonary': instance.nonary,
      'denary': instance.denary,
      'infoIcon': instance.infoIcon,
      'panelColorPrimary': instance.panelColorPrimary,
      'panelColorSecondary': instance.panelColorSecondary,
      'panelColorTertiary': instance.panelColorTertiary,
    };

CrayonPaymentSliderThemeData _$CrayonPaymentSliderThemeDataFromJson(
        Map<String, dynamic> json) =>
    CrayonPaymentSliderThemeData(
      activeTrackColor: json['activeTrackColor'] as String?,
      inactiveTrackColor: json['inactiveTrackColor'] as String?,
    );

Map<String, dynamic> _$CrayonPaymentSliderThemeDataToJson(
        CrayonPaymentSliderThemeData instance) =>
    <String, dynamic>{
      'activeTrackColor': instance.activeTrackColor,
      'inactiveTrackColor': instance.inactiveTrackColor,
    };

CrayonPaymentCardThemeData _$CrayonPaymentCardThemeDataFromJson(
        Map<String, dynamic> json) =>
    CrayonPaymentCardThemeData(
      color: json['color'] as String?,
      shadowColor: json['shadowColor'] as String?,
      elevation: (json['elevation'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CrayonPaymentCardThemeDataToJson(
        CrayonPaymentCardThemeData instance) =>
    <String, dynamic>{
      'color': instance.color,
      'shadowColor': instance.shadowColor,
      'elevation': instance.elevation,
    };

CrayonPaymentAppBarThemeData _$CrayonPaymentAppBarThemeDataFromJson(
        Map<String, dynamic> json) =>
    CrayonPaymentAppBarThemeData(
      foregroundColor: json['foregroundColor'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      iconTheme: json['iconTheme'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['iconTheme'] as Map<String, dynamic>),
      actionIconsTheme: json['actionIconsTheme'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['actionIconsTheme'] as Map<String, dynamic>),
      titleTextStyle: json['titleTextStyle'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['titleTextStyle'] as Map<String, dynamic>),
      textThemeData: json['textTheme'] == null
          ? null
          : CrayonPaymentTextThemeData.fromJson(
              json['textTheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CrayonPaymentAppBarThemeDataToJson(
        CrayonPaymentAppBarThemeData instance) =>
    <String, dynamic>{
      'foregroundColor': instance.foregroundColor,
      'backgroundColor': instance.backgroundColor,
      'iconTheme': instance.iconTheme,
      'actionIconsTheme': instance.actionIconsTheme,
      'titleTextStyle': instance.titleTextStyle,
      'textTheme': instance.textThemeData,
    };

CrayonPaymentStyleData _$CrayonPaymentStyleDataFromJson(
        Map<String, dynamic> json) =>
    CrayonPaymentStyleData(
      color: json['color'] as String?,
      fontFamily: json['fontFamily'] as String?,
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      opacity: (json['opacity'] as num?)?.toDouble(),
      textColor: json['textColor'] as String?,
      minimumSize: (json['minimumSize'] as num?)?.toDouble(),
      borderRadius: (json['borderRadius'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] as int?,
    );

Map<String, dynamic> _$CrayonPaymentStyleDataToJson(
        CrayonPaymentStyleData instance) =>
    <String, dynamic>{
      'color': instance.color,
      'fontFamily': instance.fontFamily,
      'fontSize': instance.fontSize,
      'opacity': instance.opacity,
      'textColor': instance.textColor,
      'minimumSize': instance.minimumSize,
      'borderRadius': instance.borderRadius,
      'fontWeight': instance.fontWeight,
    };

CrayonPaymentTextThemeData _$CrayonPaymentTextThemeDataFromJson(
        Map<String, dynamic> json) =>
    CrayonPaymentTextThemeData(
      headline1: json['headline1'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['headline1'] as Map<String, dynamic>),
      headline2: json['headline2'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['headline2'] as Map<String, dynamic>),
      headline3: json['headline3'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['headline3'] as Map<String, dynamic>),
      headline4: json['headline4'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['headline4'] as Map<String, dynamic>),
      headline5: json['headline5'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['headline5'] as Map<String, dynamic>),
      headline6: json['headline6'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['headline6'] as Map<String, dynamic>),
      subtitle1: json['subtitle1'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['subtitle1'] as Map<String, dynamic>),
      subtitle2: json['subtitle2'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['subtitle2'] as Map<String, dynamic>),
      bodyText1: json['bodyText1'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['bodyText1'] as Map<String, dynamic>),
      bodyText2: json['bodyText2'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['bodyText2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CrayonPaymentTextThemeDataToJson(
        CrayonPaymentTextThemeData instance) =>
    <String, dynamic>{
      'headline1': instance.headline1,
      'headline2': instance.headline2,
      'headline3': instance.headline3,
      'headline4': instance.headline4,
      'headline5': instance.headline5,
      'headline6': instance.headline6,
      'subtitle1': instance.subtitle1,
      'subtitle2': instance.subtitle2,
      'bodyText1': instance.bodyText1,
      'bodyText2': instance.bodyText2,
    };

CrayonPaymentInputDecorationThemeData
    _$CrayonPaymentInputDecorationThemeDataFromJson(
            Map<String, dynamic> json) =>
        CrayonPaymentInputDecorationThemeData(
          hintStyle: json['hintStyle'] == null
              ? null
              : CrayonPaymentStyleData.fromJson(
                  json['hintStyle'] as Map<String, dynamic>),
          errorStyle: json['errorStyle'] == null
              ? null
              : CrayonPaymentStyleData.fromJson(
                  json['errorStyle'] as Map<String, dynamic>),
          labelStyle: json['labelStyle'] == null
              ? null
              : CrayonPaymentStyleData.fromJson(
                  json['labelStyle'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CrayonPaymentInputDecorationThemeDataToJson(
        CrayonPaymentInputDecorationThemeData instance) =>
    <String, dynamic>{
      'hintStyle': instance.hintStyle,
      'errorStyle': instance.errorStyle,
      'labelStyle': instance.labelStyle,
    };

CrayonPaymentScreenThemeData _$CrayonPaymentScreenThemeDataFromJson(
        Map<String, dynamic> json) =>
    CrayonPaymentScreenThemeData(
      screenName: json['screenName'] as String,
      primaryColor: json['primaryColor'] as String?,
      primaryColorDark: json['primaryColorDark'] as String?,
      primaryColorLight: json['primaryColorLight'] as String?,
      splashColor: json['splashColor'] as String?,
      scaffoldBackgroundColor: json['scaffoldBackgroundColor'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      errorColor: json['errorColor'] as String?,
      bottomAppBarColor: json['bottomAppBarColor'] as String?,
      toggleableActiveColor: json['toggleableActiveColor'] as String?,
      dividerColor: json['dividerColor'] as String?,
      highlightTextColor: json['highlightTextColor'] as String?,
      textFieldBackgroundColor: json['textFieldBackgroundColor'] as String?,
      actionButtonIconColor: json['actionButtonIconColor'] as String?,
      iconTheme: json['iconTheme'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['iconTheme'] as Map<String, dynamic>),
      appBarTheme: json['appBarTheme'] == null
          ? null
          : CrayonPaymentAppBarThemeData.fromJson(
              json['appBarTheme'] as Map<String, dynamic>),
      cardTheme: json['cardTheme'] == null
          ? null
          : CrayonPaymentCardThemeData.fromJson(
              json['cardTheme'] as Map<String, dynamic>),
      textTheme: json['textTheme'] == null
          ? null
          : CrayonPaymentTextThemeData.fromJson(
              json['textTheme'] as Map<String, dynamic>),
      elevatedButtonTheme: json['elevatedButtonTheme'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['elevatedButtonTheme'] as Map<String, dynamic>),
      textButtonTheme: json['textButtonTheme'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['textButtonTheme'] as Map<String, dynamic>),
      textSelectionTheme: json['textSelectionTheme'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['textSelectionTheme'] as Map<String, dynamic>),
      inputDecorationTheme: json['inputDecorationTheme'] == null
          ? null
          : CrayonPaymentInputDecorationThemeData.fromJson(
              json['inputDecorationTheme'] as Map<String, dynamic>),
      checkboxThemeData: json['checkboxThemeData'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['checkboxThemeData'] as Map<String, dynamic>),
      segmentedThemeData: json['segmentedThemeData'] == null
          ? null
          : CrayonPaymentStyleData.fromJson(
              json['segmentedThemeData'] as Map<String, dynamic>),
      sliderTheme: json['sliderTheme'] == null
          ? null
          : CrayonPaymentSliderThemeData.fromJson(
              json['sliderTheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CrayonPaymentScreenThemeDataToJson(
        CrayonPaymentScreenThemeData instance) =>
    <String, dynamic>{
      'screenName': instance.screenName,
      'highlightTextColor': instance.highlightTextColor,
      'actionButtonIconColor': instance.actionButtonIconColor,
      'textFieldBackgroundColor': instance.textFieldBackgroundColor,
      'primaryColor': instance.primaryColor,
      'primaryColorDark': instance.primaryColorDark,
      'primaryColorLight': instance.primaryColorLight,
      'splashColor': instance.splashColor,
      'scaffoldBackgroundColor': instance.scaffoldBackgroundColor,
      'backgroundColor': instance.backgroundColor,
      'errorColor': instance.errorColor,
      'bottomAppBarColor': instance.bottomAppBarColor,
      'toggleableActiveColor': instance.toggleableActiveColor,
      'dividerColor': instance.dividerColor,
      'iconTheme': instance.iconTheme,
      'appBarTheme': instance.appBarTheme,
      'cardTheme': instance.cardTheme,
      'textTheme': instance.textTheme,
      'elevatedButtonTheme': instance.elevatedButtonTheme,
      'textButtonTheme': instance.textButtonTheme,
      'textSelectionTheme': instance.textSelectionTheme,
      'inputDecorationTheme': instance.inputDecorationTheme,
      'checkboxThemeData': instance.checkboxThemeData,
      'segmentedThemeData': instance.segmentedThemeData,
      'sliderTheme': instance.sliderTheme,
    };

CrayonPaymentThemeData _$CrayonPaymentThemeDataFromJson(
        Map<String, dynamic> json) =>
    CrayonPaymentThemeData(
      colorPalette: json['colors.dart'] == null
          ? null
          : CrayonPaymentColorPalette.fromJson(
              json['colors.dart'] as Map<String, dynamic>),
      screens: (json['screens'] as List<dynamic>)
          .map((e) =>
              CrayonPaymentScreenThemeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CrayonPaymentThemeDataToJson(
        CrayonPaymentThemeData instance) =>
    <String, dynamic>{
      'colors.dart': instance.colorPalette,
      'screens': instance.screens,
    };
