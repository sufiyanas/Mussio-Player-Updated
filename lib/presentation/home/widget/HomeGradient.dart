import 'package:flutter/material.dart';

class GardientForHomeScreen extends StatelessWidget {
  GardientForHomeScreen({super.key, required this.childWidget});
  final childWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFff0A0A0A),
            Colors.white24,
          ],
        ),
      ),
      child: childWidget,
    );
  }
}
