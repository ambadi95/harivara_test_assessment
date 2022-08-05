import 'dart:convert';

import 'package:core/utils/extensions/string_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_annotation/json_annotation.dart';

part 'crayon_payment_theme.g.dart';

@JsonSerializable()
class CrayonPaymentColorPalette {
  String? primary;
  String? secondary;
  String? tertiary;
  String? quaternary;
  String? quinary;
  String? senary;
  String? septenary;
  String? octonary;
  String? nonary;
  String? denary;
  String? infoIcon;
  String? panelColorPrimary;
  String? panelColorSecondary;
  String? panelColorTertiary;

  CrayonPaymentColorPalette({
    this.primary,
    this.secondary,
    this.tertiary,
    this.quaternary,
    this.quinary,
    this.senary,
    this.septenary,
    this.octonary,
    this.nonary,
    this.denary,
    this.infoIcon,
    this.panelColorPrimary,
    this.panelColorSecondary,
    this.panelColorTertiary,
  });

  factory CrayonPaymentColorPalette.fromJson(Map<String, dynamic> json) =>
      _$CrayonPaymentColorPaletteFromJson(json);

  Map<String, dynamic> toJson() => _$CrayonPaymentColorPaletteToJson(this);
}

@JsonSerializable()
class CrayonPaymentSliderThemeData {
  String? activeTrackColor;
  String? inactiveTrackColor;

  CrayonPaymentSliderThemeData({
    this.activeTrackColor,
    this.inactiveTrackColor,
  });

  factory CrayonPaymentSliderThemeData.fromJson(Map<String, dynamic> json) =>
      _$CrayonPaymentSliderThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrayonPaymentSliderThemeDataToJson(this);
}

@JsonSerializable()
class CrayonPaymentCardThemeData {
  final String? color;
  final String? shadowColor;
  final double? elevation;

  CrayonPaymentCardThemeData({
    this.color,
    this.shadowColor,
    this.elevation,
  });

  factory CrayonPaymentCardThemeData.fromJson(Map<String, dynamic> json) =>
      _$CrayonPaymentCardThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrayonPaymentCardThemeDataToJson(this);
}

@JsonSerializable()
class CrayonPaymentAppBarThemeData {
  String? foregroundColor;
  String? backgroundColor;
  CrayonPaymentStyleData? iconTheme;
  CrayonPaymentStyleData? actionIconsTheme;
  CrayonPaymentStyleData? titleTextStyle;

  @JsonKey(name: 'textTheme')
  CrayonPaymentTextThemeData? textThemeData;

  CrayonPaymentAppBarThemeData({
    this.foregroundColor,
    this.backgroundColor,
    this.iconTheme,
    this.actionIconsTheme,
    this.titleTextStyle,
    this.textThemeData,
  });

  factory CrayonPaymentAppBarThemeData.fromJson(Map<String, dynamic> json) =>
      _$CrayonPaymentAppBarThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrayonPaymentAppBarThemeDataToJson(this);
}

@JsonSerializable()
class CrayonPaymentStyleData {
  String? color;
  String? fontFamily;
  double? fontSize;
  double? opacity;
  String? textColor;
  double? minimumSize;
  double? borderRadius;
  int? fontWeight;

  CrayonPaymentStyleData({
    this.color,
    this.fontFamily,
    this.fontSize,
    this.opacity,
    this.textColor,
    this.minimumSize,
    this.borderRadius,
    this.fontWeight,
  });

  factory CrayonPaymentStyleData.fromJson(Map<String, dynamic> json) =>
      _$CrayonPaymentStyleDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrayonPaymentStyleDataToJson(this);
}

@JsonSerializable()
class CrayonPaymentTextThemeData {
  CrayonPaymentStyleData? headline1;
  CrayonPaymentStyleData? headline2;
  CrayonPaymentStyleData? headline3;
  CrayonPaymentStyleData? headline4;
  CrayonPaymentStyleData? headline5;
  CrayonPaymentStyleData? headline6;
  CrayonPaymentStyleData? subtitle1;
  CrayonPaymentStyleData? subtitle2;
  CrayonPaymentStyleData? bodyText1;
  CrayonPaymentStyleData? bodyText2;

  CrayonPaymentTextThemeData({
    this.headline1,
    this.headline2,
    this.headline3,
    this.headline4,
    this.headline5,
    this.headline6,
    this.subtitle1,
    this.subtitle2,
    this.bodyText1,
    this.bodyText2,
  });

