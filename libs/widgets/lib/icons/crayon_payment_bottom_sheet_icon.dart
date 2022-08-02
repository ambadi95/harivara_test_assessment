abstract class CrayonPaymentBottomSheetIcon {
  final String svgAssetPath;

  CrayonPaymentBottomSheetIcon(this.svgAssetPath)
      : assert(svgAssetPath.contains('.svg'));
}

class CrayonPaymentBottomSheetSuccessIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetSuccessIcon()
      : super(
          'packages/widget_library/assets/images/bubble_good.svg',
        );
}

class CrayonPaymentBottomSheetAppLanguageIconIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetAppLanguageIconIcon()
      : super(
    'packages/widget_library/assets/images/language_icon.svg',
  );
}

class CrayonPaymentBottomSheetErrorIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetErrorIcon()
      : super(
          'packages/widget_library/assets/images/bubble_bad.svg',
        );
}

class CrayonPaymentBottomSheetInfoIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetInfoIcon()
      : super(
          'packages/widget_library/assets/images/bubble_info.svg',
        );
}

class CrayonPaymentBottomSheetInvalidIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetInvalidIcon()
      : super(
    'packages/widget_library/assets/images/ic_invalid.svg',
  );
}

class CrayonPaymentBottomSheetExclamatoryIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetExclamatoryIcon()
      : super(
          'packages/widget_library/assets/images/exclamatory.svg',
        );
}

class CrayonPaymentBottomSheetWarningIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetWarningIcon()
      : super(
          'packages/widget_library/assets/images/ic_warning.svg',
        );
}

class CrayonPaymentBottomSheetLockIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetLockIcon()
      : super(
          'packages/widget_library/assets/images/ic_lock.svg',
        );
}

class CrayonPaymentBottomSheetLogoutIcon extends CrayonPaymentBottomSheetIcon {
  CrayonPaymentBottomSheetLogoutIcon()
      : super(
          'packages/widget_library/assets/images/ic_sign_out_outlined.svg',
        );
}
