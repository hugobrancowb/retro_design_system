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
              const RetroH4("buttons"),
              const SizedBox(height: 24.0),
              Wrap(spacing: 30, runSpacing: 30, children: buttonList),
              const Divider(height: 80),
              const RetroH4("inputs"),
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
              const RetroH4("links"),
              const SizedBox(height: 24.0),
              Wrap(
                spacing: 30,
                runSpacing: 30,
                children: linksList
                    .map((e) => Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: e,
                        ))
                    .toList(),
              ),
              const Divider(height: 80),
              const RetroH4("text"),
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
        loading: true,
        onPressed: () {},
      ),
      RetroBigButton(
        "big button",
        key: const Key("big button"),
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("big button pressed @ $timestampNow");
        },
      ),
      RetroButton(
        "button",
        key: const Key("primary regular button"),
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("primary button pressed @ $timestampNow");
        },
      ),
      RetroButton(
        "button disabled",
        enabled: false,
        key: const Key("primary regular button disabled"),
        onPressed: () {
          setState(() => randomColor = RetroColors.randomColor);
          debugPrint("primary button pressed @ $timestampNow");
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

  List<Widget> get linksList {
    return [
      RetroLink(
        key: const Key('link a'),
        'link a',
        onPressed: () {
          debugPrint('press on "link a"');
        },
      ),
      RetroLink(
        key: const Key('link b'),
        'link with bigger line overhang',
        lineOverhang: 8,
        onPressed: () {
          debugPrint('press on "link b"');
        },
      ),
    ];
  }

  List<Widget> get textList {
    return [
      const RetroH3("text h3 bold", key: Key("text h3 bold")),
      const RetroH4("text h4 bold", key: Key("text h4 bold")),
      const RetroH5("text h5 bold", key: Key("text h5 bold")),
      const RetroText("text bold", isBold: true, key: Key("text bold")),
    ];
  }

  String get timestampNow => DateTime.now().toIso8601String();
}
