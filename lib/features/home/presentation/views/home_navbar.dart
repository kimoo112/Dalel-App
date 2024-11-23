import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentaion/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../cart/presentation/views/bazar_view.dart';
import '../logic/cubit/historical_cubit.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatefulWidget {
  const HomeNavBarWidget({super.key});

  @override
  State<HomeNavBarWidget> createState() => _HomeNavBarWidgetState();
}

class _HomeNavBarWidgetState extends State<HomeNavBarWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HistoricalCubit>().getHistoricalPeriods();
    context.read<HistoricalCubit>().getHistoricalCharacter();
    context.read<HistoricalCubit>().getHistoricalKings();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      // decoration: const NavBarDecoration(
      //   borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      // ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const BazarView(),
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
