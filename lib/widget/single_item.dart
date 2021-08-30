import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/widget/count.dart';

class SingleItem extends StatelessWidget {
  // const SingleItem({Key? key}) : super(key: key);

  bool isBool = false;
  bool wishLIst = false;
  String productImage;
  String productName;
  String productId;
  int productPrice;
  int productQuantity;
  VoidCallback? onDelete;

  SingleItem({
    required this.isBool,
    required this.wishLIst,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productId,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  child: Center(
                    child: Image.network(
                        productImage,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "$productPrice\$",
                           // "50\$/ 50 Gram",
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      isBool == false
                          ? GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      // leading: new Icon(Icons.photo),
                                      title: new Text('50 Gram'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      // leading: new Icon(Icons.music_note),
                                      title: new Text('500 Gram'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      //leading: new Icon(Icons.videocam),
                                      title: new Text('1 Kg'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      //leading: new Icon(Icons.share),
                                      title: new Text('5 Kg'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                            child: Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "50 Gram",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: primaryColor,
                                ),
                              )
                            ],
                        ),
                      ),
                          )
                          : Text("50 Gram")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Count(
                          productId: productId,
                          productImage: productImage,
                          productName: productName,
                          productPrice: productPrice,
                          //  productQuantity: "1",
                        )
                  // Container(
                  //   height: 25,
                  //   width: 50,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.grey),
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   child: Center(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Icon(
                  //           Icons.add,
                  //           color: primaryColor,
                  //           size: 20,
                  //         ),
                  //         Text(
                  //           "ADD",
                  //           style: TextStyle(
                  //             color: primaryColor,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                      : Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                    children: [
                        InkWell(
                          onTap: onDelete,
                          child: Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        wishLIst == false
                        ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            height: 25,
                            width: 70,
                            child: Count(
                              productId: productId,
                              productImage: productImage,
                              productName: productName,
                              productPrice: productPrice,
                              //  productQuantity: "1",
                            ),
                          ),
                          // child: Container(
                          //   height: 25,
                          //   width: 70,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.grey),
                          //     borderRadius: BorderRadius.circular(30),
                          //   ),
                          //   child: Center(
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.remove,
                          //           color: primaryColor,
                          //           size: 20,
                          //         ),
                          //         Text(
                          //           "ADD",
                          //           style: TextStyle(
                          //             color: primaryColor,
                          //           ),
                          //         ),
                          //         Icon(
                          //           Icons.add,
                          //           color: primaryColor,
                          //           size: 20,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ):Container(),
                    ],
                  ),
                      ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
    //   Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10),
    //       child: Row(
    //         children: [
    //           Expanded(
    //             child: Container(
    //               height: 90,
    //               child: Center(
    //                 child: Image.network(
    //                     "https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png"),
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: Container(
    //               height: 90,
    //               child: Column(
    //                 mainAxisAlignment: isBool == false
    //                     ? MainAxisAlignment.spaceAround
    //                     : MainAxisAlignment.spaceEvenly,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Text(
    //                         "Product Name",
    //                         style: TextStyle(
    //                           color: textColor,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       Text(
    //                         "50\$/ 50 Gram",
    //                         style: TextStyle(
    //                           color: Colors.grey,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   isBool == false
    //                       ? Container(
    //                           margin: EdgeInsets.only(right: 15),
    //                           padding: EdgeInsets.symmetric(horizontal: 10),
    //                           height: 35,
    //                           decoration: BoxDecoration(
    //                             border: Border.all(color: Colors.grey),
    //                             borderRadius: BorderRadius.circular(30),
    //                           ),
    //                           child: Row(
    //                             children: [
    //                               Expanded(
    //                                 child: Text(
    //                                   "50 Gram",
    //                                   style: TextStyle(
    //                                     color: Colors.grey,
    //                                     fontSize: 15,
    //                                   ),
    //                                 ),
    //                               ),
    //                               Center(
    //                                 child: Icon(
    //                                   Icons.arrow_drop_down,
    //                                   size: 20,
    //                                   color: primaryColor,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         )
    //                       : Text("50 Gram"),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: Container(
    //               height: 100,
    //               padding: isBool == false
    //                   ? EdgeInsets.symmetric(
    //                       horizontal: 15,
    //                       vertical: 32,
    //                     )
    //                   : EdgeInsets.only(left: 10, right: 10),
    //               child: isBool
    //                   ? Container(
    //                       height: 25,
    //                       width: 50,
    //                       decoration: BoxDecoration(
    //                         border: Border.all(color: Colors.grey),
    //                         borderRadius: BorderRadius.circular(30),
    //                       ),
    //                       child: Center(
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Icon(
    //                               Icons.add,
    //                               color: primaryColor,
    //                               size: 20,
    //                             ),
    //                             Text(
    //                               "Add",
    //                               style: TextStyle(
    //                                 color: primaryColor,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     )
    //                   : Column(
    //                       children: [
    //                         Icon(
    //                           Icons.delete,
    //                           size: 30,
    //                           color: Colors.black54,
    //                         ),
    //                         SizedBox(
    //                           height: 5,
    //                         ),
    //                         Container(
    //                           height: 25,
    //                           width: 70,
    //                           decoration: BoxDecoration(
    //                             border: Border.all(color: Colors.grey),
    //                             borderRadius: BorderRadius.circular(30),
    //                           ),
    //                           child: Center(
    //                             child: Row(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 Icon(
    //                                   Icons.add,
    //                                   color: primaryColor,
    //                                   size: 20,
    //                                 ),
    //                                 Text(
    //                                   "Add",
    //                                   style: TextStyle(
    //                                     color: primaryColor,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
