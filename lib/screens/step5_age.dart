import 'package:flutter/material.dart';

class Step5Age extends StatelessWidget {
  final int age;
  final void Function(int age) onChanged;

  const Step5Age({
    Key? key,
    required this.age,
    required this.onChanged,
  }) : super(key: key);

  String getAgeCategory(int age) {
    if (age < 18) return "teen";
    if (age < 25) return "young adult";
    if (age < 35) return "adult";
    if (age < 45) return "mature adult";
    if (age < 55) return "middle-aged";
    if (age < 65) return "active senior";
    return "senior";
  }

  String getAgeCategoryColor(int age) {
    if (age < 25) return "text-blue-400";
    if (age < 45) return "text-emerald-400";
    if (age < 65) return "text-yellow-400";
    return "text-purple-400";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Age Icon and Title
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0x3310b981),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0x4D10b981)),
              ),
              child: Center(
                child: Icon(
                  Icons.accessibility,
                  color: const Color(0xFF10b981),
                  size: 44,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'AGE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Tailor workouts to your life stage',
              style: TextStyle(color: Colors.grey, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 28),
        // Age Input Area
        Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          child: Column(
            children: [
              // Current Age Display
              Column(
                children: [
                  Text(
                    '$age',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  const Text(
                    'years old',
                    style: TextStyle(
                      color: Color(0xFF10b981),
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0x3310b981),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle, color: Color(0xFF10b981), size: 18),
                        const SizedBox(width: 6),
                        Text(
                          getAgeCategory(age),
                          style: const TextStyle(
                            color: Color(0xFF10b981),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Age Controls
              Row(
                children: [
                  // Decrement
                  IconButton(
                    onPressed: () => onChanged(age > 13 ? age - 1 : 13),
                    icon: const Icon(Icons.remove, color: Colors.white, size: 28),
                    padding: const EdgeInsets.all(0),
                    constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                    splashRadius: 28,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Slider(
                      min: 13,
                      max: 100,
                      value: age.toDouble(),
                      onChanged: (value) => onChanged(value.round()),
                      activeColor: const Color(0xFF10b981),
                      inactiveColor: Colors.white24,
                    ),
                  ),
                  // Increment
                  IconButton(
                    onPressed: () => onChanged(age < 100 ? age + 1 : 100),
                    icon: const Icon(Icons.add, color: Colors.white, size: 28),
                    padding: const EdgeInsets.all(0),
                    constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                    splashRadius: 28,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Quick Select
              Column(
                children: [
                  const Text('Quick Select:', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [18, 25, 30, 40].map((ageValue) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => onChanged(ageValue),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: age == ageValue ? const Color(0xFF10b981) : Colors.white10,
                            foregroundColor: age == ageValue ? Colors.white : Colors.white,
                            elevation: age == ageValue ? 6 : 0,
                            shadowColor: age == ageValue ? const Color(0x4010b981) : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: age == ageValue ? const Color(0xFF10b981) : Colors.white24,
                                width: 1.5,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                          child: Text('$ageValue', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Info Card
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0x3310b981),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.info_outline, color: Color(0xFF10b981), size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Age-Specific Recommendations',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Your age helps us recommend safe, effective exercises and set realistic goals that match your life stage and recovery needs.',
                      style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}   