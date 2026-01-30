import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Last updated: ${DateTime.now().year}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Introduction',
              'We value your privacy and are committed to protecting your personal information. '
              'This policy outlines how we collect, use, and safeguard your data when you use our travel sharing app.',
            ),
            _buildSection(
              '1. Information We Collect',
              '• Profile information (username, avatar)\n'
              '• Travel posts, photos, and videos you share\n'
              '• Comments and interactions with other users\n'
              '• Usage data and preferences\n'
              '• Device information and IP address\n'
              '• Location data (with your permission)',
            ),
            _buildSection(
              '2. How We Use Your Information',
              '• To provide and improve our services\n'
              '• To personalize your experience\n'
              '• To communicate with you about updates\n'
              '• To ensure platform safety and security\n'
              '• To analyze usage patterns and improve features\n'
              '• To comply with legal obligations',
            ),
            _buildSection(
              '3. Information Sharing',
              'We do not sell your personal information. We may share your data with:\n\n'
              '• Other users (your public profile and posts)\n'
              '• Service providers who help us operate the app\n'
              '• Law enforcement when legally required\n'
              '• With your explicit consent',
            ),
            _buildSection(
              '4. Data Security',
              'We implement appropriate technical and organizational security measures to protect your information, including:\n\n'
              '• Encryption of data in transit and at rest\n'
              '• Regular security assessments\n'
              '• Access controls and authentication\n'
              '• Secure data storage practices',
            ),
            _buildSection(
              '5. Your Rights',
              'You have the right to:\n\n'
              '• Access your personal data\n'
              '• Modify or update your information\n'
              '• Delete your account and data\n'
              '• Export your data\n'
              '• Opt-out of certain data collection\n'
              '• Lodge a complaint with authorities',
            ),
            _buildSection(
              '6. Data Retention',
              'We retain your data for as long as your account is active or as needed to provide services. '
              'When you delete your account, we will delete or anonymize your personal information within 30 days.',
            ),
            _buildSection(
              '7. Children\'s Privacy',
              'Our service is not intended for users under 13 years of age. '
              'We do not knowingly collect personal information from children under 13.',
            ),
            _buildSection(
              '8. Changes to This Policy',
              'We may update this privacy policy from time to time. '
              'We will notify you of significant changes via email or app notification.',
            ),
            _buildSection(
              '9. Contact Us',
              'If you have questions about this privacy policy, please contact us at:\n\n'
              'Email: privacy@hovonaa.com\n',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

