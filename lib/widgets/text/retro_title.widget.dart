part of retro_design_system;

class RetroH3 extends RetroText {
  const RetroH3(
    super.text, {
    super.key,
    super.style,
    super.color,
    super.isBold = true,
    super.fontSize = 48.0,
  }) : super();

  const RetroH3.white(
    super.text, {
    super.key,
    super.style,
    super.isBold = true,
    super.fontSize = 48.0,
  }) : super.white();
}

class RetroH4 extends RetroText {
  const RetroH4(
    super.text, {
    super.key,
    super.style,
    super.color,
    super.isBold = true,
    super.fontSize = 32.0,
  }) : super();

  const RetroH4.white(
    super.text, {
    super.key,
    super.style,
    super.isBold = true,
    super.fontSize = 32.0,
  }) : super.white();
}

class RetroH5 extends RetroText {
  const RetroH5(
    super.text, {
    super.key,
    super.style,
    super.color,
    super.isBold = true,
    super.fontSize = 24.0,
    super.overflow,
    super.softWrap,
  }) : super();

  const RetroH5.white(
    super.text, {
    super.key,
    super.style,
    super.isBold = true,
    super.fontSize = 24.0,
    super.overflow,
    super.softWrap,
  }) : super.white();
}
