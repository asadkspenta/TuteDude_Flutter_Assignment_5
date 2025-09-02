import 'package:flutter/material.dart';

class WeightSlider extends StatelessWidget {
  final double weight;
  final ValueChanged<double> onChanged;

  const WeightSlider({
    super.key,
    required this.weight,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Weight: ${weight.toStringAsFixed(0)} kg",
            style: const TextStyle(fontSize: 20, color: Colors.white)),
        Slider(
          value: weight,
          min: 30,
          max: 150,
          activeColor: Colors.tealAccent,
          inactiveColor: Colors.white38,
          divisions: 120,
          label: "${weight.toStringAsFixed(0)} kg",
          onChanged: onChanged,
        ),
      ],
    );
  }
}
