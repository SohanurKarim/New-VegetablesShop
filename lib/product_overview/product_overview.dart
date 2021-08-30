import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodtest0/config/color.dart';
import 'dart:ui';

import 'package:foodtest0/provider/wish_list_provider.dart';
import 'package:foodtest0/screens/review_cart/review_cart.dart';
import 'package:foodtest0/widget/count.dart';
import 'package:provider/provider.dart';

enum SingingCharacter { lafayette, jefferson }

class ProductOverview extends StatefulWidget {
  // const ProductOverview({Key? key, productName, productImage}) : super(key: key);

  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  // final int productQuantity;
  ProductOverview(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice});

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  Widget bottomNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    VoidCallback? onTop,
  }) {
    return Expanded(
     //flex: 1,
      child: GestureDetector(
        onTap: onTop,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Text(
                title,
                style: TextStyle(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;

  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                 // if(value.exists){
                    setState(
                            () {
                          wishListBool = value.get("wishList");
                        }
                    ),
                //  }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Add to WishList",
              iconData: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              onTop: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                if (wishListBool == true) {
                  wishListProvider.addwishListData(
                    wishListId: widget.productId,
                    wishListName: widget.productName,
                    wishListImage: widget.productImage,
                    wishListPrice: widget.productPrice,
                    wishListQuantity: 2,
                  );
                }
                else{
                  wishListProvider.deleteWishList(widget.productId);
                }
              }),
          bottomNavigatorBar(
            backgroundColor: primaryColor,
            color: textColor,
            iconColor: Colors.white70,
            title: "Go to Cart",
            iconData: Icons.shop_outlined,
            onTop: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReviewCart(),
                ),
              );
            }
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Product Overview',
          style: TextStyle(color: textColor),
        ),
      ),
      body: ListView(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text(
                      "\$${widget.productPrice}",
                      // style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(widget.productImage),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Option",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              activeColor: Colors.green[700],
                              value: SingingCharacter.lafayette,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "\$${widget.productPrice}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Spacer(),
                        Count(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          //  productQuantity: "1",
                        ),

                        //Here Changed By Myself

                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 30,
                        //     vertical: 10,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.grey),
                        //     borderRadius: BorderRadius.circular(30),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.add,
                        //         size: 15,
                        //         color: primaryColor,
                        //       ),
                        //       Text(
                        //         "ADD",
                        //         style: TextStyle(
                        //           color: primaryColor,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About This Product",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Produce is a generalized term for many farm-produced crops, including fruits and vegetables. More specifically, the term produce often implies that the products are fresh and generally in the same state as where and when they were harvested",
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                      textAlign: TextAlign.justify),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