  factory CrayonPaymentTextThemeData.fromJson(Map<String, dynamic> json) =>
      _$CrayonPaymentTextThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrayonPaymentTextThemeDataToJson(this);
}

@JsonSerializable()
class CrayonPaymentInputDecorationThemeData {
  CrayonPaymentStyleData? hintStyle;
  CrayonPaymentStyleData? errorStyle;
  CrayonPaymentStyleData? labelStyle;

  CrayonPaymentInputDecorationThemeData({
    this.hintStyle,
    this.errorStyle,
    this.labelStyle,
  });

  factory CrayonPaymentInputDecorationThemeData.fromJson(
          Map<String, dynamic> json) =>
      _$CrayonPaymentInputDecorationThemeDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CrayonPaymentInputDecorationThemeDataToJson(this);
}

@JsonSerializable()
class CrayonPaymentScreenThemeData {
  String screenName;
  String? highlightTextColor;
  String? actionButtonIconColor;
  String? textFieldBackgroundColor;
  String? primaryColor;
  String? primaryColorDark;
  String? primaryColorLight;
  String? splashColor;
  String? scaffoldBackgroundColor;
  String? backgroundColor;
  String? errorColor;
  String? bottomAppBarColor;
  String? toggleableActiveColor;
  String? dividerColor;
  CrayonPaymentStyleData? iconTheme;
  CrayonPaymentAppBarThemeData? appBarTheme;
  CrayonPaymentCardThemeData? cardTheme;
  CrayonPaymentTextThemeData? textTheme;
  CrayonPaymentStyleData? elevatedButtonTheme;
  CrayonPaymentStyleData? textButtonTheme;
  CrayonPaymentStyleData? textSelectionTheme;
  CrayonPaymentInputDecorationThemeData? inputDecorationTheme;
  CrayonPaymentStyleData? checkboxThemeData;
  CrayonPaymentStyleData? segmentedThemeData;
  CrayonPaymentSliderThemeData? sliderTheme;

  CrayonPaymentScreenThemeData({
    required this.screenName,
    this.primaryColor,
    this.primaryColorDark,
    this.primaryColorLight,
    this.splashColor,
    this.scaffoldBackgroundColor,
    this.backgroundColor,
    this.errorColor,
    this.bottomAppBarColor,
    this.toggleableActiveColor,
    this.dividerColor,
    this.highlightTextColor,
    this.textFieldBackgroundColor,
    this.actionButtonIconColor,
    this.iconTheme,
    this.appBarTheme,
    this.cardTheme,
    this.textTheme,
    this.elevatedButtonTheme,
    this.textButtonTheme,
    this.textSelectionTheme,
    this.inputDecorationTheme,
    this.checkboxThemeData,
    this.segmentedThemeData,
    this.sliderTheme,
  });

  factory CrayonPaymentScreenThemeData.fromJson(Map<String, dynamic> json) =>
      _$CrayonPaymentScreenThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrayonPaymentScreenThemeDataToJson(this);
}

@JsonSerializable()
class CrayonPaymentThemeData {
  @JsonKey(name: 'colors.dart')
  CrayonPaymentColorPalette? colorPalette;

  List<CrayonPaymentScreenThemeData> screens;

  CrayonPaymentThemeData({
    this.colorPalette,
    required this.screens,
  });

  factory CrayonPaymentThemeData.fromJson(Map<String, dynamic> json) =>
      _$CrayonPaymentThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrayonPaymentThemeDataToJson(this);
}

class CrayonPaymentTheme {
  ThemeData? defaultTheme;

  late CrayonPaymentThemeData themeData;
  late CrayonPaymentScreenThemeData defaultThemeData;

  static final CrayonPaymentTheme _singleton = CrayonPaymentTheme._internal();

  factory CrayonPaymentTheme() {
    return _singleton;
  }

  CrayonPaymentTheme._internal();

  TextStyle? _buildTextStyle(CrayonPaymentStyleData? styleData) {
    if (styleData != null) {
      var fontWeightIndex = 3; // default font weight index
      if (styleData.fontWeight != null &&
          styleData.fontWeight! >= 0 &&
          styleData.fontWeight! <= 8) {
        fontWeightIndex = styleData.fontWeight!;
      }
      return TextStyle(
        color: styleData.color?.toColorWithOpacity(styleData.opacity ?? 1.0),
        fontFamily: styleData.fontFamily,
        fontSize: styleData.fontSize,
        fontWeight: FontWeight.values[fontWeightIndex],
      );
    }

    return null;
  }

