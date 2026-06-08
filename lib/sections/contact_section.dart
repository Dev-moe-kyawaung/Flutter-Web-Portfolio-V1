import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/neon_button.dart';
import '../widgets/section_shell.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: 'Contact',
      title: 'Let’s build something premium',
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: LayoutBuilder(
          builder: (context, c) {
            final mobile = c.maxWidth < 900;
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: mobile ? c.maxWidth : c.maxWidth * 0.60,
                  child: NeonCard(
                    index: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              decoration: const InputDecoration(
                                labelText: 'အမည်',
                                hintText: 'Your name',
                              ),
                              validator: (v) => (v == null || v.trim().isEmpty) ? 'အမည်ထည့်ပါ' : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: email,
                              decoration: const InputDecoration(
                                labelText: 'အီးမေးလ်',
                                hintText: 'you@example.com',
                              ),
                              validator: (v) => (v == null || !v.contains('@')) ? 'အီးမေးလ်မှန်ကန်စွာထည့်ပါ' : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: message,
                              maxLines: 6,
                              decoration: const InputDecoration(
                                labelText: 'မက်ဆေ့ခ်ျ',
                                hintText: 'Write your message...',
                              ),
                              validator: (v) => (v == null || v.trim().length < 10)
                                  ? 'မက်ဆေ့ခ်ျအနည်းဆုံး စာလုံး 10 လုံးထည့်ပါ'
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            NeonButton(
                              text: 'Send Message',
                              icon: Icons.send_rounded,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('မက်ဆေ့ခ်ျအောင်မြင်စွာပို့ပြီးပါပြီ')),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mobile ? c.maxWidth : c.maxWidth * 0.33,
                  child: Column(
                    children: [
                      NeonCard(
                        index: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Social Links', style: TextStyle(color: AppTheme.yellow, fontWeight: FontWeight.w800)),
                              const SizedBox(height: 12),
                              ...AppData.socialLinks.map(
                                (s) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextButton(
                                    onPressed: () => openUrl(s['url']!),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(s['name']!, style: const TextStyle(color: AppTheme.text)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      NeonCard(
                        index: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Phone', style: TextStyle(color: AppTheme.yellow, fontWeight: FontWeight.w800)),
                              const SizedBox(height: 10),
                              ...AppData.contactPhones
                                  .map((p) => Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: Text(p, style: const TextStyle(color: AppTheme.text)),
                                      ))
                                  .toList(),
                              const SizedBox(height: 8),
                              Text(AppData.contactEmail, style: const TextStyle(color: AppTheme.cyan)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
