import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/models/product_models.dart';
import 'package:foodtest0/models/review_cart_model.dart';
import 'package:foodtest0/product_overview/product_overview.dart';
import 'package:foodtest0/provider/review_cart_provider.dart';
import 'package:foodtest0/provider/wish_list_provider.dart';
import 'package:foodtest0/widget/single_item.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
//  const ReviewCart({Key? key}) : super(key: key);


  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {

  late WishListProvider wishListProvider;

  showAlertDialog(BuildContext context,ProductModel delete) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "No",
        style: TextStyle(
          color: primaryColor,
        ),
      ),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Yes",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      onPressed:  () {
        wishListProvider.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text("Are you delete WishList Product ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "WishList",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body:wishListProvider.getWishList.isEmpty?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/empty-cart.gif"),
            Text(
                "Your Wishlist is Empty",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8,),
            Text(
              "Create your first wishlist request",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ):ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context,index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(height: 10,),
              SingleItem(
                isBool:true,
                wishLIst: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productUnit: data.productUnit,
                productQuantity:2,
                onDelete:(){
                  showAlertDialog(context, data);
                },
              ),
              // SizedBox(height: 10,),
            ],
          );
        } ,
      ),
    );
  }
}
