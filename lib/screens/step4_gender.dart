import 'package:flutter/material.dart';

class Step4Gender extends StatelessWidget {
  final String gender;
  final void Function(String gender) onChanged;

  const Step4Gender({
    Key? key,
    required this.gender,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Gender Icon and Title
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
                  Icons.wc,
                  color: const Color(0xFF10b981),
                  size: 44,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'GENDER',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Help us customize your fitness experience',
              style: TextStyle(color: Colors.grey, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 28),
        // Gender Selection Options
        Column(
          children: [
            // Male and Female Row
            Row(
              children: [
                Expanded(
                  child: _genderButton(
                    context,
                    label: 'Male',
                    value: 'male',
                    icon: Icons.male,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _genderButton(
                    context,
                    label: 'Female',
                    value: 'female',
                    icon: Icons.female,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Other Option
            _genderButton(
              context,
              label: 'Other',
              value: 'other',
              icon: Icons.transgender,
              fullWidth: true,
            ),
            const SizedBox(height: 12),
            // Prefer Not to Say Option
            _genderButton(
              context,
              label: 'Prefer Not to Say',
              value: 'prefer-not-to-say',
              icon: Icons.privacy_tip,
              fullWidth: true,
            ),
          ],
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
                      'Privacy & Inclusivity',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'This information helps us provide gender-specific fitness recommendations and calorie calculations. Your privacy is our priority.',
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

  Widget _genderButton(BuildContext context, {required String label, required String value, required IconData icon, bool fullWidth = false}) {
    final bool selected = gender == value;
    return AnimatedScale(
      scale: selected ? 1.05 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton.icon(
        onPressed: () => onChanged(value),
        icon: Icon(icon, size: 28, color: selected ? Colors.white : Colors.white),
        label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        style: ElevatedButton.styleFrom(
          minimumSize: fullWidth ? const Size.fromHeight(56) : const Size(0, 56),
          backgroundColor: selected ? const Color(0xFF10b981) : Colors.white10,
          foregroundColor: selected ? Colors.white : Colors.white,
          elevation: selected ? 6 : 0,
          shadowColor: selected ? const Color(0x4010b981) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: selected ? const Color(0xFF10b981) : Colors.white24,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}