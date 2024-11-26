import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';
import 'package:online_cosmetics_store/ui/pages/catalog/frame/with_types_frame.dart';
import 'package:online_cosmetics_store/ui/pages/catalog/widgets/category_tile.dart';
import 'package:online_cosmetics_store/ui/router/app_router.dart';

class CatalogPage extends StatelessWidget {
  static const routeName = '/catalog';
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Поиск',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // Список категорий каталога
                      const CategoryTile(title: 'Назначение'),
                      const CategoryTile(title: 'Тип средства'),
                      CategoryTile(
                        title: 'Тип кожи',
                        onTap: () {
                          context.pushNamed(WithTypesFrame.routeName);
                        },
                      ),
                      const CategoryTile(title: 'Линия косметики'),
                      const CategoryTile(title: 'Наборы'),
                      CategoryTile(
                        title: 'Акции',
                        icon: Image.asset('assets/discaond.png', width: 24, height: 24),
                      ),
                      const CategoryTile(title: 'Консультация с косметологом'),
                    ],
                  ),
                ),
              ),
            ),

            // Блок с предложением пройти тест
            Container(
              height: 168,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/contan_backg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text('Составим схему идеального  домашнего ухода',
                        style: AppTextTheme.title_16_bold),
                    const SizedBox(height: 8),
                    // const SizedBox(height: 16),
                    const Flexible(
                      child: Text(
                        '10 вопросов о вашей коже',
                        style: AppTextTheme.title_13_medium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Логика нажатия на кнопку
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0), // Радиус закругления
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        textStyle: AppTextTheme.title_12_semiBold,
                      ),
                      child: const Text('Пройти тест'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
