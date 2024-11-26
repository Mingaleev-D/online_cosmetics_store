import 'package:flutter/material.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final Image? icon;
  final VoidCallback? onTap;

  const CategoryTile({super.key, required this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextTheme.title_20_semiBold,
            ),
            if (icon != null) const SizedBox(width: 8),
            if (icon != null) icon!,
          ],
        ),
      ),
    );
  }
}
