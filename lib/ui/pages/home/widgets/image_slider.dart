import 'package:flutter/material.dart';
import 'package:online_cosmetics_store/ui/components/resources/image_const.dart';

class ImageSlider extends StatelessWidget {
  final double height;
  final List<String> imgSlider;
  final PageController pageController;
  final int currentPage;
  final double topPadding;
  final double leftPadding;
  final Function(int) onPageChanged;

  const ImageSlider({
    super.key,
    required this.height,
    required this.imgSlider,
    required this.pageController,
    required this.currentPage,
    required this.topPadding,
    required this.leftPadding,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Адаптивная высота слайдера
      width: double.infinity,
      child: Stack(
        children: [
          // PageView для слайдера
          PageView.builder(
            controller: pageController,
            itemCount: imgSlider.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(imgSlider[index]),
                  ),
                ),
              );
            },
          ),
          // Индикаторы, расположенные в верхнем левом углу с адаптивными отступами
          Positioned(
            top: topPadding,
            left: leftPadding,
            child: Row(
              children: List.generate(imgSlider.length, (index) {
                return GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 12 : 8,
                    height: currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: currentPage == index ? Colors.white : Colors.white70,
                      shape: BoxShape.circle,
                      border:
                          currentPage == index ? Border.all(color: Colors.blue, width: 2) : null,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