  Future<void> initialize({required bool loadCustomTheme}) async {
    final String defaultJson;
    late final String customJson;

    defaultJson = await rootBundle.loadString(
      'packages/widget_library/assets/styles/theme_data.json',
    );

    if (loadCustomTheme) {
      customJson = await rootBundle.loadString(
        'assets/styles/theme_data.json',
      );
    }

    // Pull out the themes object and iterate over the themes
    final defaultSerialisedJson =
        jsonDecode(defaultJson) as Map<String, dynamic>;

    var json = defaultSerialisedJson;

    if (loadCustomTheme) {
      final customSerialisedJson =
          jsonDecode(customJson) as Map<String, dynamic>;
      json.addAll(customSerialisedJson);
    }

    themeData = CrayonPaymentThemeData.fromJson(json);

    defaultTheme = _buildTheme(
      'default',
    );

    try {
      defaultThemeData = themeData.screens.firstWhere(
        (element) => element.screenName.toLowerCase().compareTo('default') == 0,
      );
    } on StateError {}
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme(
    CrayonPaymentStyleData? elevatedButtonTheme,
  ) {
    var style = ElevatedButton.styleFrom(
      primary: elevatedButtonTheme?.color?.toColor(),
      onPrimary: elevatedButtonTheme?.textColor?.toColor(),
      textStyle: _buildTextStyle(elevatedButtonTheme),
      minimumSize: (elevatedButtonTheme?.minimumSize != null)
          ? Size.fromHeight(elevatedButtonTheme!.minimumSize!)
          : null,
      shape: (elevatedButtonTheme?.borderRadius != null)
          ? RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(elevatedButtonTheme!.borderRadius!),
            )
          : null,
    );
    return ElevatedButtonThemeData(
      style: style,
    );
  }

  TextTheme _buildTextTheme(
    CrayonPaymentTextThemeData? textTheme, {
    TextTheme? defaulTextTheme,
  }) {
    return TextTheme(
      headline1: (textTheme?.headline1 != null)
          ? _buildTextStyle(textTheme?.headline1)
          : defaulTextTheme?.headline1,
      headline2: (textTheme?.headline2 != null)
          ? _buildTextStyle(textTheme?.headline2)
          : defaulTextTheme?.headline2,
      headline3: (textTheme?.headline3 != null)
          ? _buildTextStyle(textTheme?.headline3)
          : defaulTextTheme?.headline3,
      headline4: (textTheme?.headline4 != null)
          ? _buildTextStyle(textTheme?.headline4)
          : defaulTextTheme?.headline4,
      headline5: (textTheme?.headline5 != null)
          ? _buildTextStyle(textTheme?.headline5)
          : defaulTextTheme?.headline5,
      headline6: (textTheme?.headline6 != null)
          ? _buildTextStyle(textTheme?.headline6)
          : defaultTheme?.textTheme.headline6,
      subtitle1: (textTheme?.subtitle1 != null)
          ? _buildTextStyle(textTheme?.subtitle1)
          : defaultTheme?.textTheme.subtitle1,
      subtitle2: (textTheme?.subtitle2 != null)
          ? _buildTextStyle(textTheme?.subtitle2)
          : defaultTheme?.textTheme.subtitle2,
      bodyText1: (textTheme?.bodyText1 != null)
          ? _buildTextStyle(textTheme?.bodyText1)
          : defaultTheme?.textTheme.bodyText1,
      bodyText2: (textTheme?.bodyText2 != null)
          ? _buildTextStyle(textTheme?.bodyText2)
          : defaultTheme?.textTheme.bodyText2,
    );
  }

  SliderThemeData? _buildSliderTheme(
    CrayonPaymentSliderThemeData? slideThemeData,
    SliderThemeData? defaultSlideThemeData,
  ) {
    final slider = slideThemeData != null
        ? SliderThemeData(
            activeTrackColor: slideThemeData.activeTrackColor.toColor(),
            inactiveTrackColor: slideThemeData.inactiveTrackColor.toColor(),
          )
        : defaultSlideThemeData;

    return slider;
  }

