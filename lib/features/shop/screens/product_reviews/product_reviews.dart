import 'package:cab_ren/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:cab_ren/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:cab_ren/features/shop/screens/product_reviews/widgets/user_review_card2.dart';
import 'package:cab_ren/features/shop/screens/product_reviews/widgets/user_review_card3.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// -- Appbar
      appBar: const TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and reviews and verified '),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text('12.611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard2(),
              const UserReviewCard3(),
            ],
          ),
        ),
      ),
    );
  }
}






