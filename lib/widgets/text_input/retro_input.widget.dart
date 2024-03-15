part of retro_design_system;

class RetroInput extends StatelessWidget {
  const RetroInput({
    this.focusNode,
    this.controller,
    this.maxLines,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.cursorColor = Colors.black,
    this.enabled,
    this.style,
    this.label,
    this.hintText,
    this.isOutlined = false,
    super.key,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? cursorColor;
  final bool? enabled;
  final TextStyle? style;
  final String? label;
  final String? hintText;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: cursorColor,
      enabled: enabled,
      style: style ?? const RegularTextStyle(),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const RegularTextStyle(),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: true,
        hintText: hintText,
        hintStyle: const RegularTextStyle().copyWith(color: Colors.black38),
        filled: enabled == false,
        fillColor: Colors.black.withOpacity(0.05),
        // border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        disabledBorder: disabledBorder,
      ),
    );
  }

  InputBorder get border {
    if (isOutlined) {
      return const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      );
    }

    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black45, width: 0.5),
      borderRadius: BorderRadius.zero,
    );
  }

  InputBorder get enabledBorder {
    if (isOutlined) {
      return const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Colors.black54,
          width: 2.0,
        ),
      );
    }

    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black45, width: 0.5),
      borderRadius: BorderRadius.zero,
    );
  }

  InputBorder get focusedBorder {
    if (isOutlined) {
      return const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Colors.black,
          width: 3.0,
        ),
      );
    }

    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.zero,
    );
  }

  InputBorder get errorBorder {
    final errorColor = Colors.red.shade200;

    if (isOutlined) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: errorColor,
          width: 2.0,
        ),
      );
    }
    return UnderlineInputBorder(
      borderSide: BorderSide(color: errorColor, width: 0.5),
      borderRadius: BorderRadius.zero,
    );
  }

  InputBorder get focusedErrorBorder {
    const errorColor = Colors.red;
    if (isOutlined) {
      return const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: errorColor,
          width: 3.0,
        ),
      );
    }

    return const UnderlineInputBorder(
      borderSide: BorderSide(color: errorColor, width: 2.0),
      borderRadius: BorderRadius.zero,
    );
  }

  InputBorder get disabledBorder {
    if (isOutlined) {
      return const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Colors.black12,
          width: 2.0,
        ),
      );
    }

    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.5),
      borderRadius: BorderRadius.zero,
    );
  }
}
