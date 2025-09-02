import 'package:flutter/material.dart';

class BMIResultBox extends StatelessWidget {
  final double bmi;

  const BMIResultBox({super.key, required this.bmi});

  String get category {
    if (bmi < 18.5) return "Underweight 😟";
    if (bmi < 24.9) return "Normal 😊";
    if (bmi < 29.9) return "Overweight 😐";
    return "Obese 😵";
  }

  List<Color> get gradientColors {
    if (bmi < 18.5) return [Colors.blue.shade300, Colors.blue.shade700];
    if (bmi < 24.9) return [Colors.green.shade400, Colors.green.shade700];
    if (bmi < 29.9) return [Colors.orange.shade400, Colors.deepOrange.shade600];
    return [Colors.red.shade400, Colors.red.shade900];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(4, 6),
          )
        ],
      ),
      child: Column(
        children: [
          Text("BMI: ${bmi.toStringAsFixed(1)}",
              style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 12),
          Text(
            category,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
