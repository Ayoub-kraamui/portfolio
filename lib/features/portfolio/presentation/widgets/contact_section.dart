import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../shared/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const SectionTitle(title: AppStrings.contactTitle),
          const SizedBox(height: 20),
          Text(
            'Feel free to reach out to me for collaboration or just a friendly hello!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              CustomButton(
                label: 'Email Me',
                icon: Icons.email,
                onPressed: () => _launchUrl('mailto:${AppStrings.email}'),
                isOutline: true,
              ),
              CustomButton(
                label: 'LinkedIn',
                icon: FontAwesomeIcons.linkedin,
                onPressed: () => _launchUrl('https://${AppStrings.linkedin}'),
                isOutline: true,
              ),
              CustomButton(
                label: 'Call Me',
                icon: Icons.phone,
                onPressed: () => _launchUrl('tel:${AppStrings.phone}'),
                isOutline: true,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            '© 2026 ${AppStrings.heroName}. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
