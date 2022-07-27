class ButtonOptions {
  final String text;
  final void Function() onPressed;
  final bool textButton;

  ButtonOptions(
    this.text,
    this.onPressed, [
    this.textButton = true,
  ]);
}
