import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import 'package:url_launcher/url_launcher.dart';

// FAQ class definition
class FAQ {
  final String question;
  final String answer;

  const FAQ({
    required this.question,
    required this.answer,
  });
}

// List of frequently asked questions
final List<FAQ> adsequorFaqs = [
  FAQ(
    question: 'What services does Adsequor offer?',
    answer: 'Adsequor specializes in Flutter development, Business Intelligence solutions, and IT consulting. We provide cross-platform mobile and web application development, data warehouse design, ETL processes, dashboard development, and strategic IT consulting services.',
  ),
  FAQ(
    question: 'How long has Adsequor been in business?',
    answer: 'Adsequor was founded in 2002 by Romuald Barbe and has been providing high-quality IT services for over 20 years.',
  ),
  FAQ(
    question: 'Do you work with clients internationally?',
    answer: 'Yes, we work with clients across different countries and industries. Our remote collaboration capabilities allow us to deliver excellent results regardless of geographical location.',
  ),
  FAQ(
    question: 'What is your project development process?',
    answer: 'We follow an Agile methodology for most projects, with regular communication and iterative development. Our process typically includes discovery, planning, design, development, testing, deployment, and ongoing support phases.',
  ),
  FAQ(
    question: 'How do you handle project pricing?',
    answer: 'Our pricing models are flexible and can be adapted to the specific needs of each project. We offer fixed-price quotes for well-defined projects and time-and-materials pricing for more dynamic engagements. Please contact us for a personalized quote.',
  ),
];

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;
  String? _submitResult;
  bool _submitSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavBar(currentPage: 'contact'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'We\'d love to hear from you. Get in touch with our team.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Contact info and form
            Padding(
              padding: const EdgeInsets.all(32),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 900) {
                    // Desktop layout
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Contact information
                        Expanded(flex: 2, child: _buildContactInfo(context)),
                        const SizedBox(width: 32),
                        // Contact form
                        Expanded(flex: 3, child: _buildContactForm(context)),
                      ],
                    );
                  } else {
                    // Mobile layout
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildContactInfo(context),
                        const SizedBox(height: 32),
                        _buildContactForm(context),
                      ],
                    );
                  }
                },
              ),
            ),

            // FAQs Section
            Container(
              color: Theme.of(context).colorScheme.surfaceVariant,
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Frequently Asked Questions',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...adsequorFaqs
                      .map((faq) => _buildFaqItem(context, faq))
                      .toList(),
                ],
              ),
            ),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get In Touch',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Feel free to reach out to us using any of the contact methods below or fill out the form and we\'ll get back to you as soon as possible.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),

        // Email
        _buildContactMethod(
          context: context,
          icon: Icons.email_outlined,
          title: 'Email Us',
          value: adsequorProfile.contact['email'] ?? 'contact@adsequor.fr',
          onTap: () async {
            final emailUri = Uri(
              scheme: 'mailto',
              path: adsequorProfile.contact['email'],
            );
            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            }
          },
        ),

        // Location
        _buildContactMethod(
          context: context,
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: adsequorProfile.location,
          onTap: () async {
            final mapsUrl =
                'https://maps.google.com/?q=${Uri.encodeComponent(adsequorProfile.location)}';
            final mapsUri = Uri.parse(mapsUrl);
            if (await canLaunchUrl(mapsUri)) {
              await launchUrl(mapsUri, mode: LaunchMode.externalApplication);
            }
          },
        ),

        // LinkedIn
        _buildContactMethod(
          context: context,
          icon: Icons.link,
          title: 'LinkedIn',
          value:
              adsequorProfile.contact['linkedin'] ??
              'linkedin.com/company/adsequor',
          onTap: () async {
            final linkedInUri = Uri.parse(
              'https://${adsequorProfile.contact['linkedin']}',
            );
            if (await canLaunchUrl(linkedInUri)) {
              await launchUrl(
                linkedInUri,
                mode: LaunchMode.externalApplication,
              );
            }
          },
        ),

        // GitHub
        _buildContactMethod(
          context: context,
          icon: Icons.code,
          title: 'GitHub',
          value: adsequorProfile.contact['github'] ?? 'github.com/adsequor',
          onTap: () async {
            final githubUri = Uri.parse(
              'https://${adsequorProfile.contact['github']}',
            );
            if (await canLaunchUrl(githubUri)) {
              await launchUrl(githubUri, mode: LaunchMode.externalApplication);
            }
          },
        ),
      ],
    );
  }

  Widget _buildContactMethod({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Us a Message',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),

            if (_submitResult != null)
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color:
                      _submitSuccess
                          ? Colors.green.shade50
                          : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:
                        _submitSuccess
                            ? Colors.green.shade300
                            : Colors.red.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      _submitSuccess ? Icons.check_circle : Icons.error,
                      color: _submitSuccess ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        _submitResult!,
                        style: TextStyle(
                          color:
                              _submitSuccess
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _submitResult = null;
                        });
                      },
                    ),
                  ],
                ),
              ),

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Name field
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email field
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter your email address',
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Subject field
                  TextFormField(
                    controller: _subjectController,
                    decoration: const InputDecoration(
                      labelText: 'Subject',
                      hintText: 'What is your message about?',
                      prefixIcon: Icon(Icons.subject),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a subject';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Message field
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      hintText: 'Enter your message here...',
                      prefixIcon: Icon(Icons.message),
                      alignLabelWithHint: true,
                    ),
                    minLines: 5,
                    maxLines: 10,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your message';
                      }
                      if (value.trim().length < 10) {
                        return 'Message is too short';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Submit button
                  ElevatedButton(
                    onPressed:
                        _isSubmitting ? null : () => _submitForm(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child:
                        _isSubmitting
                            ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text('Sending...'),
                              ],
                            )
                            : const Text('Send Message'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(BuildContext context, FAQ faq) {
    return ExpansionTile(
      title: Text(
        faq.question,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(faq.answer, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    // Simulate form submission delay in this demo
    try {
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isSubmitting = false;
        _submitSuccess = true;
        _submitResult =
            'Thank you! Your message has been sent successfully. We\'ll get back to you shortly.';

        // Clear form fields on success
        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();
      });
    } catch (e) {
      setState(() {
        _isSubmitting = false;
        _submitSuccess = false;
        _submitResult =
            'Sorry, there was an error sending your message. Please try again later.';
      });
    }
  }
}