  ThemeData _buildTheme(
    String? screenName, {
    ThemeData? defaultThemeData,
  }) {
    if (screenName.isNullOrEmpty()) {
      return defaultThemeData!;
    }
    CrayonPaymentScreenThemeData? screenThemeData;
    try {
      screenThemeData = themeData.screens.firstWhere(
        (element) =>
            element.screenName
                .toLowerCase()
                .compareTo(screenName!.toLowerCase()) ==
            0,
      );
    } on StateError {}

    return ThemeData(
      primaryColor: screenThemeData?.primaryColor?.toColor() ??
          defaultThemeData?.primaryColor,
      primaryColorDark: screenThemeData?.primaryColorDark?.toColor() ??
          defaultThemeData?.primaryColorDark,
      primaryColorLight: screenThemeData?.primaryColorLight?.toColor() ??
          defaultThemeData?.primaryColorLight,
      splashColor: screenThemeData?.splashColor?.toColor() ??
          defaultThemeData?.splashColor,
      scaffoldBackgroundColor:
          screenThemeData?.scaffoldBackgroundColor?.toColor() ??
              defaultThemeData?.scaffoldBackgroundColor,
      backgroundColor: screenThemeData?.backgroundColor?.toColor() ??
          defaultThemeData?.backgroundColor,
      errorColor: screenThemeData?.errorColor?.toColor() ??
          defaultThemeData?.errorColor,
      bottomAppBarColor: screenThemeData?.bottomAppBarColor?.toColor() ??
          defaultThemeData?.bottomAppBarColor,
      toggleableActiveColor:
          screenThemeData?.toggleableActiveColor?.toColor() ??
              defaultThemeData?.toggleableActiveColor,
      dividerColor: screenThemeData?.dividerColor?.toColor() ??
          defaultThemeData?.dividerColor,
      sliderTheme: _buildSliderTheme(
        screenThemeData?.sliderTheme,
        defaultThemeData?.sliderTheme,
      ),
      iconTheme: IconThemeData(
        color: screenThemeData?.iconTheme?.color?.toColor() ??
            defaultThemeData?.iconTheme.color,
        size: screenThemeData?.iconTheme?.minimumSize ??
            defaultThemeData?.iconTheme.size,
      ),
      appBarTheme: AppBarTheme(
        foregroundColor:
            screenThemeData?.appBarTheme?.foregroundColor?.toColor() ??
                defaultThemeData?.appBarTheme.foregroundColor,
        backgroundColor:
            screenThemeData?.appBarTheme?.backgroundColor?.toColor() ??
                defaultThemeData?.appBarTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: screenThemeData?.appBarTheme?.iconTheme?.color?.toColor() ??
              defaultThemeData?.appBarTheme.iconTheme?.color,
          size: screenThemeData?.appBarTheme?.iconTheme?.minimumSize ??
              defaultThemeData?.appBarTheme.iconTheme?.size,
        ),
        actionsIconTheme:
            (screenThemeData?.appBarTheme?.actionIconsTheme != null)
                ? IconThemeData(
                    color: screenThemeData?.appBarTheme?.actionIconsTheme?.color
                        ?.toColor(),
                  )
                : defaultTheme?.appBarTheme.actionsIconTheme,
        titleTextStyle:
            _buildTextStyle(screenThemeData?.appBarTheme?.titleTextStyle) ??
                defaultThemeData?.appBarTheme.titleTextStyle,
        // ignore: deprecated_member_use
        textTheme: _buildTextTheme(
          screenThemeData?.appBarTheme?.textThemeData,
        ),
      ),
      cardTheme: CardTheme(
        color: screenThemeData?.cardTheme?.color?.toColor() ??
            defaultThemeData?.cardTheme.color,
        shadowColor: screenThemeData?.cardTheme?.shadowColor?.toColor() ??
            defaultThemeData?.cardTheme.shadowColor,
        elevation: screenThemeData?.cardTheme?.elevation ??
            defaultThemeData?.cardTheme.elevation,
      ),
      textTheme: _buildTextTheme(
        screenThemeData?.textTheme,
        defaulTextTheme: defaultTheme?.textTheme,
      ),
      elevatedButtonTheme: (screenThemeData?.elevatedButtonTheme != null)
          ? _buildElevatedButtonTheme(
              screenThemeData?.elevatedButtonTheme,
            )
          : defaultThemeData?.elevatedButtonTheme,
      textButtonTheme: (screenThemeData?.textButtonTheme != null)
          ? TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: screenThemeData?.textButtonTheme?.color?.toColor(),
                textStyle: _buildTextStyle(screenThemeData?.textButtonTheme),
              ),
            )
          : defaultThemeData?.textButtonTheme,
      textSelectionTheme: (screenThemeData?.textSelectionTheme != null)
          ? TextSelectionThemeData(
              cursorColor:
                  screenThemeData?.textSelectionTheme?.color?.toColor(),
            )
          : defaultThemeData?.textSelectionTheme,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: (screenThemeData?.inputDecorationTheme?.hintStyle != null)
            ? _buildTextStyle(
                screenThemeData?.inputDecorationTheme?.hintStyle,
              )
            : defaultThemeData?.inputDecorationTheme.hintStyle,
        errorStyle: (screenThemeData?.inputDecorationTheme?.errorStyle != null)
            ? _buildTextStyle(
                screenThemeData?.inputDecorationTheme?.errorStyle,
              )
            : defaultThemeData?.inputDecorationTheme.errorStyle,
        labelStyle: (screenThemeData?.inputDecorationTheme?.labelStyle != null)
            ? _buildTextStyle(
                screenThemeData?.inputDecorationTheme?.labelStyle,
              )
            : defaultThemeData?.inputDecorationTheme.labelStyle,
      ),
      checkboxTheme: (screenThemeData?.checkboxThemeData != null)
          ? CheckboxThemeData(
              checkColor: _CheckBoxThemeData(
                selected:
                    screenThemeData?.checkboxThemeData!.textColor.toColor(),
                disabled: screenThemeData?.checkboxThemeData!.color.toColor(),
              ),
            )
          : defaultTheme?.checkboxTheme,
    );
  }

  ThemeData themeFor(String? screenName) {
    if (screenName.isNullOrEmpty()) {
      return defaultTheme!;
    } else {
      return _buildTheme(
        screenName,
        defaultThemeData: defaultTheme,
      );
    }
  }
}

