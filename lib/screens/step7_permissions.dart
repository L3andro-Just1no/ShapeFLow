import 'package:flutter/material.dart';
// Removed: import 'package:lucide_icons/lucide_icons.dart';

class Step7Permissions extends StatelessWidget {
  final Map<String, bool> formData;
  final Function(Map<String, bool>) setFormData;

  const Step7Permissions({
    Key? key,
    required this.formData,
    required this.setFormData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Permissions Icon and Title
        Center(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.green.withOpacity(0.3)),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PERMISSIONS & CONDITIONS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Data usage and privacy',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),

        // Description
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Before we get started, we'd like to let you know how we handle your data and get your permission to use it.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),

        // Permissions Checkboxes
        Column(
          children: [
            // Privacy Policy - Required
            _buildCheckbox(
              context,
              'I agree to the Privacy Policy',
              'Required to use the app and understand how we protect your data.',
              formData['privacyPolicy'] ?? false,
              (checked) => setFormData({...formData, 'privacyPolicy': checked ?? false}),
              true,
            ),

            // Health Data Consent - Required
            _buildCheckbox(
              context,
              'I consent to the use of my health and fitness data',
              'Allows us to personalize workouts and track your fitness progress.',
              formData['healthDataConsent'] ?? false,
              (checked) => setFormData({...formData, 'healthDataConsent': checked ?? false}),
              true,
            ),

            // Marketing Updates - Optional
            _buildCheckbox(
              context,
              'I agree to receive occasional updates and tips',
              'Get fitness tips, new features, and motivational content via email.',
              formData['marketingUpdates'] ?? false,
              (checked) => setFormData({...formData, 'marketingUpdates': checked ?? false}),
              false,
            ),
          ],
        ),

        // Security Info Card
        _buildInfoCard(
          context,
          'Your Data is Secure',
          'All your personal and health data is encrypted and stored securely. We never share your information with third parties without your explicit consent.',
          icon: Icons.lock_outline,
        ),

        // Info Card
        _buildInfoCard(
          context,
          'Why We Need This',
          'These permissions allow us to create personalized workout plans, track your progress, and provide the best possible fitness experience tailored to your goals.',
          icon: Icons.info_outline,
        ),
      ],
    );
  }

  Widget _buildCheckbox(BuildContext context, String title, String subtitle, bool isChecked, void Function(bool?) onChanged, bool isRequired) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onChanged,
            activeColor: Colors.green,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          if (isRequired)
            const Text(
              'Required',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String description, {IconData? icon}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, color: Colors.green, size: 20),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}