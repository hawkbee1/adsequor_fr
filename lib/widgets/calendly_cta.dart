import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendlyCta extends StatelessWidget {
  final String title;
  final String description;
  final String calendlyUrl;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData icon;

  const CalendlyCta({
    super.key,
    this.title = 'Schedule an Appointment',
    this.description =
        'Take the first step towards transforming your business with a personalized consultation.',
    this.calendlyUrl = 'https://calendly.com/romuald-barbe/prendre-un-the',
    this.backgroundColor,
    this.textColor,
    this.icon = Icons.calendar_month,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor =
        backgroundColor ??
        Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1);
    final txtColor = textColor ?? Theme.of(context).colorScheme.secondary;

    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: txtColor, size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: txtColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(description, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () async {
                final uri = Uri.parse(calendlyUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              icon: const Icon(Icons.event_available),
              label: const Text('Schedule Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: txtColor,
                foregroundColor:
                    bgColor.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
