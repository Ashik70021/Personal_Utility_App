import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen({super.key, required this.bmi});

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 24.9) return "Normal";
    if (bmi < 29.9) return "Overweight";
    return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    final category = getBMICategory(bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 99, 158, 224),
      ),
      backgroundColor: const Color.fromARGB(255, 236, 236, 246),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your BMI is:",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                bmi.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 0, 0),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Category: $category",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 40),

              // Recalculate Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Go back to InputScreen
                  },
                  child: const Text(
                    "Recalculate",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

