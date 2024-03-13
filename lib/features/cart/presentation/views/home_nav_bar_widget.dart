import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
<<<<<<< HEAD:lib/features/cart/presentation/views/home_nav_bar_widget.dart
import 'package:dalel/features/cart/presentation/views/bazar_view.dart';
import 'package:dalel/features/cart/presentation/views/home_view.dart';
=======
import 'package:dalel/features/cart/presentaion/views/cart_view.dart';
>>>>>>> 49a80b322d2256ac550411453c0d3de5affffaad:lib/features/cart/presentaion/views/home_nav_bar_widget.dart
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentaion/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

<<<<<<< HEAD:lib/features/cart/presentation/views/home_nav_bar_widget.dart
=======
import '../../../cart/presentaion/views/home_view.dart';
>>>>>>> 49a80b322d2256ac550411453c0d3de5affffaad:lib/features/cart/presentaion/views/home_nav_bar_widget.dart

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
<<<<<<< HEAD:lib/features/cart/presentation/views/home_nav_bar_widget.dart
    const BazarView(),
=======
    const CartView(),
>>>>>>> 49a80b322d2256ac550411453c0d3de5affffaad:lib/features/cart/presentaion/views/home_nav_bar_widget.dart
    const SearchView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.imagesHomeIconActive),
      inactiveIcon: SvgPicture.asset(Assets.imagesHomeIcon),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.imagesShoppingCartActive),
      inactiveIcon: SvgPicture.asset(Assets.imagesShoppingCart),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.imagesSearchActive),
      inactiveIcon: SvgPicture.asset(Assets.imagesSearch),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.imagesPersonActive),
      inactiveIcon: SvgPicture.asset(Assets.imagesPerson),
    ),
  ];
}
