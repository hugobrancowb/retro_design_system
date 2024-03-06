part of retro_design_system;

class RetroInput extends TextFormField {
  RetroInput({
    super.key,
    super.focusNode,
    super.controller,
    super.maxLines,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.cursorColor = Colors.black,
    super.enabled,
    TextStyle? style,
    String? label,
    String? hintText,
  }) : super(
          style: style ?? const RegularTextStyle(),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const RegularTextStyle(),
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hintText,
            hintStyle: const RegularTextStyle().copyWith(color: Colors.black38),
            filled: enabled == false,
            fillColor: Colors.black.withOpacity(0.05),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black45, width: 0.5),
              borderRadius: BorderRadius.zero,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black45, width: 0.5),
              borderRadius: BorderRadius.zero,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.zero,
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade200, width: 0.5),
              borderRadius: BorderRadius.zero,
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.zero,
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0.5),
              borderRadius: BorderRadius.zero,
            ),
          ),
        );
}
