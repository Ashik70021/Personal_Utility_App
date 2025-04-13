import 'package:flutter/material.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String selectedGender = 'Male';
  double height = 170;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 99, 158, 224),
      ),
      backgroundColor: const Color.fromARGB(255, 227, 228, 233),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gender selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                genderCard("Male", Icons.male),
                genderCard("Female", Icons.female),
              ],
            ),
            const SizedBox(height: 20),

            // Height slider
            Container(
              decoration: containerDecoration(),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Height",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "${height.toStringAsFixed(1)} cm",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 250,
                    activeColor: const Color.fromARGB(255, 192, 202, 80),
                    inactiveColor: Colors.grey,
                    onChanged: (val) {
                      setState(() {
                        height = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Weight input
            Container(
              decoration: containerDecoration(),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Weight",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "$weight kg",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      weightButton(Icons.remove, () {
                        setState(() {
                          if (weight > 1) weight--;
                        });
                      }),
                      const SizedBox(width: 20),
                      weightButton(Icons.add, () {
                        setState(() {
                          weight++;
                        });
                      }),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Calculate Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 99, 158, 224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  double bmi = weight / ((height / 100) * (height / 100));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(bmi: bmi),
                    ),
                  );
                },
                child: const Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderCard(String gender, IconData icon) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade800,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              gender,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: const Color(0xFF1D1E33),
      borderRadius: BorderRadius.circular(16),
    );
  }

  Widget weightButton(IconData icon, VoidCallback onPressed) {
    return FloatingActionButton(
      heroTag: icon.toString(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      mini: true,
      onPressed: onPressed,
      child: Icon(icon, color: Colors.black),
    );
  }
}
