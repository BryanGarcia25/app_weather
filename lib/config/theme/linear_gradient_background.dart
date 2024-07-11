
import 'package:flutter/material.dart';

final date = DateTime.now();

LinearGradient linearGradientBackground() {
  if (date.hour > 6) {
    return const LinearGradient(
      colors: [
        Color(0xFF2c84e4),
        Color(0xFF65bef5),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter
    );
  } else {
    return const LinearGradient(
      colors: [
        Color(0xFF162355),
        Color(0xFF1c368a),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter
    );
  }
}