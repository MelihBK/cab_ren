import 'package:cab_ren/common/widgets/brands/brand_card.dart';
import 'package:cab_ren/common/widgets/products/sortable/sortable_products.dart';
import 'package:cab_ren/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:cab_ren/features/shop/controllers/brand_controller.dart';
import 'package:cab_ren/features/shop/models/brand_model.dart';
import 'package:cab_ren/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  /// Handle Loader, No Record or Error Message
                 const loader = TVerticalProductShimmer();
                 final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                 if (widget != null) return widget;

                 /// Record Found!
                  final brandProducts = snapshot.data!;
                  return  TSortableProducts(products: brandProducts);
                }
              ),
            ],
          ),
          ),
        ),
    );
  }
}
