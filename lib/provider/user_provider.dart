import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodtest0/models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    required User currentUser,
    required String userName,
    required String userImage,
    required String userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }

  /////////////user data get from firebase//////////////
  late UserModel currentData;

  void getUserData() async {
    UserModel userModel;
   var value = await FirebaseFirestore.instance
        .collection("usersData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
      if(value.exists){
        userModel = UserModel(
            userEmail: value.get("userEmail"),
            userImage: value.get("userImage"),
            userName: value.get("userName"),
            userUid: value.get("userUid"),
        );
        currentData = userModel;
        notifyListeners();
      }
  }

  UserModel get currentUserData{
    return currentData;
  }

}