import 'package:flutter/material.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CategoryItem({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageUrl,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextTheme.title_12_medium,
          ),
        ],
      ),
    );
  }
}
