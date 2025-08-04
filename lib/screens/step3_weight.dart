import 'package:flutter/material.dart';

class Step3Weight extends StatefulWidget {
  final int weight;
  final String weightUnit;
  final int height;
  final String heightUnit;
  final void Function(int weight, String weightUnit) onChanged;

  const Step3Weight({
    Key? key,
    required this.weight,
    required this.weightUnit,
    required this.height,
    required this.heightUnit,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<Step3Weight> createState() => _Step3WeightState();
}

class _Step3WeightState extends State<Step3Weight> {
  late int weight;
  late String weightUnit;

  @override
  void initState() {
    super.initState();
    weight = widget.weight;
    weightUnit = widget.weightUnit;
  }

  void setWeight(int newWeight) {
    setState(() {
      weight = newWeight;
    });
    widget.onChanged(weight, weightUnit);
  }

  void setWeightUnit(String newUnit) {
    setState(() {
      if (weightUnit != newUnit) {
        if (newUnit == 'kg') {
          weight = (weightUnit == 'lbs') ? (weight * 0.453592).round() : weight;
        } else {
          weight = (weightUnit == 'kg') ? (weight / 0.453592).round() : weight;
        }
        weightUnit = newUnit;
        // Clamp weight to valid range for new unit
        int minW = newUnit == 'kg' ? 30 : 66;
        int maxW = newUnit == 'kg' ? 150 : 330;
        if (weight < minW) weight = minW;
        if (weight > maxW) weight = maxW;
      }
    });
    widget.onChanged(weight, weightUnit);
  }

  String get weightLabel {
    if (weightUnit == 'kg') {
      if (weight > 80) return 'heavy';
      if (weight > 60) return 'average';
      return 'light';
    } else {
      if (weight > 176) return 'heavy';
      if (weight > 132) return 'average';
      return 'light';
    }
  }

  int get minWeight => weightUnit == 'kg' ? 30 : 66;
  int get maxWeight => weightUnit == 'kg' ? 150 : 330;
  List<int> get quickSelects => weightUnit == 'kg' ? [60, 70, 80, 90] : [130, 155, 175, 200];

  double get bmi {
    double heightInM = widget.heightUnit == 'cm'
        ? widget.height / 100
        : (widget.height * 2.54) / 100;
    double weightInKg = weightUnit == 'kg'
        ? weight.toDouble()
        : weight * 0.453592;
    return weightInKg / (heightInM * heightInM);
  }

  String get bmiLabel {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Weight Icon and Title
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
                  Icons.monitor_weight,
                  color: const Color(0xFF10b981),
                  size: 44,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'WEIGHT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Complete your body metrics for better recommendations',
              style: TextStyle(color: Colors.grey, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 28),
        // Unit Selection
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => setWeightUnit('kg'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: weightUnit == 'kg'
                      ? const Color(0xFF10b981)
                      : Colors.white10,
                  foregroundColor: weightUnit == 'kg' ? Colors.white : Colors.white,
                  elevation: weightUnit == 'kg' ? 6 : 0,
                  shadowColor: weightUnit == 'kg' ? const Color(0x4010b981) : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: weightUnit == 'kg' ? const Color(0xFF10b981) : Colors.white24,
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                ),
                child: const Text('Kg', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () => setWeightUnit('lbs'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: weightUnit == 'lbs'
                      ? const Color(0xFF10b981)
                      : Colors.white10,
                  foregroundColor: weightUnit == 'lbs' ? Colors.white : Colors.white,
                  elevation: weightUnit == 'lbs' ? 6 : 0,
                  shadowColor: weightUnit == 'lbs' ? const Color(0x4010b981) : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: weightUnit == 'lbs' ? const Color(0xFF10b981) : Colors.white24,
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                ),
                child: const Text('Lbs', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Weight Input Area
        Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          child: Column(
            children: [
              // Current Weight Display
              Column(
                children: [
                  Text(
                    '$weight',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    weightUnit,
                    style: const TextStyle(
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
                          weightLabel,
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
              // Weight Controls
              Row(
                children: [
                  // Decrement
                  IconButton(
                    onPressed: () => setWeight(
                        weight > minWeight ? weight - 1 : minWeight),
                    icon: const Icon(Icons.remove, color: Colors.white, size: 28),
                    padding: const EdgeInsets.all(0),
                    constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                    splashRadius: 28,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF10b981),
                        inactiveTrackColor: Colors.white24,
                        thumbColor: const Color(0xFF10b981),
                        overlayColor: const Color(0x3310b981),
                        trackHeight: 6,
                      ),
                      child: Slider(
                        min: minWeight.toDouble(),
                        max: maxWeight.toDouble(),
                        value: weight.toDouble(),
                        onChanged: (v) => setWeight(v.round()),
                      ),
                    ),
                  ),
                  // Increment
                  IconButton(
                    onPressed: () => setWeight(
                        weight < maxWeight ? weight + 1 : maxWeight),
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
                    children: quickSelects.map((w) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () => setWeight(w),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: weight == w ? const Color(0xFF10b981) : Colors.white10,
                          foregroundColor: weight == w ? Colors.white : Colors.white,
                          elevation: weight == w ? 6 : 0,
                          shadowColor: weight == w ? const Color(0x4010b981) : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: weight == w ? const Color(0xFF10b981) : Colors.white24,
                              width: 1.5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: Text('$w', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // BMI Preview Card
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0x1A10b981), Color(0x1A14b8a6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0x3310b981)),
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Your BMI Preview',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Based on your height and weight',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(color: Color(0xFF10b981), fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    bmiLabel,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
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
                      'Personalized Workouts',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Your weight helps us calculate calorie burn and recommend appropriate exercise intensities for optimal results.',
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