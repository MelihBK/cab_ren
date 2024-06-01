import 'package:cab_ren/features/personalization/controllers/address_controller.dart';
import 'package:cab_ren/features/personalization/screens/address/widgets/single_address.dart';
import 'package:cab_ren/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
              () => FutureBuilder(
                // Use key to refresh
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  /// Helper Function: Handle Loader, No Record, or error message
                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (response != null) return response;

                  final addresses = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) =>
                        TSingleAddress(
                          address: addresses[index],
                          onTap: () => controller.selectedAddress(addresses[index]),
                        ),
                  );
                },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
    );
  }
}
