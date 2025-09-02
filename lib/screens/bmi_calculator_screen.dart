import 'package:flutter/material.dart';
import '../widgets/height_slider.dart';
import '../widgets/weight_slider.dart';
import '../widgets/bmi_result_box.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _height = 170;
  double _weight = 65;

  double get _bmi => _weight / ((_height / 100) * (_height / 100));

  void _reset() {
    setState(() {
      _height = 170;
      _weight = 65;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "BMI Calculator",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 40),

                // Height slider widget
                HeightSlider(
                  height: _height,
                  onChanged: (value) => setState(() => _height = value),
                ),

                const SizedBox(height: 30),

                // Weight slider widget
                WeightSlider(
                  weight: _weight,
                  onChanged: (value) => setState(() => _weight = value),
                ),

                const SizedBox(height: 50),

                // BMI result widget
                BMIResultBox(bmi: _bmi),

                const Spacer(),

                ElevatedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text("Reset", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
