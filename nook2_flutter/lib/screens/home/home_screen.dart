import 'package:flutter/material.dart';
import '../../config/app_config.dart';
import '../../styles/spacing.dart';
import '../../components/buffet_image_placeholder.dart';

/*
====================================================================================================
Home Screen for The Nook of Welshpool
====================================================================================================
Main landing page featuring:
- Hero banner with welcome message
- Share Box option (1-4 people)
- Three buffet options (Classic, Enhanced, Deluxe) for 5+ people
- Business highlights and call-to-action
====================================================================================================
*/

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with business name
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                AppConfig.appName,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
          ),

          // Main content
          SliverToBoxAdapter(
            child: Padding(
              padding: AppSpacing.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Section
                  _buildHeroSection(context),
                  const SizedBox(height: 32),

                  // Share Box Section
                  _buildShareBoxSection(context),
                  const SizedBox(height: 32),

                  // Buffet Options Section
                  _buildBuffetOptionsSection(context),
                  const SizedBox(height: 32),

                  // Business Highlights
                  _buildBusinessHighlights(context),
                  const SizedBox(height: 32),

                  // Call to Action
                  _buildCallToAction(context),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: _buildBottomNavigation(context),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onPrimary.withValues(alpha: 0.9),
              ),
            ),
            Text(
              AppConfig.appFullName,
              style: theme.textTheme.displayMedium?.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppConfig.tagline,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onPrimary.withValues(alpha: 0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareBoxSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Perfect for Small Groups',
          style: theme.textTheme.headlineLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 4,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.secondary.withValues(alpha: 0.1),
                  colorScheme.secondary.withValues(alpha: 0.05),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BuffetImagePlaceholder(
                      buffetType: 'share_box',
                      width: 60,
                      height: 60,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Share Box',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Daily mix for 1-4 people',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildFeatureChip(context, 'Mixed Sandwiches'),
                    _buildFeatureChip(context, 'Crisps'),
                    _buildFeatureChip(context, 'Picky Bits'),
                    _buildFeatureChip(context, 'Pork Pie & Quiche'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildOptionChip(context, 'Traditional', true),
                    const SizedBox(width: 8),
                    _buildOptionChip(context, 'Vegetarian', false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBuffetOptionsSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Buffet Options',
          style: theme.textTheme.headlineLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Available for 5 or more people',
          style: theme.textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 16),

        // Classic Buffet
        _buildBuffetCard(
          context,
          title: 'Classic Buffet',
          price: '£9.90 per head',
          description: 'Traditional selection with all the essentials',
          features: ['5 Sandwich varieties', 'Selection of Quiche', 'Cocktail Sausages', 'Assortment of Cakes'],
          color: colorScheme.primary,
          imagePlaceholder: 'classic_buffet.jpg',
        ),
        const SizedBox(height: 16),

        // Enhanced Buffet
        _buildBuffetCard(
          context,
          title: 'Enhanced Buffet',
          price: '£10.90 per head',
          description: 'Everything in Classic plus premium additions',
          features: ['All Classic items', 'Coronation Chicken', 'Vegetable sticks & Dips', 'Cheese & Pineapple'],
          color: colorScheme.secondary,
          imagePlaceholder: 'enhanced_buffet.jpg',
        ),
        const SizedBox(height: 16),

        // Deluxe Buffet
        _buildBuffetCard(
          context,
          title: 'Deluxe Buffet',
          price: '£13.90 per head',
          description: 'Premium selection with gourmet options',
          features: ['7 Sandwich varieties', 'Wraps included', 'Greek Salad', 'Tomato & Mozzarella Skewers'],
          color: const Color(0xFF6A1B9A),
          imagePlaceholder: 'deluxe_buffet.jpg',
        ),
      ],
    );
  }

  Widget _buildBusinessHighlights(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHighlightItem(
                context,
                icon: Icons.local_shipping,
                title: 'Collection & Delivery',
                subtitle: 'Your choice',
              ),
              _buildHighlightItem(
                context,
                icon: Icons.eco,
                title: 'Recyclable Packaging',
                subtitle: 'Eco-friendly',
              ),
              _buildHighlightItem(
                context,
                icon: Icons.restaurant,
                title: 'Fresh Ingredients',
                subtitle: 'Daily prepared',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Navigate to buffet selection
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'View All Buffets',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.6),
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Buffets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
    );
  }

  Widget _buildFeatureChip(BuildContext context, String label) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Chip(
      label: Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSecondaryContainer,
        ),
      ),
      backgroundColor: colorScheme.secondaryContainer,
      side: BorderSide.none,
    );
  }

  Widget _buildOptionChip(BuildContext context, String label, bool isSelected) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        // TODO: Handle selection
      },
      backgroundColor: colorScheme.surface,
      selectedColor: colorScheme.primary.withValues(alpha: 0.2),
      checkmarkColor: colorScheme.primary,
      labelStyle: theme.textTheme.bodyMedium?.copyWith(
        color: isSelected ? colorScheme.primary : colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  Widget _buildHighlightItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBuffetCard(
    BuildContext context, {
    required String title,
    required String price,
    required String description,
    required List<String> features,
    required Color color,
    required String imagePlaceholder,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withValues(alpha: 0.05),
              color.withValues(alpha: 0.02),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Buffet image placeholder
                BuffetImagePlaceholder(
                  buffetType: title.split(' ')[0], // Extract 'Classic', 'Enhanced', 'Deluxe'
                  width: 80,
                  height: 80,
                  borderRadius: BorderRadius.circular(8),
                  // imagePath: imagePlaceholder, // Uncomment when real images are available
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        price,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: features.map((feature) => Chip(
                label: Text(
                  feature,
                  style: theme.textTheme.bodySmall,
                ),
                backgroundColor: color.withValues(alpha: 0.1),
                side: BorderSide.none,
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
