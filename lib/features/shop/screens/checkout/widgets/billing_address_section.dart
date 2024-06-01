import 'package:cab_ren/common/widgets/texts/section_heading.dart';
import 'package:cab_ren/features/personalization/controllers/address_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () => addressController.selectNewAddressPopup(context)),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Melih', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Text('+90-530-097-47-81', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history, color: Colors.grey, size: 16),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Expanded(
                          child: Text('Istanbul,Umraniye', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
                    ],
                  ),
                ],
              )
            : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