@immutable
class _CheckBoxThemeData extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _CheckBoxThemeData({
    this.selected,
    this.disabled,
  });

  final Color? selected;
  final Color? disabled;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return selected;
    }

    return disabled;
  }
}

// ///
// /// Allows us to define extended themes for custom components.
// /// This class is a corollary to the [Theme] class
// ///
// @immutable
// class CrayonPaymentTheme extends InheritedWidget {
//   static Map<String, CrayonPaymentColorStyles>? _colorStyles;
//   static Map<String, CrayonPaymentTextStyles>? _textStyles;

//   final CrayonPaymentThemeData theme;
//   CrayonPaymentTheme({Key? key, required this.theme, required Widget child}) : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(CrayonPaymentTheme oldWidget) => oldWidget.theme != theme;

//   static CrayonPaymentTheme of(BuildContext context) {
//     final result = context.dependOnInheritedWidgetOfExactType<CrayonPaymentTheme>();
//     assert(result != null, 'No CrayonPaymentTheme found in context. Ensure that CrayonPaymentScaffold has been correctly configured.');
//     return result!;
//   }

//   static List<String> get themeNames => _colorStyles?.keys.toList() ?? [];

//   /// Loads the textstyles and themes.
//   ///
//   /// These text styles are loaded from `assets/themes/text_styles.json`.
//   ///
//   /// These color themes are loaded from `assets/themes/color_themes.json`.
//   ///
//   /// These paths can be overridden using the parameters `colorThemesPath` and `textStylesPath`.
//   static Future<void> initialise({
//     String? colorThemesPath,
//     String? textStylesPath,
//   }) async {
//     _colorStyles = await CrayonPaymentThemeHelper.loadColorStyles(
//       colorStylesPath: colorThemesPath,
//     );
//     _textStyles = await CrayonPaymentThemeHelper.loadTextStyles(
//       textStylesPath: textStylesPath,
//     );
//   }

//   ///
//   /// Gets the [CrayonPaymentThemeData] for the supplied name.
//   /// The themes must have already been loaded by calling `CrayonPaymentTheme.initialise()`
//   static CrayonPaymentThemeData forTheme(String themeName) {
//     assert(_colorStyles != null, 'The themes have not been loaded. Call CrayonPaymentTheme.initialise() from your application.');
//     assert(_colorStyles![themeName] != null, "The theme '$themeName' does not exist.");

//     assert(_textStyles != null, 'The themes have not been loaded. Call CrayonPaymentTheme.initialise() from your application.');
//     assert(_textStyles![themeName] != null, "The theme '$themeName' does not exist.");

//     final colorTheme = _colorStyles![themeName]!;
//     final textStylesTheme = _textStyles![themeName]!;

//     return CrayonPaymentThemeData(
//       colorStyles: colorTheme,
//       textStyles: textStylesTheme,
//     );
//   }
// }
