import 'package:flutter/material.dart';

class ReflectionLetterScreen extends StatelessWidget {
  const ReflectionLetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflection Letter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Example Reflection Letter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dear [Therapist Name],',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'I am writing this letter to express my sincere gratitude as we conclude our counseling sessions. Taking a moment to reflect on our time together, I realize just how significant this journey has been for my personal growth.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'When I first started, I felt overwhelmed and unsure of how to navigate my emotions. Through your guidance, patience, and the safe space you provided, I have learned invaluable tools to understand myself better and manage life\'s challenges with greater resilience.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'I particularly appreciate how you helped me reframe my perspective on [specific issue, e.g., anxiety/relationships]. It has made a lasting difference in my daily life.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Thank you for your unwavering support and professional dedication. I feel ready to move forward with the confidence and insights I have gained.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sincerely,',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '[Your Name]',
                    style: TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Placeholder action for copying or sending
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Letter template copied to clipboard!')),
                  );
                },
                icon: const Icon(Icons.copy),
                label: const Text('Copy to Clipboard'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
