import 'package:flutter/material.dart';
import 'package:online_cosmetics_store/core/utils/app_const.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';

class EffectGrid extends StatelessWidget {
  const EffectGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 10,
          childAspectRatio: 3.5,
        ),
        itemCount: effects.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(
              child: Text(
                effects[index],
                style: AppTextTheme.title_14_semiBold,
              ),
            ),
          );
        },
      ),
    );
  }
}
