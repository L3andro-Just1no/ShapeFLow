import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Step6ActivityLevel extends StatelessWidget {
  final String activityLevel;
  final void Function(String activityLevel) onChanged;

  const Step6ActivityLevel({
    Key? key,
    required this.activityLevel,
    required this.onChanged,
  }) : super(key: key);

  static const List<Map<String, dynamic>> activityLevels = [
    {
      'id': 'sedentary',
      'title': 'Sedentary',
      'description': 'Little to no exercise',
      'details': 'Desk job, minimal physical activity',
      'icon': FontAwesomeIcons.chair,
    },
    {
      'id': 'light',
      'title': 'Light',
      'description': 'Light exercise 1-3 days/week',
      'details': 'Occasional walks, light sports',
      'icon': FontAwesomeIcons.personWalking,
    },
    {
      'id': 'moderate',
      'title': 'Moderate',
      'description': 'Moderate exercise 3-5 days/week',
      'details': 'Regular gym sessions, sports',
      'icon': FontAwesomeIcons.dumbbell,
    },
    {
      'id': 'active',
      'title': 'Active',
      'description': 'Heavy exercise 6-7 days/week',
      'details': 'Daily workouts, athletic training',
      'icon': FontAwesomeIcons.fire,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Activity Level Icon and Title
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
              child: const Center(
                child: Icon(
                  FontAwesomeIcons.personRunning,
                  color: Color(0xFF10b981),
                  size: 44,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'ACTIVITY LEVEL',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Your current fitness routine',
              style: TextStyle(color: Colors.grey, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 28),
        // Activity Level Selection
        Column(
          children: activityLevels.map((level) {
            final bool selected = activityLevel == level['id'];
            return GestureDetector(
              onTap: () => onChanged(level['id'] as String),
              child: AnimatedScale(
                scale: selected ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0x3310b981) : Colors.white10,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selected ? const Color(0xFF10b981) : Colors.white24,
                      width: 1.5,
                    ),
                  ),
                  child: ListTile(
                    leading: FaIcon(level['icon'] as IconData, color: selected ? Color(0xFF10b981) : Colors.grey, size: 32),
                    title: Text(
                      level['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          level['description'],
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          level['details'],
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: selected
                        ? const Icon(Icons.check_circle, color: Color(0xFF10b981), size: 28)
                        : null,
                  ),
                ),
              ),
            );
          }).toList(),
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
                      'Accurate Calorie Calculations',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Your activity level helps us calculate your daily calorie needs and recommend appropriate workout intensities for optimal results.',
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