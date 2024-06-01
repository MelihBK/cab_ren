import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  /// Empty Helper Function
  //static BannerModel empty() => BannerModel(imageUrl: '', targetScreen: '', active: true);

  /// Convert model to Json structure so that you can store data in Firestore
  Map<String, dynamic> toJson() {
    return {
      'imageUrl' : imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  /*factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!; */
   factory BannerModel.fromSnapshot(DocumentSnapshot  snapshot) {
     final data = snapshot.data() as Map<String, dynamic>;
      // Map JSON Record to Model
      return BannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false,
      );
    //} else {
     //  return BannerModel.empty();
   // }
  }
}
