import 'dart:ui';

extension ColorExtension on Color {
  /// 等价于 Flutter 3.29+ 的 toARGB32()
  int toARGB32Custom() {
    final int a = ((this.a) * 255.0).round() & 0xff;
    final int r = ((this.r) * 255.0).round() & 0xff;
    final int g = ((this.g) * 255.0).round() & 0xff;
    final int b = ((this.b) * 255.0).round() & 0xff;
    return (a << 24) | (r << 16) | (g << 8) | b;
  }

  /// 方便用名词访问：如果运行在支持 toARGB32 的版本可以改用 color.toARGB32()
  int get argb32 => toARGB32Custom();

  /// 十六进制字符串（比如用于序列化）
  String toHex({bool includeAlpha = true}) {
    final int val = includeAlpha ? argb32 : (argb32 & 0x00FFFFFF);
    return val.toRadixString(16).padLeft(includeAlpha ? 8 : 6, '0');
  }
}
