import 'package:flutter/material.dart';
import 'package:adsequor_fr/models/service.dart';
import 'package:adsequor_fr/screens/contact_screen.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';

class ServicesScreen extends StatefulWidget {
  final int initialIndex;

  const ServicesScreen({super.key, this.initialIndex = 0});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavBar(currentPage: 'services'),
      body: Column(
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
                  'Our Services',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Adsequor provides expert technology services to help your business succeed.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white.withAlpha(230),
                  ),
                ),
              ],
            ),
          ),

          // Service navigation tabs
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(
                  adsequorServices.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(adsequorServices[index].title),
                      selected: _currentIndex == index,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _currentIndex = index;
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          });
                        }
                      },
                      backgroundColor: Colors.white,
                      selectedColor: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.2),
                      labelStyle: TextStyle(
                        color:
                            _currentIndex == index
                                ? Theme.of(context).colorScheme.primary
                                : null,
                        fontWeight:
                            _currentIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Service detail content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: adsequorServices.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: _buildServiceDetail(
                          context,
                          adsequorServices[index],
                        ),
                      ),

                      // Footer
                      const AppFooter(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentIndex > 0)
              TextButton.icon(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous Service'),
              )
            else
              const SizedBox(),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ContactScreen()),
                  ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
              child: const Text('Contact Us'),
            ),
            if (_currentIndex < adsequorServices.length - 1)
              TextButton.icon(
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                label: const Text('Next Service'),
                icon: const Icon(Icons.arrow_forward),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceDetail(BuildContext context, Service service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Service title and icon
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Image.asset(
                  service.imageUrl,
                  width: 48,
                  height: 48,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.business,
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                service.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Service description
        Text(service.description, style: Theme.of(context).textTheme.bodyLarge),

        const SizedBox(height: 32),

        // Service capabilities
        Text(
          'What we offer:',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Capabilities list
        ...service.features.map(
          (capability) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capability,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getCapabilityDescription(capability),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Call to action
        Card(
          elevation: 4,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ready to get started?',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Contact us today to discuss your project requirements and how we can help you achieve your goals with our ${service.title} services.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ContactScreen(),
                        ),
                      ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Request a Consultation'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Generate placeholder descriptions for capabilities
  String _getCapabilityDescription(String capability) {
    // In a real app, these would be proper descriptions from the backend
    return 'Our expertise in $capability enables us to deliver top-notch solutions tailored to your specific business needs.';
  }
}
