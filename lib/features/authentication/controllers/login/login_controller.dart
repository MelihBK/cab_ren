import 'package:cab_ren/data/repositories/authentication/authentication_repository.dart';
import 'package:cab_ren/utils/popups/full_screen_loader.dart';
import 'package:cab_ren/utils/popups/loaders.dart';
import 'package:cab_ren/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/constants/image_strings.dart';
import '../user/user_controller.dart';

class LoginController extends GetxController {

  /// Variables
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
    // Start loading
    TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Form Validation
    if (!loginFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
    }

    // Sava Data if Remember Me is selected
    if (rememberMe.value) {
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
    }

    // Login user using Email & Password Authentication
    final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

    // Remove Loader
    TFullScreenLoader.stopLoading();

    // Redirect
    AuthenticationRepository.instance.screenRedirect();
  } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}