import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodtest0/models/product_models.dart';

class WishListProvider with ChangeNotifier {
  void addwishListData({
    required String wishListId,
    required String wishListName,
    required String wishListImage,
    required int wishListPrice,
    required int wishListQuantity,
    //required bool isAdd,
  }) async {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      "wishListQuantity": wishListQuantity,
      "wishList": true,
    });
  }

  ////////// Get WishList Data ///////////////
  List<ProductModel> wishList = [];
  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productId: element.get("wishListId"),
        productImage: element.get("wishListImage"),
        productName: element.get("wishListName"),
        productPrice: element.get("wishListPrice"),
        //wishListQuantity: element.get("wishListPrice"),
      );
      newList.add(productModel);
      },
    );
    wishList = newList;
    notifyListeners();
  }
 List<ProductModel> get getWishList{
    return wishList;
  }


 /////////////Delete WishList//////////

deleteWishList(wishListId){
 FirebaseFirestore.instance
      .collection("WishList")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("YourWishList")
     .doc(wishListId)
     .delete();
}







}
