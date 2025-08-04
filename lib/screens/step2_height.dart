import 'package:flutter/material.dart';

class Step2Height extends StatefulWidget {
  final int height;
  final String heightUnit;
  final void Function(int height, String heightUnit) onChanged;

  const Step2Height({
    Key? key,
    required this.height,
    required this.heightUnit,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<Step2Height> createState() => _Step2HeightState();
}

class _Step2HeightState extends State<Step2Height> {
  late int height;
  late String heightUnit;

  @override
  void initState() {
    super.initState();
    height = widget.height;
    heightUnit = widget.heightUnit;
  }

  void setHeight(int newHeight) {
    setState(() {
      height = newHeight;
    });
    widget.onChanged(height, heightUnit);
  }

  void setHeightUnit(String newUnit) {
    setState(() {
      if (heightUnit != newUnit) {
        if (newUnit == 'cm') {
          height = (heightUnit == 'inches') ? (height * 2.54).round() : height;
        } else {
          height = (heightUnit == 'cm') ? (height / 2.54).round() : height;
        }
        heightUnit = newUnit;
        // Clamp height to valid range for new unit
        int minH = newUnit == 'cm' ? 100 : 36;
        int maxH = newUnit == 'cm' ? 220 : 84;
        if (height < minH) height = minH;
        if (height > maxH) height = maxH;
      }
    });
    widget.onChanged(height, heightUnit);
  }

  String get heightLabel {
    if (heightUnit == 'cm') {
      if (height > 180) return 'tall';
      if (height > 160) return 'average';
      return 'short';
    } else {
      if (height > 71) return 'tall';
      if (height > 63) return 'average';
      return 'short';
    }
  }

  int get minHeight => heightUnit == 'cm' ? 100 : 36;
  int get maxHeight => heightUnit == 'cm' ? 220 : 84;
  List<int> get quickSelects => heightUnit == 'cm' ? [160, 170, 180, 190] : [60, 66, 72, 78];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Height Icon and Title
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0x3310b981),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0x4D10b981)),
                // backdropBlur is not available in Flutter, but the color simulates it
              ),
              child: Center(
                child: Icon(
                  Icons.height,
                  color: const Color(0xFF10b981),
                  size: 44,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'HEIGHT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Help us personalize your workout experience',
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
                onPressed: () => setHeightUnit('cm'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: heightUnit == 'cm'
                      ? const Color(0xFF10b981)
                      : Colors.white10,
                  foregroundColor: heightUnit == 'cm' ? Colors.white : Colors.white,
                  elevation: heightUnit == 'cm' ? 6 : 0,
                  shadowColor: heightUnit == 'cm' ? const Color(0x4010b981) : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: heightUnit == 'cm' ? const Color(0xFF10b981) : Colors.white24,
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                ),
                child: const Text('Cm', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () => setHeightUnit('inches'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: heightUnit == 'inches'
                      ? const Color(0xFF10b981)
                      : Colors.white10,
                  foregroundColor: heightUnit == 'inches' ? Colors.white : Colors.white,
                  elevation: heightUnit == 'inches' ? 6 : 0,
                  shadowColor: heightUnit == 'inches' ? const Color(0x4010b981) : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: heightUnit == 'inches' ? const Color(0xFF10b981) : Colors.white24,
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                ),
                child: const Text('Inches', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Height Input Area
        Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          child: Column(
            children: [
              // Current Height Display
              Column(
                children: [
                  Text(
                    '$height',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    heightUnit,
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
                        const Icon(Icons.remove_red_eye, color: Color(0xFF10b981), size: 18),
                        const SizedBox(width: 6),
                        Text(
                          heightLabel,
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
              // Height Controls
              Row(
                children: [
                  // Decrement
                  IconButton(
                    onPressed: () => setHeight(
                        height > minHeight ? height - 1 : minHeight),
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
                        min: minHeight.toDouble(),
                        max: maxHeight.toDouble(),
                        value: height.toDouble(),
                        onChanged: (v) => setHeight(v.round()),
                      ),
                    ),
                  ),
                  // Increment
                  IconButton(
                    onPressed: () => setHeight(
                        height < maxHeight ? height + 1 : maxHeight),
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
                    children: quickSelects.map((h) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () => setHeight(h),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: height == h ? const Color(0xFF10b981) : Colors.white10,
                          foregroundColor: height == h ? Colors.white : Colors.white,
                          elevation: height == h ? 6 : 0,
                          shadowColor: height == h ? const Color(0x4010b981) : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: height == h ? const Color(0xFF10b981) : Colors.white24,
                              width: 1.5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: Text('$h', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                      ),
                    )).toList(),
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
                      'Why we need this',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'This helps us calculate your BMI and recommend appropriate workout intensities tailored to your body.',
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