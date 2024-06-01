import 'package:cab_ren/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(
          () {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                /// Cart Items
                TCartItem(cartItem: item),
                if (showAddRemoveButtons)
                  const SizedBox(height: TSizes.spaceBtwItems),

                /// Add Remove Button  Row with total price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// Extra Space
                        const SizedBox(width: 70),

                        /// Add Remove Buttons
                        TProductQuantityWithAddRemoveButton(
                            quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                            remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    /// Product total price
                    TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
