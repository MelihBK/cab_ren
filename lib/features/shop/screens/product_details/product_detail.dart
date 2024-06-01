import 'package:cab_ren/common/widgets/texts/section_heading.dart';
import 'package:cab_ren/features/shop/models/product_model.dart';
import 'package:cab_ren/features/shop/screens/checkout/checkout.dart';
import 'package:cab_ren/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:cab_ren/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:cab_ren/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:cab_ren/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:cab_ren/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:cab_ren/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:cab_ren/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1- Product Image Slider
            TProductImageSlider(product: product),

            /// 2- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share Button
                  const TRatingAndShare(),

                  /// - Price, Title, Stack & Brand
                  TProductMetaData(product: product),

                  /// -- Attribute
                  if(product.productType == ProductType.variable.toString()) TProductAttributes(product: product),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                   ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const TSectionHeading(title: 'Reviews(199)', showActionButton: false),
                           IconButton(icon: const Icon(Iconsax.arrow_right_3,size: 18), onPressed: () => Get.to(() => const ProductReviewsScreen())),
                     ],
                   ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
