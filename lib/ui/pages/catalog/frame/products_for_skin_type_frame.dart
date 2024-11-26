import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_cosmetics_store/core/utils/app_const.dart';
import 'package:online_cosmetics_store/ui/components/app_theme/app_text_theme.dart';
import 'package:online_cosmetics_store/ui/pages/catalog/frame/filters_frame.dart';
import 'package:online_cosmetics_store/ui/pages/home/widgets/product_item.dart';

class ProductsForSkinTypeFrame extends StatefulWidget {
  static const routeName = '/ProductsForSkinTypeFrame';

  const ProductsForSkinTypeFrame({super.key});

  @override
  State<ProductsForSkinTypeFrame> createState() => _ProductsForSkinTypeFrameState();
}

class _ProductsForSkinTypeFrameState extends State<ProductsForSkinTypeFrame> {
  int _selectedFilterIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Средства  для жирной кожи',
              style: AppTextTheme.title_20_semiBold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  '28 продуктов',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      context.pushNamed(FiltersFrame.routeName);
                    },
                    child: Image.asset('assets/FadersHorizontal.png'))
              ],
            ),
          ),

          const SizedBox(height: 16),
          // Фильтры
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16.0 : 8.0,
                    right: index == _filters.length - 1 ? 16.0 : 8.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   _selectedFilterIndex = index;
                      // });
                    },
                    child: FilterButton(
                      label: _filters[index],
                      isSelected: _selectedFilterIndex == index,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),
          // Список продуктов
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(
                left: 10,
              ),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                // crossAxisSpacing: 1.1,
                // mainAxisSpacing: 0.1,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItem(
                  imageUrl: product['image']!,
                  title: product['title']!,
                  description: product['description']!,
                  price: product['price']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> _filters = [
  'Очищение',
  'Увлажнение',
  'Регенерация',
];

// Виджет для отображения продукта
class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const ProductCard({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterButton({required this.label, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
