import 'package:cab_ren/common/widgets/login_signup/social_buttons.dart';
import 'package:cab_ren/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(width: TSizes.spaceBtwSections),

                /// Form
                const TSignupForm(),
                const SizedBox(width: TSizes.spaceBtwSections),

                /// Divider
                TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
                const SizedBox(width: TSizes.spaceBtwSections),

                /// Social Buttons
                const TSocialButtons(),
              ],
            ),
          ),
        ),
    );
  }
}

