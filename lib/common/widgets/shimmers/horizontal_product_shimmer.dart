import 'package:cab_ren/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
        height: 120,
        child: ListView.separated(
          itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              const SizedBox(width: TSizes.spaceBtwItems),
          itemBuilder: (_, __) => const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Image
              TShimmerEffect(width: 120, height: 120),
              SizedBox(width: TSizes.spaceBtwItems),

              /// Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                ],
              ),
            ],
          ),
        ));
  }
}
