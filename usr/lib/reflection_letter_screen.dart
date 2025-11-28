import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReflectionLetterScreen extends StatefulWidget {
  const ReflectionLetterScreen({super.key});

  @override
  State<ReflectionLetterScreen> createState() => _ReflectionLetterScreenState();
}

class _ReflectionLetterScreenState extends State<ReflectionLetterScreen> {
  final TextEditingController _bodyController = TextEditingController();
  String _selectedTemplate = 'General Growth';

  final Map<String, String> _templates = {
    'General Growth': '''Dear [Therapist Name],

I am writing this letter to express my sincere gratitude as we conclude our counseling sessions. Taking a moment to reflect on our time together, I realize just how significant this journey has been for my personal growth.

When I first started, I felt overwhelmed and unsure of how to navigate my emotions. Through your guidance, patience, and the safe space you provided, I have learned invaluable tools to understand myself better and manage life's challenges with greater resilience.

Thank you for your unwavering support and professional dedication. I feel ready to move forward with the confidence and insights I have gained.

Sincerely,
[Your Name]''',
    'Specific Breakthrough': '''Dear [Therapist Name],

As we finish our sessions, I wanted to specifically thank you for helping me work through [Specific Issue/Trauma].

Before our work together, I felt stuck in patterns that I couldn't break. Your ability to help me reframe my perspective and the practical strategies you shared have made a tangible difference in my daily life. I particularly appreciate the moment when we discussed [Specific Insight], which was a turning point for me.

I am leaving therapy feeling more empowered and capable of handling future challenges.

With gratitude,
[Your Name]''',
    'Short & Professional': '''Dear [Therapist Name],

I am writing to thank you for your support and guidance during our time working together.

Our sessions have provided me with the clarity and tools I needed to move forward. I appreciate your professional insight and the safe environment you created for me to explore my thoughts.

I wish you all the best in your practice.

Best regards,
[Your Name]'''
  };

  @override
  void initState() {
    super.initState();
    _bodyController.text = _templates[_selectedTemplate]!;
  }

  @override
  void dispose() {
    _bodyController.dispose();
    super.dispose();
  }

  void _updateTemplate(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedTemplate = newValue;
        _bodyController.text = _templates[newValue]!;
      });
    }
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _bodyController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Letter copied to clipboard!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflection Letter Generator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose a Template',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedTemplate,
                  isExpanded: true,
                  items: _templates.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: _updateTemplate,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Customize Your Letter',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _bodyController,
                maxLines: null,
                minLines: 10,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: InputBorder.none,
                  hintText: 'Edit your letter here...',
                ),
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _copyToClipboard,
                icon: const Icon(Icons.copy),
                label: const Text('Copy to Clipboard'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
