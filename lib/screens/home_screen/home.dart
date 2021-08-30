import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/product_overview/product_overview.dart';
import 'package:foodtest0/provider/proudct_provider.dart';
import 'package:foodtest0/provider/user_provider.dart';
import 'package:foodtest0/screens/home_screen/drawer_side.dart';
import 'package:foodtest0/screens/home_screen/single_product.dart';
import 'package:foodtest0/screens/review_cart/review_cart.dart';
import 'package:foodtest0/search/search.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  // Widget singalProducts(){
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 5,),
  //     height: 230,
  //     width: 160,
  //     decoration: BoxDecoration(
  //       color: Color(0xffd9dad9),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           flex: 2,
  //           child: Image.network(
  //               'https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png'),
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(
  //               horizontal: 10,
  //               vertical: 5,
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Fresh Basli',
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 Text(
  //                   '50\$/50 Gram',
  //                   style: TextStyle(
  //                     color: Colors.grey,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child: Container(
  //                         padding: EdgeInsets.only(left: 5),
  //                         height: 30,
  //                         width: 50,
  //                         decoration: BoxDecoration(
  //                           border: Border.all(
  //                             color: Colors.grey,
  //                           ),
  //                           // color: Colors.black,
  //                           borderRadius: BorderRadius.circular(9),
  //                         ),
  //                         child: Row(
  //                           children: [
  //                             Expanded(
  //                               child: Text(
  //                                 '50 Gram',
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: Icon(
  //                                 Icons.arrow_drop_down,
  //                                 color: Colors.yellow,
  //                                 size: 20,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 5,
  //                     ),
  //                     Expanded(
  //                       child: Container(
  //                         height: 30,
  //                         width: 50,
  //                         decoration: BoxDecoration(
  //                           border: Border.all(
  //                             color: Colors.grey,
  //                           ),
  //                           //color: Colors.red,
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         child: Row(
  //                           mainAxisAlignment:
  //                           MainAxisAlignment.center,
  //                           children: [
  //                             Icon(
  //                               Icons.remove,
  //                               size: 15,
  //                               color: Color(0xffd0b84c),
  //                             ),
  //                             Text(
  //                               '1',
  //                               style: TextStyle(
  //                                 color: Color(0xffd0b84c),
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                             Icon(
  //                               Icons.add,
  //                               size: 15,
  //                               color: Color(0xffd0b84c),
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ProductProvider productProvider;

  Widget _buildVegetablesProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fresh Vegetables',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>Search(
                            search: productProvider.getvegetablesProductDataList,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Icon(
                      Icons.arrow_forward_ios_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getvegetablesProductDataList
                .map(
                  (vegetablesProductData) {
                    return SingleProduct(
                      productPrice: vegetablesProductData.productPrice,
                      productImage: vegetablesProductData.productImage,
                      productName: vegetablesProductData.productName,
                      productId: vegetablesProductData.productId,
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:(context) => ProductOverview(
                                productId:vegetablesProductData.productId,
                                productPrice: vegetablesProductData.productPrice,
                                productName: vegetablesProductData.productName,
                                productImage: vegetablesProductData.productImage,
                              ),
                            )
                        );
                      },
                    );
                  },
            )
             .toList(),
          ),
        ),
      ],
    );
  }
  Widget _buildFruitProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fresh Fruits',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>Search(
                            search: productProvider.getfruitsProductDataList,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getfruitsProductDataList
                .map(
                  (fruitsProductData) {
                return SingleProduct(
                  productPrice: fruitsProductData.productPrice,
                  productImage: fruitsProductData.productImage,
                  productName: fruitsProductData.productName,
                  productId: fruitsProductData.productId,
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:(context) => ProductOverview(
                            productId: fruitsProductData.productId,
                            productPrice: fruitsProductData.productPrice,
                            productName: fruitsProductData.productName,
                            productImage: fruitsProductData.productImage,
                          ),
                        )
                    );
                  },
                );
              },
            )
              .toList(),

          ),
        ),
      ],
    );
  }
  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fresh Herbs',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>Search(
                            search: productProvider.getherbsProductDataList,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getherbsProductDataList
                .map(
                  (herbsProductData) {
                return SingleProduct(
                  productPrice: herbsProductData.productPrice,
                  productImage: herbsProductData.productImage,
                  productName: herbsProductData.productName,
                  productId: herbsProductData.productId,
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:(context) => ProductOverview(
                            productId: herbsProductData.productId,
                            productPrice: herbsProductData.productPrice,
                            productName: herbsProductData.productName,
                            productImage: herbsProductData.productImage,
                          ),
                        )
                    );
                  },
                );
              },
            )
                .toList(),
            // children: [
            //   SingleProduct(
            //       productImage: 'https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png',
            //       productName: "Fresh Basli",
            //       onTap: (){
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //               builder:(context) => ProductOverview(
            //                 productName: "Fresh Basli",
            //                 productImage: "https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png",
            //               ),
            //           )
            //         );
            //       },
            //   ),
            //   SingleProduct(
            //     productImage: 'https://www.freepnglogos.com/uploads/broccoli-png/broccoli-organic-live-and-crops-owners-association-nigeria-26.png',
            //     productName: "Fresh Borkli",
            //     onTap: (){
            //       Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder:(context) => ProductOverview(
            //               productName: "Fresh Borkli",
            //               productImage: 'https://www.freepnglogos.com/uploads/broccoli-png/broccoli-organic-live-and-crops-owners-association-nigeria-26.png',
            //             ),
            //           )
            //       );
            //     },
            //   ),
            //   SingleProduct(
            //     productImage: 'https://freepngimg.com/thumb/categories/2972.png',
            //     productName: "Fresh Coli-Flower",
            //     onTap: (){
            //       Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder:(context) => ProductOverview(
            //               productImage: 'https://freepngimg.com/thumb/categories/2972.png',
            //               productName: "Fresh Coli-Flower",
            //             ),
            //           )
            //       );
            //     },
            //   ),
            //   SingleProduct(
            //     productImage: 'https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png',
            //     productName: "Fresh Basli",
            //     onTap: (){
            //       Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder:(context) => ProductOverview(
            //               productName: "Fresh Basli",
            //               productImage: "https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png",
            //             ),
            //           )
            //       );
            //     },
            //   ),
            //   SingleProduct(
            //     productImage: 'https://www.freepnglogos.com/uploads/broccoli-png/broccoli-organic-live-and-crops-owners-association-nigeria-26.png',
            //     productName: "Fresh Borkli",
            //     onTap: (){
            //       Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder:(context) => ProductOverview(
            //               productName: "Fresh Borkli",
            //               productImage: 'https://www.freepnglogos.com/uploads/broccoli-png/broccoli-organic-live-and-crops-owners-association-nigeria-26.png',
            //             ),
            //           )
            //       );
            //     },
            //   ),
            // ],
          ),
        ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       // SingleProduct(
        //       //   productImage: 'https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png',
        //       //   productName: "Fresh Basli",
        //       //   onTap: (){
        //       //     Navigator.of(context).push(
        //       //         MaterialPageRoute(
        //       //           builder:(context) => ProductOverview(
        //       //             productName: "Fresh Basli",
        //       //             productImage: "https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png",
        //       //           ),
        //       //         )
        //       //     );
        //       //   },
        //       // ),
        //       // SingleProduct(
        //       //   productImage: 'https://www.freepnglogos.com/uploads/broccoli-png/broccoli-organic-live-and-crops-owners-association-nigeria-26.png',
        //       //   productName: "Fresh Borkli",
        //       //   onTap: (){
        //       //     Navigator.of(context).push(
        //       //         MaterialPageRoute(
        //       //           builder:(context) => ProductOverview(
        //       //             productName: "Fresh Borkli",
        //       //             productImage: 'https://www.freepnglogos.com/uploads/broccoli-png/broccoli-organic-live-and-crops-owners-association-nigeria-26.png',
        //       //           ),
        //       //         )
        //       //     );
        //       //   },
        //       // ),
        //       // SingleProduct(
        //       //   productImage: 'https://freepngimg.com/thumb/categories/2972.png',
        //       //   productName: "Fresh Coli-Flower",
        //       //   onTap: (){
        //       //     Navigator.of(context).push(
        //       //         MaterialPageRoute(
        //       //           builder:(context) => ProductOverview(
        //       //             productImage: 'https://freepngimg.com/thumb/categories/2972.png',
        //       //             productName: "Fresh Coli-Flower",
        //       //           ),
        //       //         )
        //       //     );
        //       //   },
        //       // ),
        //       // SingleProduct(
        //       //   productImage: 'https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png',
        //       //   productName: "Fresh Basli",
        //       //   onTap: (){
        //       //     Navigator.of(context).push(
        //       //         MaterialPageRoute(
        //       //           builder:(context) => ProductOverview(
        //       //             productName: "Fresh Basli",
        //       //             productImage: "https://img2.pngio.com/basil-transparent-png-stickpng-sweet-basil-png-400_378.png",
        //       //           ),
        //       //         )
        //       //     );
        //       //   },
        //       // ),
        //       // SingleProduct(
        //       //   productImage: 'https://www.freepnglogos.com/uploads/broccoli-png/broccoli-organic-live-and-crops-owners-association-nigeria-26.png',
        //       //   productName: "Fresh Borkli",
        //       //   onTap: (){
        //       //     Navigator.of(context).push(
        //       //         MaterialPageRoute(
        //       //           builder:(context) => ProductOverview(
        //       //             productName: "Fresh Borkli",
        //       //             productImage: 'https://www.freepnglogos.com/uploads/broccoli-png/broccoli-organic-live-and-crops-owners-association-nigeria-26.png',
        //       //           ),
        //       //         )
        //       //     );
        //       //   },
        //       // ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    ProductProvider productProvider = Provider.of(context,listen:false);
    productProvider.fatchvegetablesProductData();
    productProvider.fetchFruitsProductData();
    productProvider.fetchherbsProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ProductProvider productProvider = Provider.of(context,);
    // productProvider.fatchHerbsProductData();
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      drawer: DrwerSide(
          userProvider: userProvider,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:
                      (context)=>Search(
                        search: productProvider.getAllProductSearch,
                      ),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.shop,
                  size: 17,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://media.istockphoto.com/photos/food-background-fresh-vegetables-on-black-top-view-picture-id627250646?k=6&m=627250646&s=612x612&w=0&h=nUY4HfWvfIhcXjFwYO2rTQTnnuM-mO_xQqTcl_1rciY='),
                ),
               // color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      //color: Colors.red,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 200, bottom: 10),
                            child: Container(
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color(0xffd6b738),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 4,
                                ),
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 10,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '30% Off',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.green[100],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              'On all vegetable products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _buildVegetablesProduct(context),
            _buildFruitProduct(context),
            _buildHerbsProduct(context),
          ],
        ),
      ),
    );
  }
}
