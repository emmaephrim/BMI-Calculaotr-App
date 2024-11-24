import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({required this.title, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double weight = 0.0;
  double height = 0.0;
  double bmi = 0.0;
  String advice = "";

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  void calculateBMI() {
    setState(() {
      if (weight > 0 && height > 0) {
        bmi = weight / (height * height);
        if (bmi < 18.5) {
          advice = "underweight: You should gain some weight";
        } else if (bmi >= 18.5 && bmi < 25) {
          advice = "Normal weight: You're doing great!";
        } else if (bmi >= 25 && bmi < 30) {
          advice = "Overweight: Consider exercising.";
        } else {
          advice = "Obese: Consult a doctor.";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Weight (kg)",
              ),
              onChanged: (value) {
                weight = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Height (m)",
              ),
              onChanged: (value) {
                height = double.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  calculateBMI();
                  print("The bmi is: $bmi");
                },
                child: const Text("Calculate")),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Your Bmi is ${bmi.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            advice != ""
                ? Text(
                    advice,
                    style: const TextStyle(color: Colors.blueGrey, fontSize: 18),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
