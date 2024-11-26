import 'package:flutter/material.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final String? oldPrice;

  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 161.01,
        height: 187.65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                height: 187,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTextTheme.title_12_medium,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                description,
                style: AppTextTheme.title_14_semiBold.copyWith(
                  // height: 0.07,
                  letterSpacing: 0.16,
                ),
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(price, style: AppTextTheme.title_16_semiBold),
                if (oldPrice != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    oldPrice!,
                    style: AppTextTheme.title_16_semiBold.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ],
            )
          ],
        ),
      ),
    );
  }
}
