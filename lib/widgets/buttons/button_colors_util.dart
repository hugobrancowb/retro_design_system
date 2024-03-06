part of retro_design_system;

class _ButtonColorsUtil {
  const _ButtonColorsUtil._();

  /// Retorna a cor principal do botão claro de acordo com seu estado atual.
  static Color getLightColor({required bool enabled}) {
    return enabled ? Colors.black : Colors.grey.shade700;
  }

  /// Retorna a cor de fundo do botão claro de acordo com seu estado atual.
  static Color getLightBackground({
    required bool enabled,
    required bool isOutlined,
  }) {
    if (enabled == false) return Colors.grey.shade200;
    return isOutlined ? Colors.white : Colors.transparent;
  }
}
