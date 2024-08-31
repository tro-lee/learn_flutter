import 'package:flutter/material.dart';

Color containerColor(context) {
  return Theme.of(context).colorScheme.primaryContainer;
}

Color onContainerColor(context) {
  return Theme.of(context).colorScheme.onPrimaryContainer;
}

Color middleContainerColor(context) {
  return Color(0xFFEBF1FF);
}

Color topContainerColor(context) {
  return Color(0xFFF5F8FF);
}

Color labelColor(context) {
  return Colors.black45;
}

Color opacityColor50() {
  return Colors.white.withOpacity(0.5);
}
