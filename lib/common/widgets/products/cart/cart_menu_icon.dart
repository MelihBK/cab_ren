import 'package:cab_ren/features/shop/controllers/product/cart_controller.dart';
import 'package:cab_ren/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.iconColor,
    this.counterByColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterByColor, counterTextColor;

  @override
  Widget build(BuildContext context) {

    // Get an instance of the CartController
    final controller = Get.put(CartController());

    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: counterByColor ?? (dark ? TColors.white : TColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Obx(
                  () => Text(
                      controller.noOfCartItems.value.toString(),
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: counterTextColor ?? (dark ? TColors.black : TColors.white),
                          fontSizeFactor: 0.8,
                      ),
                  ),
                ),
            ),
          ),
        ),
      ],
    );
  }
}

