import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleNow extends StatelessWidget {
  const ScheduleNow({super.key});

  @override
  Widget build(BuildContext context) {
    final calendlyUrl = 'https://calendly.com/romuald-barbe/prendre-un-the';

    return ElevatedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(calendlyUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      icon: const Icon(Icons.event_available),
      label: const Text('Schedule Now'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor:
            Theme.of(context).colorScheme.secondary
                        .withValues(alpha: 0.1)
                        .computeLuminance() >
                    0.5
                ? Colors.black
                : Colors.white,
      ),
    );
  }
}
