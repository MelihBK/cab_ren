import 'package:cab_ren/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../screens/password_configuration/reset_password.dart';
class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...',TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) { TFullScreenLoader.stopLoading(); return;}

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password '.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'on Snap', message: e.toString());
    }
  }

  resendPasswordEmail(String email) async {
    try {
        // Start Loading
        TFullScreenLoader.openLoadingDialog('Processing your request...',TImages.docerAnimation);

        // Check Internet Connectivity
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) { TFullScreenLoader.stopLoading(); return;}

        await AuthenticationRepository.instance.sendPasswordResetEmail(email);

        // Remove Loader
        TFullScreenLoader.stopLoading();

        // Show Success Screen
        TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password '.tr);

      } catch (e) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'on Snap', message: e.toString());
      }
  }
}
