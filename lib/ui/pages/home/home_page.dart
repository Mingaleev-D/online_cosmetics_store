import 'package:flutter/material.dart';
import 'package:online_cosmetics_store/core/utils/app_const.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';
import 'package:online_cosmetics_store/ui/pages/home/widgets/care_item.dart';
import 'package:online_cosmetics_store/ui/pages/home/widgets/category_ittem.dart';
import 'package:online_cosmetics_store/ui/pages/home/widgets/effect_grid.dart';
import 'package:online_cosmetics_store/ui/pages/home/widgets/image_slider.dart';
import 'package:online_cosmetics_store/ui/pages/home/widgets/product_item.dart';
import 'package:online_cosmetics_store/ui/pages/home/widgets/rectangle_common.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Контроллер для PageView
  final PageController _pageController = PageController();

  // Текущая страница
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose(); // Не забывайте освобождать контроллер
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Получаем размеры доступного пространства
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;

          // Вычисляем отступы как проценты от размеров экрана
          final double topPadding = screenHeight * 0.05; // 5% от высоты
          final double leftPadding = screenWidth * 0.04; // 4% от ширины

          // Вычисляем высоту слайдера в зависимости от ширины экрана
          final double sliderHeight = screenWidth > 800 ? screenHeight * 0.6 : screenHeight * 0.4;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Слайдер с индикаторами в верхнем левом углу
                ImageSlider(
                  height: sliderHeight,
                  imgSlider: imgSlider,
                  pageController: _pageController,
                  currentPage: _currentPage,
                  topPadding: topPadding,
                  leftPadding: leftPadding,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
                const SizedBox(height: 16),
                //
                // Категории
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: categories.map((category) {
                      return CategoryItem(
                        imageUrl: category['image']!,
                        title: category['title']!,
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 16),

                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Новинки',
                        style: AppTextTheme.title_20_semiBold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      RectangleLightGreen(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                SizedBox(
                  height: 288,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: products.map((product) {
                      return ProductItem(
                        imageUrl: product['image']!,
                        title: product['title']!,
                        description: product['description']!,
                        price: product['price']!,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                //
                // Схема домашнего ухода
                Container(
                  height: 248,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/contan_backg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text('Моя схема домашнего ухода', style: AppTextTheme.title_16_bold),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 120, // Высота списка схемы ухода
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: careScheme.map((care) {
                            return CareItem(
                              imageUrl: care['image']!,
                              title: care['title']!,
                            );
                          }).toList(),
                        ),
                      ),
                      // const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  'Ответьте на 10 вопросов, и мы подберем нужный уход',
                                  style: AppTextTheme.title_13_medium,
                                ),
                              ),
                            ),
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
                              child: Text('Пройти тест'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                //
                // акции
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Акции',
                        style: AppTextTheme.title_20_semiBold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      RectangleLightPink(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 288,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: products1.map((product) {
                      return ProductItem(
                        imageUrl: product['image']!,
                        title: product['title']!,
                        description: product['description']!,
                        price: product['price']!,
                        oldPrice: product['oldPrice'],
                      );
                    }).toList(),
                  ),
                ),
                // const SizedBox(height: 10),

                const SizedBox(
                  width: double.infinity,
                  height: 188,
                  child: EffectGrid(),
                ),

                //  const SizedBox(height: 20),

                //
                // хиты
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Хиты',
                        style: AppTextTheme.title_20_semiBold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      RectangleLightOrange(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 288,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: products2.map((product) {
                      return ProductItem(
                        imageUrl: product['image']!,
                        title: product['title']!,
                        description: product['description']!,
                        price: product['price']!,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
