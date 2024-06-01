import 'package:cab_ren/features/shop/models/product_variation_model.dart';
import 'package:cab_ren/routes/routes.dart';
import 'package:cab_ren/utils/constants/enums.dart';
import 'package:cab_ren/utils/constants/image_strings.dart';
import 'features/personalization/models/address_model.dart';
import 'features/personalization/models/user_model.dart';
import 'features/shop/models/banner_model.dart';
import 'features/shop/models/brand_category_model.dart';
import 'features/shop/models/brand_model.dart';
import 'features/shop/models/cart_item_model.dart';
import 'features/shop/models/cart_model.dart';
import 'features/shop/models/category_model.dart';
import 'features/shop/models/order_model.dart';
import 'features/shop/models/product_attribute_model.dart';
import 'features/shop/models/product_category_model.dart';
import 'features/shop/models/product_model.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner7, targetScreen: TRoutes.checkout, active: false),
  ];

  /// -- User
  static final UserModel user = UserModel(
    id: '1',
    username: 'Melih Öztorun',
    firstName: 'Melih',
    lastName: 'Öztorun',
    email: 'mlhoztorun3@gmail.com',
    phoneNumber: '+05300974781',
    profilePicture: TImages.user,
 addresses: [
      AddressModel(
        id: '1',
        name: 'Melih Öztorun',
        phoneNumber: '+905300974781',
        street: 'Street',
        city: 'City',
        state: 'State',
        postalCode: '876665',
        country: 'Turkey',
      ),
      AddressModel(
        id: '6',
        name: 'Mark Will',
        phoneNumber: '+923178059528',
        street: 'Street',
        city: 'City',
        state: 'State',
        postalCode: 'ZZZ',
        country: 'Turkey',
      ),
    ],
  );

  /// -- Cart
  static final CartModel cart = CartModel(
    cartId: '001',
    items: [
      CartItemModel(
        productId: '001',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      CartItemModel(
        productId: '002',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
    ],
  );

  /// -- Order
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 265,
      orderDate: DateTime(2023,09,1),
      deliveryDate: DateTime(2023,09,9),
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      items: cart.items,
      totalAmount: 369,
      orderDate: DateTime(2023,10,2),
      deliveryDate: DateTime(2023,09,9),
    ),
  ];

 /// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelery', image: TImages.jeweleryIcon, isFeatured: true),

    ///subcategories
    CategoryModel(id: '8', image: TImages.sportIcon,name: 'Sport Shoes',parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.sportIcon,name: 'Track suits',parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.sportIcon,name: 'Sports Equipments',parentId: '1', isFeatured: false),

    //furniture


  ];

  /// -- List of all Brand Categories
  static final List<BrandModel> brands = [
    BrandModel(id: '1', name: 'Nike', image: TImages.nikeLogo, isFeatured: true),
    BrandModel(id: '2', name: 'Adidas', image: TImages.adidasLogo, isFeatured: true),
    BrandModel(id: '8', name: 'Kenwood', image: TImages.kenwoodLogo, isFeatured: false),
    BrandModel(id: '9', name: 'IKEA', image: TImages.ikeaLogo, isFeatured: false),
    BrandModel(id: '5', name: 'Apple', image: TImages.appleLogo, isFeatured: true),
    BrandModel(id: '10', name: 'Acer', image: TImages.acerlogo, isFeatured: false),
    BrandModel(id: '3', name: 'Jordan', image: TImages.jordanLogo, isFeatured: true),
    BrandModel(id: '4', name: 'Puma', image: TImages.pumaLogo, isFeatured: true),
    BrandModel(id: '6', name: 'ZARA', image: TImages.zaraLogo, isFeatured: true),
    BrandModel(id: '7', name: 'Samsung', image: TImages.electronicsIcon, isFeatured: false),

  ];

  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),

    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),
    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),

    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),

    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),

    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),

    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),

    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),

    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    //040 after product 005

    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green',
        stock: 15,
        price: 130,
        isFeatured: true,
        thumbnail: TImages.productImage1,
        description: 'tesla',
        brand: BrandModel(id: '1', image: TImages.teslaLogo, name: 'nike', productsCount: 64, isFeatured: true),
        images: [TImages.productImage1, TImages.productImage2, TImages.productImage3, TImages.productImage4],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
  ProductAttributeModel(name: 'Color', values: ['Green','Black','Red']),
  ProductAttributeModel(name: 'Size', values: ['EU30','EY 32','EU 34']),
  ],
    productVariations: [
      ProductVariationModel(
          id: '1', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage1, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
      ProductVariationModel(
          id: '3', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage2, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
      ProductVariationModel(
          id: '4', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage2, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
      ProductVariationModel(
          id: '5', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage2, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
      ProductVariationModel(
          id: '6', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage2, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
    ],
    productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Green',
      stock: 15,
      price: 130,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'tesla',
      brand: BrandModel(id: '1', image: TImages.teslaLogo, name: 'nike', productsCount: 64, isFeatured: true),
      images: [TImages.productImage1, TImages.productImage2, TImages.productImage3, TImages.productImage4],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green','Black','Red']),
        ProductAttributeModel(name: 'Size', values: ['EU30','EY 32','EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage1, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
        ProductVariationModel(
            id: '3', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage2, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
        ProductVariationModel(
            id: '4', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage2, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
        ProductVariationModel(
            id: '5', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage2, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
        ProductVariationModel(
            id: '6', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage2, description: '', attributeValues: {'Color': 'Black', 'Size' : 'EU 34'}),
      ],
      productType: 'ProductType.single',
    ),
  ];
}

