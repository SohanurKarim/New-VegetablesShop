import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodtest0/models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {

  //////////// User Cart Data Add IN Fire Base/////
  void addReviewCartData({
    required String cartID,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
    //required bool isAdd,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartID)
        .set(
        {
          "cartID": cartID,
          "cartName": cartName,
          "cartImage": cartImage,
          "cartPrice": cartPrice,
          "cartQuantity": cartQuantity,
          "isAdd":true,
        }
    );
  }


  ////////////// Cart Data Update //////////
  void updateReviewCartData({
    required String cartID,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
    //required bool isAdd,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartID)
        .update(
        {
          "cartID": cartID,
          "cartName": cartName,
          "cartImage": cartImage,
          "cartPrice": cartPrice,
          "cartQuantity": cartQuantity,
          "isAdd":true,
        }
    );
  }

  //////////AddCart Data Print to Review Cart///////
  List<ReviewCartModel>reviewCartDataList = [];

  getReviewCartData() async {
    List<ReviewCartModel>newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .get();
    reviewCartValue.docs.forEach((element) {
      late ReviewCartModel reviewCartModel = ReviewCartModel(
        cartID: element.get("cartID"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }
  List<ReviewCartModel> get getReviewCartDataList{
    return reviewCartDataList;
   }


  ////////////// ReviewCartDeleteFunction //////////////

  reviewCartDataDelete(cartId){
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }


}






