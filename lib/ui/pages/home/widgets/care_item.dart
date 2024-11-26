import 'package:flutter/material.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';

class CareItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CareItem({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.grey[200], // Цвет заглушки для изображения
              width: 80,
              height: 71,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextTheme.title_12_semiBold,
          ),
        ],
      ),
    );
  }
}
