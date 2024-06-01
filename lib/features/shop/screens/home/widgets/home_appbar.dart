import 'package:cab_ren/features/authentication/controllers/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.grey)),
          Obx(() {
            if(controller.profileLoading.value){
              return const TShimmerEffect(width: 80, height: 15);
            }else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white));
            }
          }),
        ],
      ),
      actions: const [
        TCartCounterIcon(iconColor: TColors.white, counterByColor: TColors.black, counterTextColor: TColors.white),
      ],
    );
  }
}

