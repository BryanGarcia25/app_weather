import 'dart:ui';

final date = DateTime.now();

Color backgroundColor() {
  return date.hour <= 6 || date.hour >= 20 ? const Color(0xFF131416) : const Color(0xFFffffff);
}