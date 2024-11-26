import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';
import 'package:online_cosmetics_store/ui/pages/catalog/frame/products_for_skin_type_frame.dart';

class WithTypesFrame extends StatelessWidget {
  static const routeName = '/WithTypesFrame';
  const WithTypesFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'По типу кожи',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.pushNamed(ProductsForSkinTypeFrame.routeName);
                },
                child: const Text(
                  'Жирная',
                  style: AppTextTheme.title_16_semiBold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Комбинированная',
                style: AppTextTheme.title_16_semiBold,
              ),
              const SizedBox(height: 16),
              const Text(
                'Нормальная',
                style: AppTextTheme.title_16_semiBold,
              ),
              const SizedBox(height: 16),
              const Text(
                'Сухая',
                style: AppTextTheme.title_16_semiBold,
              ),
              const SizedBox(height: 16),
              const Text(
                'Любой тип',
                style: AppTextTheme.title_16_semiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
