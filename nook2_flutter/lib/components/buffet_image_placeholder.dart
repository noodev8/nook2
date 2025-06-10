import 'package:flutter/material.dart';

/*
====================================================================================================
Buffet Image Placeholder Component
====================================================================================================
Reusable component for displaying buffet images with fallback placeholders.
Easily replaceable when real images are available.
====================================================================================================
*/

class BuffetImagePlaceholder extends StatelessWidget {
  final String buffetType;
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final String? imagePath; // For future real images

  const BuffetImagePlaceholder({
    super.key,
    required this.buffetType,
    this.width = 80,
    this.height = 80,
    this.borderRadius,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    // Define colors and icons for different buffet types
    Color backgroundColor;
    IconData icon;
    Color iconColor;
    
    switch (buffetType.toLowerCase()) {
      case 'classic':
        backgroundColor = const Color(0xFFE8F5E8);
        icon = Icons.restaurant;
        iconColor = const Color(0xFF2E7D32);
        break;
      case 'enhanced':
        backgroundColor = const Color(0xFFFFF3E0);
        icon = Icons.restaurant_menu;
        iconColor = const Color(0xFFFF8F00);
        break;
      case 'deluxe':
        backgroundColor = const Color(0xFFF3E5F5);
        icon = Icons.star;
        iconColor = const Color(0xFF7B1FA2);
        break;
      case 'share_box':
        backgroundColor = const Color(0xFFE3F2FD);
        icon = Icons.group;
        iconColor = const Color(0xFF1976D2);
        break;
      case 'hero':
        backgroundColor = const Color(0xFFF5F5F5);
        icon = Icons.restaurant_menu;
        iconColor = const Color(0xFF424242);
        break;
      default:
        backgroundColor = colorScheme.surface;
        icon = Icons.fastfood;
        iconColor = colorScheme.primary;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: Border.all(
          color: iconColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: imagePath != null
          ? ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              child: Image.asset(
                imagePath!,
                width: width,
                height: height,
                fit: BoxFit.cover,
                semanticLabel: '${buffetType.replaceAll('_', ' ')} buffet image',
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderContent(icon, iconColor);
                },
              ),
            )
          : _buildPlaceholderContent(icon, iconColor),
    );
  }

  Widget _buildPlaceholderContent(IconData icon, Color iconColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: width * 0.4,
        ),
        if (height > 60) ...[
          const SizedBox(height: 4),
          Text(
            buffetType.toUpperCase(),
            style: TextStyle(
              fontSize: width * 0.12,
              fontWeight: FontWeight.w600,
              color: iconColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

/*
====================================================================================================
Buffet Hero Image Component
====================================================================================================
Larger image component for hero sections and detailed views
====================================================================================================
*/

class BuffetHeroImage extends StatelessWidget {
  final String buffetType;
  final double width;
  final double height;
  final String? imagePath;

  const BuffetHeroImage({
    super.key,
    required this.buffetType,
    this.width = double.infinity,
    this.height = 200,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Define gradient colors for different buffet types
    List<Color> gradientColors;
    IconData icon;
    
    switch (buffetType.toLowerCase()) {
      case 'classic':
        gradientColors = [
          const Color(0xFF2E7D32),
          const Color(0xFF4CAF50),
        ];
        icon = Icons.restaurant;
        break;
      case 'enhanced':
        gradientColors = [
          const Color(0xFFFF8F00),
          const Color(0xFFFFC107),
        ];
        icon = Icons.restaurant_menu;
        break;
      case 'deluxe':
        gradientColors = [
          const Color(0xFF7B1FA2),
          const Color(0xFF9C27B0),
        ];
        icon = Icons.star;
        break;
      case 'share_box':
        gradientColors = [
          const Color(0xFF1976D2),
          const Color(0xFF2196F3),
        ];
        icon = Icons.group;
        break;
      default:
        gradientColors = [
          colorScheme.primary,
          colorScheme.primary.withValues(alpha: 0.7),
        ];
        icon = Icons.fastfood;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: imagePath != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath!,
                width: width,
                height: height,
                fit: BoxFit.cover,
                semanticLabel: '${buffetType.replaceAll('_', ' ')} hero image',
                errorBuilder: (context, error, stackTrace) {
                  return _buildHeroPlaceholderContent(theme, icon, gradientColors[0]);
                },
              ),
            )
          : _buildHeroPlaceholderContent(theme, icon, gradientColors[0]),
    );
  }

  Widget _buildHeroPlaceholderContent(ThemeData theme, IconData icon, Color primaryColor) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 8),
          Text(
            buffetType.toUpperCase(),
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            'Image Placeholder',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
