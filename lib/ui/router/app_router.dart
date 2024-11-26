import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_cosmetics_store/ui/pages/catalog/catalog_page.dart';
import 'package:online_cosmetics_store/ui/pages/catalog/frame/filters_frame.dart';
import 'package:online_cosmetics_store/ui/pages/catalog/frame/products_for_skin_type_frame.dart';
import 'package:online_cosmetics_store/ui/pages/catalog/frame/with_types_frame.dart';
import 'package:online_cosmetics_store/ui/pages/home/home_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root_page');
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorCatalogVideosKey = GlobalKey<NavigatorState>(debugLabel: 'catalog');
final _shellNavigatorBasketKey = GlobalKey<NavigatorState>(debugLabel: 'basket');
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: HomePage.routeName,
  routes: [
    GoRoute(
      path: FiltersFrame.routeName,
      name: FiltersFrame.routeName,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const FiltersFrame(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        //
        //home
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: HomePage.routeName,
              name: HomePage.routeName,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        //
        //catalog
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCatalogVideosKey,
          routes: [
            GoRoute(
              path: CatalogPage.routeName,
              name: CatalogPage.routeName,
              builder: (context, state) => const CatalogPage(),
            ),
            GoRoute(
              path: WithTypesFrame.routeName,
              name: WithTypesFrame.routeName,
              builder: (context, state) => const WithTypesFrame(),
            ),
            GoRoute(
              path: ProductsForSkinTypeFrame.routeName,
              name: ProductsForSkinTypeFrame.routeName,
              builder: (context, state) => const ProductsForSkinTypeFrame(),
            ),
          ],
        ),
      ],
    ),
  ],
  // errorBuilder: (context, state) {},
  redirect: (context, state) {
    return null;
  },
);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: navigationShell.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Главная',
            icon: imageWidget(
              image: 'assets/House.png',
              color: Colors.grey,
            ),
            activeIcon: imageWidget(
              image: 'assets/House.png',
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Каталог',
            icon: imageWidget(
              image: 'assets/MagnifyingGlass.png',
              color: Colors.grey,
            ),
            activeIcon: imageWidget(
              image: 'assets/MagnifyingGlass.png',
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Корзина',
            icon: imageWidget(
              image: 'assets/ShoppingCartSimple.png',
              color: Colors.grey,
            ),
            activeIcon: imageWidget(
              image: 'assets/ShoppingCartSimple.png',
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: imageWidget(
              image: 'assets/User.png',
              color: Colors.grey,
            ),
            activeIcon: imageWidget(
              image: 'assets/User.png',
              color: Colors.black,
            ),
          ),
          // BottomNavigationBarItem(
        ],
        onTap: _goBranch,
      ),
    );
  }
}

Widget imageWidget({required String image, required Color color}) {
  return SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      image,
      fit: BoxFit.contain,
      color: color,
      colorBlendMode: BlendMode.srcIn,
    ),
  );
}
