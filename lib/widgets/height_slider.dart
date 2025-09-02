import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Height: ${height.toStringAsFixed(0)} cm",
            style: const TextStyle(fontSize: 20, color: Colors.white)),
        Slider(
          value: height,
          min: 100,
          max: 220,
          activeColor: Colors.tealAccent,
          inactiveColor: Colors.white38,
          divisions: 120,
          label: "${height.toStringAsFixed(0)} cm",
          onChanged: onChanged,
        ),
      ],
    );
  }
}
