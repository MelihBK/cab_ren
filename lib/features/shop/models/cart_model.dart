import 'cart_item_model.dart';

class CartModel {
  String cartId; // Define cartId
  List<CartItemModel> items; // Define items

  // Constructor with named parameters
  CartModel({
    required this.cartId,
    required this.items,
  });

}
  /*String productId;
  String variation;
  String quantity;
  String title;
  String image;
  String brandName;
  String price;
  String selectedVariation;

  CartModel({
    required this.productId,
    required this.variation,
    required this.quantity,
    required this.title,
    required this.image,
    required this.brandName,
    required this.price,
    required this.selectedVariation,
  });

  /// Empty Helper Function
  static CartModel empty() => CartModel(productId: '', variation: '', quantity: '',title: '', image: '',brandName:'',price: '',selectedVariation:'');

  /// Convert model to Json structure so that you can store data in Firestore
  Map<String ,dynamic> toJson() {
    return {
      'productId' : productId,
      'variation' : variation,
      'quantity' : quantity,
      'title' : title,
      'image' : image,
      'brandName': brandName,
      'price': price,
      'selectedVariation': selectedVariation,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory CartModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to Model
      return CartModel(
        productId: data['productId'],
        variation: data['variation'] ?? '',
        quantity: data['quantity'],
        title: data['title'],
        image: data['image'],
        brandName: data['brandName'],
        price: data['price'],
        selectedVariation: data['selectedVariation'],
      );
    }else {
      return CartModel.empty();
    }
  }
} */