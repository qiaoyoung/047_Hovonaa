import 'package:flutter/material.dart';

class UserAgreementScreen extends StatelessWidget {
  const UserAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Agreement'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Agreement',
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
              'Welcome to Hovonaa! By using our travel sharing app, you agree to the following terms and conditions. '
              'Please read this agreement carefully before using our services.',
            ),
            _buildSection(
              '1. Acceptance of Terms',
              'By accessing or using Hovonaa, you agree to be bound by this User Agreement and all applicable laws and regulations. '
              'If you do not agree with any part of these terms, you may not use our services.',
            ),
            _buildSection(
              '2. User Conduct',
              'You agree to:\n\n'
              '• Be respectful to other users\n'
              '• Share authentic travel experiences\n'
              '• Not post inappropriate, offensive, or harmful content\n'
              '• Respect intellectual property rights\n'
              '• Not engage in spam or fraudulent activities\n'
              '• Not impersonate others or misrepresent your identity\n'
              '• Comply with all applicable laws and regulations',
            ),
            _buildSection(
              '3. Content Ownership and License',
              '• You retain ownership of content you post on Hovonaa\n'
              '• You grant us a worldwide, non-exclusive license to use, display, and distribute your content\n'
              '• We may use your content for promotional purposes\n'
              '• We reserve the right to remove content that violates our policies\n'
              '• You are responsible for ensuring you have rights to share your content',
            ),
            _buildSection(
              '4. Account Responsibilities',
              '• You must provide accurate information when creating an account\n'
              '• Keep your account credentials secure and confidential\n'
              '• Notify us immediately of any unauthorized access\n'
              '• You are responsible for all activity on your account\n'
              '• You may not sell or transfer your account',
            ),
            _buildSection(
              '5. Prohibited Activities',
              'You must not:\n\n'
              '• Violate any laws or regulations\n'
              '• Harass, threaten, or harm others\n'
              '• Post false or misleading information\n'
              '• Attempt to hack or disrupt our services\n'
              '• Use automated tools without permission\n'
              '• Collect user data without consent\n'
              '• Interfere with other users\' enjoyment of the app',
            ),
            _buildSection(
              '6. Content Guidelines',
              'All content must:\n\n'
              '• Be related to travel and tourism\n'
              '• Not contain violence, hate speech, or discrimination\n'
              '• Not include sexually explicit material\n'
              '• Not promote illegal activities\n'
              '• Respect privacy of others\n'
              '• Not violate copyright or trademarks',
            ),
            _buildSection(
              '7. Service Modifications',
              'We reserve the right to:\n\n'
              '• Modify, suspend, or discontinue services at any time\n'
              '• Change features and functionality\n'
              '• Update these terms with reasonable notice\n'
              '• Remove or modify user content\n'
              '• Suspend or terminate accounts for violations',
            ),
            _buildSection(
              '8. Limitation of Liability',
              'Use of this app is at your own risk. To the fullest extent permitted by law:\n\n'
              '• We are not liable for any damages arising from use of our services\n'
              '• We do not guarantee accuracy of user-generated content\n'
              '• We are not responsible for third-party content or links\n'
              '• Travel decisions are your own responsibility',
            ),
            _buildSection(
              '9. Intellectual Property',
              'The Hovonaa app, including its design, features, and branding, is protected by copyright and trademark laws. '
              'You may not copy, modify, or create derivative works without our permission.',
            ),
            _buildSection(
              '10. Dispute Resolution',
              'Any disputes arising from this agreement will be resolved through:\n\n'
              '• Good faith negotiation\n'
              '• Mediation if negotiation fails\n'
              '• Arbitration or legal proceedings as a last resort\n'
              '• Governed by the laws of [Your Jurisdiction]',
            ),
            _buildSection(
              '11. Termination',
              'We may terminate or suspend your account if you:\n\n'
              '• Violate these terms\n'
              '• Engage in harmful behavior\n'
              '• Request account deletion\n\n'
              'Upon termination, your right to use the app will immediately cease.',
            ),
            _buildSection(
              '12. Contact Us',
              'If you have questions about this User Agreement, please contact us at:\n\n'
              'Email: support@hovonaa.com\n'
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

