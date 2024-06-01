import 'package:cab_ren/features/personalization/screens/settings/settings.dart';
import 'package:cab_ren/features/shop/screens/store/store.dart';
import 'package:cab_ren/features/shop/screens/wishlist/wishlist.dart';
import 'package:cab_ren/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'shop/screens/home/home.dart';
import '../utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: /* Obx(
        () =>*/ NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: 0,
        onDestinationSelected: (index) => controller.selectIndex.value = index,
        backgroundColor: darkMode ? TColors.black : Colors.white,
        indicatorColor:  darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),

        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
   /* ), */
      body: Obx(() => controller.screens[controller.selectIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectIndex = 0.obs;

  final screens = [
     const HomeScreen(),
     const StoreScreen(),
     const FavouriteScreen(),
     const SettingsScreen(),
  ];
}