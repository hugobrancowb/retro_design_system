part of retro_design_system;

class RetroLabelText extends RetroText {
  const RetroLabelText(
    super.text, {
    super.key,
    super.style,
    super.color,
    super.isBold = false,
    super.fontSize = 12.0,
  }) : super();

  const RetroLabelText.white(
    super.text, {
    super.key,
    super.style,
    super.isBold = false,
    super.fontSize = 12.0,
  }) : super.white();
}
