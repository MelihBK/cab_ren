import 'package:cab_ren/common/widgets/brands/brand_card.dart';
import 'package:cab_ren/common/widgets/layouts/grid_layout.dart';
import 'package:cab_ren/common/widgets/texts/section_heading.dart';
import 'package:cab_ren/features/shop/controllers/brand_controller.dart';
import 'package:cab_ren/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              /// Brands GRID
              Obx(
                    () {
                  if (brandController.isLoading.value) return const TBrandShimmer();

                  if (brandController.featuredBrands.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data Found',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                      ),
                    );
                  }

                  return TGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return TBrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
