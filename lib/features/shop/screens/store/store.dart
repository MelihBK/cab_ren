import 'package:cab_ren/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:cab_ren/common/widgets/appbar/appbar.dart';
import 'package:cab_ren/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:cab_ren/common/widgets/layouts/grid_layout.dart';
import 'package:cab_ren/common/widgets/shimmers/brands_shimmer.dart';
import 'package:cab_ren/common/widgets/texts/section_heading.dart';
import 'package:cab_ren/features/shop/controllers/brand_controller.dart';
import 'package:cab_ren/features/shop/controllers/category_controller.dart';
import 'package:cab_ren/features/shop/screens/brand/all_brands.dart';
import 'package:cab_ren/features/shop/screens/brand/brand_products.dart';
import 'package:cab_ren/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
            TCartCounterIcon(iconColor: null),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      TSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(const AllBrandsScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      Obx(() {
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
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return TBrandCard(
                              showBorder: true,
                              brand: brand,
                              onTap: () => Get.to(() => BrandProducts(brand: brand)),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
                bottom: TTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
