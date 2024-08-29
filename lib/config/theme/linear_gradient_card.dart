import 'package:flutter/material.dart';

LinearGradient linearGradientCard(String icon) {
  if (icon.contains('d')) {
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