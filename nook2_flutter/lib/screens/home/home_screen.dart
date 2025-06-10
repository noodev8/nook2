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
                AppConfig.appFullName,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
          ),

          // Gap between header and hero carousel
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),

          // Hero Section Carousel
          _buildHeroCarousel(context),

          // Share Box Section
          SliverToBoxAdapter(
            child: Padding(
              padding: AppSpacing.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShareBoxSection(context),
                  const SizedBox(height: 24),

                  // Section Divider
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Theme.of(context).dividerColor,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // Buffet Options Grid
          _buildBuffetOptionsGrid(context),

          // Business Highlights
          SliverToBoxAdapter(
            child: Padding(
              padding: AppSpacing.screenPadding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  _buildBusinessHighlights(context),
                  const SizedBox(height: 24),
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

  Widget _buildHeroCarousel(BuildContext context) {
    return SliverToBoxAdapter(
      child: _HeroCarouselWidget(),
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
            padding: const EdgeInsets.all(16),
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
                      imagePath: 'assets/images/share_box.jpg',
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
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _buildFeatureChip(context, 'Mixed Sandwiches'),
                    _buildFeatureChip(context, 'Crisps'),
                    _buildFeatureChip(context, 'Picky Bits'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildOptionChip(context, 'Traditional', true),
                    const SizedBox(width: 8),
                    _buildOptionChip(context, 'Vegetarian', false),
                  ],
                ),
                const SizedBox(height: 16),

                // Share Box CTA
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to share box selection
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Order Share Box',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBuffetOptionsGrid(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
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

            // Responsive Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth >= 600 ? 2 : 1;
                final buffetOptions = [
                  {
                    'title': 'Classic Buffet',
                    'price': '£9.90 per head',
                    'description': 'Traditional selection with all the essentials',
                    'features': ['5 Sandwich varieties', 'Selection of Quiche', 'Cocktail Sausages', 'Assortment of Cakes'],
                    'color': colorScheme.primary,
                    'imagePath': 'assets/images/classic.jpg',
                  },
                  {
                    'title': 'Enhanced Buffet',
                    'price': '£10.90 per head',
                    'description': 'Everything in Classic plus premium additions',
                    'features': ['All Classic items', 'Coronation Chicken', 'Vegetable sticks & Dips', 'Cheese & Pineapple'],
                    'color': colorScheme.secondary,
                    'imagePath': 'assets/images/enhanced.jpg',
                  },
                  {
                    'title': 'Deluxe Buffet',
                    'price': '£13.90 per head',
                    'description': 'Premium selection with gourmet options',
                    'features': ['7 Sandwich varieties', 'Wraps included', 'Greek Salad', 'Tomato & Mozzarella Skewers'],
                    'color': const Color(0xFF6A1B9A),
                    'imagePath': 'assets/images/deluxe.jpg',
                  },
                ];

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: crossAxisCount == 2 ? 0.6 : 0.8,
                  ),
                  itemCount: buffetOptions.length,
                  itemBuilder: (context, index) {
                    final option = buffetOptions[index];
                    return _buildBuffetCard(
                      context,
                      title: option['title'] as String,
                      price: option['price'] as String,
                      description: option['description'] as String,
                      features: option['features'] as List<String>,
                      color: option['color'] as Color,
                      imagePath: option['imagePath'] as String,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
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
          fontSize: 11,
        ),
      ),
      backgroundColor: colorScheme.secondaryContainer,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _buildOptionChip(BuildContext context, String label, bool isSelected) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          // TODO: Handle selection
        },
        backgroundColor: isSelected ? colorScheme.primary : colorScheme.surface,
        selectedColor: colorScheme.primary,
        checkmarkColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: isSelected ? colorScheme.primary : colorScheme.outline,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
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
            child: Tooltip(
              message: title,
              child: Icon(
                icon,
                color: colorScheme.primary,
                size: 24,
              ),
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
    required String imagePath,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(12),
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
            // Large buffet image at the top
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BuffetImagePlaceholder(
                buffetType: title.split(' ')[0].toLowerCase(),
                width: double.infinity,
                height: 120,
                borderRadius: BorderRadius.circular(12),
                imagePath: imagePath,
              ),
            ),
            const SizedBox(height: 12),

            // Content below image
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: color.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        price,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: features.take(3).map((feature) => _buildFeatureChip(context, feature)).toList(),
                ),
                const SizedBox(height: 12),

                // Buffet CTA
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to specific buffet selection
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Order $title',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroCarouselWidget extends StatefulWidget {
  @override
  _HeroCarouselWidgetState createState() => _HeroCarouselWidgetState();
}

class _HeroCarouselWidgetState extends State<_HeroCarouselWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final heroImages = [
                'assets/images/hero1.jpg',
                'assets/images/hero2.jpg',
                'assets/images/hero3.jpg',
              ];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BuffetHeroImage(
                    buffetType: 'hero',
                    width: double.infinity,
                    height: 200,
                    imagePath: heroImages[index],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),

        // Page indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentPage == index
                    ? colorScheme.primary
                    : colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
