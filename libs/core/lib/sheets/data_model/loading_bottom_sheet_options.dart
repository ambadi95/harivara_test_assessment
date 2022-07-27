
import 'package:core/sheets/data_model/button_options.dart';

class LoadingBottomSheetOptions extends ButtonOptions {
  LoadingBottomSheetOptions(
    String text,
    void Function() onPressed, [
    bool textButton = true,
  ]) : super(text, onPressed, textButton);
}
