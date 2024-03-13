import 'package:flutter/material.dart';
import 'package:retro_design_system/retro_design_system.dart';

class DesignSystemDemo extends StatefulWidget {
  const DesignSystemDemo({Key? key}) : super(key: key);

  @override
  State<DesignSystemDemo> createState() => _DesignSystemDemoState();
}

class _DesignSystemDemoState extends State<DesignSystemDemo> {
  Color randomColor = RetroColors.randomColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              RetroH3(
                "retro design system",
                color: randomColor,
              ),
              const SizedBox(height: 24.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [LoadingState()],
              ),
              const SizedBox(height: 24.0),
              RetroH4("buttons"),
              const SizedBox(height: 24.0),
              Wrap(spacing: 30, runSpacing: 30, children: buttonList),
              const Divider(height: 80),
              RetroH4("inputs"),
              const SizedBox(height: 24.0),
              Wrap(
                spacing: 30,
                runSpacing: 30,
                children: formList
                    .map((e) => Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: e,
                        ))
                    .toList(),
              ),
              const Divider(height: 80),
              RetroH4("text"),
              const SizedBox(height: 24.0),
              Wrap(spacing: 30, runSpacing: 30, children: textList),
              const Divider(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get formList {
    return [
      const RetroInput(
        key: Key("input with label and hint"),
        label: "this is a label",
        hintText: "this is a hint text",
      ),
      const RetroInput(
        key: Key("input with hint"),
        hintText: "this is a hint text",
      ),
      const RetroInput(
        key: Key("disabled input"),
        enabled: false,
        hintText: "disabled input",
      ),
    ];
  }

  List<Widget> get buttonList {
    return [
      RetroBigButton(
        "loading big button",
        key: const Key("primary big button loading"),
        color: randomColor,
        loading: true,
        onPressed: () {},
      ),
      RetroBigButton(
        "big button",
        key: const Key("big button"),
        color: randomColor,
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("big button pressed @ $timestampNow");
        },
      ),
      RetroButton(
        "primary button",
        key: const Key("primary regular button"),
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("primary button pressed @ $timestampNow");
        },
      ),
      RetroButton.light(
        "secondary button",
        isOutlined: true,
        key: const Key("secondary regular button"),
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("secondary button pressed @ $timestampNow");
        },
      ),
      RetroButton(
        "colorful button",
        key: const Key("regular button color"),
        color: randomColor,
        isOutlined: true,
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("colorful button pressed @ $timestampNow");
        },
      ),
      RetroIconButton.light(
        icon: Icons.edit_sharp,
        key: const Key("icon light button"),
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("icon light button pressed @ $timestampNow");
        },
      ),
      RetroIconButton.light(
        icon: Icons.edit_sharp,
        isOutlined: true,
        key: const Key("icon light outlined button"),
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("icon light outlined button pressed @ $timestampNow");
        },
      ),
      RetroIconButton(
        icon: Icons.edit_sharp,
        key: const Key("icon button"),
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("icon button pressed @ $timestampNow");
        },
      ),
      RetroIconButton(
        icon: Icons.edit_sharp,
        key: const Key("icon outlined button"),
        isOutlined: true,
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("icon outlined button pressed @ $timestampNow");
        },
      ),
      RetroIconButton(
        key: const Key("icon button com label"),
        icon: Icons.edit_sharp,
        hintText: "botão ícone",
        showHint: true,
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("icon button com label pressed @ $timestampNow");
        },
      ),
      RetroIconButton(
        key: const Key("icon button com label disabled"),
        icon: Icons.edit_sharp,
        hintText: "botão ícone disabled",
        showHint: true,
        enabled: false,
        onPressed: () {},
      ),
      RetroIconButton.light(
        key: const Key("icon button com label 2"),
        icon: Icons.edit_sharp,
        hintText: "botão ícone 2",
        showHint: true,
        isOutlined: true,
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("icon button com label 2 pressed @ $timestampNow");
        },
      ),
      RetroIconButton.light(
        key: const Key("icon button com label 2 disabled"),
        icon: Icons.edit_sharp,
        hintText: "botão ícone 2 disabled",
        showHint: true,
        isOutlined: true,
        enabled: false,
        onPressed: () {},
      ),
    ];
  }

  List<Widget> get textList {
    return [
      RetroH3("text h3 bold", key: const Key("text h3 bold")),
      RetroH4("text h4 bold", key: const Key("text h4 bold")),
      RetroH5("text h5 bold", key: const Key("text h5 bold")),
      RetroText("text bold", isBold: true, key: const Key("text bold")),
    ];
  }

  String get timestampNow => DateTime.now().toIso8601String();
}
