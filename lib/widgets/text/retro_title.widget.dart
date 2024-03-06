import 'package:retro_design_system/widgets/text/retro_text.widget.dart';

class RetroH3 extends RetroText {
  RetroH3(
    super.text, {
    super.key,
    super.style,
    super.color,
    super.isBold = true,
    super.fontSize = 48.0,
  }) : super();

  RetroH3.white(
    super.text, {
    super.key,
    super.style,
    super.isBold = true,
    super.fontSize = 48.0,
  }) : super.white();
}

// utilizado em botão
class RetroH4 extends RetroText {
  RetroH4(
    super.text, {
    super.key,
    super.style,
    super.color,
    super.isBold = true,
    super.fontSize = 32.0,
  }) : super();

  RetroH4.white(
    super.text, {
    super.key,
    super.style,
    super.isBold = true,
    super.fontSize = 32.0,
  }) : super.white();
}

class RetroH5 extends RetroText {
  RetroH5(
    super.text, {
    super.key,
    super.style,
    super.color,
    super.isBold = true,
    super.fontSize = 24.0,
    super.overflow,
    super.softWrap,
  }) : super();

  RetroH5.white(
    super.text, {
    super.key,
    super.style,
    super.isBold = true,
    super.fontSize = 24.0,
    super.overflow,
    super.softWrap,
  }) : super.white();
}
