import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;
  double bmi = 22.0; // Default BMI value, will be updated dynamically.
  String bmiCategory = "Normal"; // Initial BMI Category
  Color selectedGenderColor = Colors.transparent; // For gender selection

  // BMI calculator function
  void calculateBMI() {
    double heightInMeters = height / 100; // Convert height to meters
    bmi = weight / (heightInMeters * heightInMeters); // BMI formula

    // Categorize BMI
    if (bmi < 18.5) {
      bmiCategory = "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      bmiCategory = "Normal weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      bmiCategory = "Overweight";
    } else {
      bmiCategory = "Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white, // Background color
            child: Column(
              children: [
                // Gender Selection Row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGenderColor = Colors.blue; // Male selected
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.male,
                              size: 120,
                              color: selectedGenderColor == Colors.blue
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            Text("Male", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(), // Takes maximum available space
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGenderColor = Colors.pink; // Female selected
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 120,
                              color: selectedGenderColor == Colors.pink
                                  ? Colors.pink
                                  : Colors.black,
                            ),
                            Text("Female", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40), // Add spacing between the rows
                // Height and Weight Adjustment Row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "Height",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "$height cm",
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                          ),
                          // Buttons for height adjustment
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height > 50) {
                                      height--;
                                      calculateBMI(); // Recalculate BMI
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove, // Icon for decreasing
                                  size: 20,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.blue,
                              ),
                              const SizedBox(width: 10), // Add spacing
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height < 250) {
                                      height++;
                                      calculateBMI(); // Recalculate BMI
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.add, // Icon for increasing
                                  size: 20,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(), // Takes maximum available space
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "$weight kg",
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                          // Buttons for weight adjustment
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 30) {
                                      weight--;
                                      calculateBMI(); // Recalculate BMI
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove, // Icon for decreasing
                                  size: 20,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.blue,
                              ),
                              const SizedBox(width: 10), // Add spacing
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 300) {
                                      weight++;
                                      calculateBMI(); // Recalculate BMI
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.add, // Icon for increasing
                                  size: 20,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    const Text(
                      "BMI",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        bmi.toStringAsFixed(2), // Display BMI dynamically
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bmiCategory, // Display BMI category dynamically
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
