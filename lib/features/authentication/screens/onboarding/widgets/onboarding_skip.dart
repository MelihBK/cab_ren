import 'package:cab_ren/utils/constants/sizes.dart';
import 'package:cab_ren/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../controllers/onboarding/onboarding_controller.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(), child: const Text('skip')),
    );
  }
}
