import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/widget/single_item.dart';
import 'package:foodtest0/models/product_models.dart';

class Search extends StatefulWidget {
 // const Search({Key? key}) : super(key: key);

 final List<ProductModel>search;
 Search({required this.search});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String query = "";

  searchItem(String query){
    List<ProductModel>searchFood = widget.search.where((element){
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {

    List<ProductModel>_searchItem = searchItem(query);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Search",
          style: TextStyle(
            color: textColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onChanged: (value){
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[300],
                filled: true,
                hintText: "Search for item in the store",
                suffixIcon: Icon(
                    Icons.search,
                  color: textColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Column(
            //children: widget.search.map((data){
            children: _searchItem.map((data){
              return SingleItem(
                isBool: false,
                wishLIst: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productQuantity: 1,
                productId: data.productId,
              );
            }).toList(),
          ),
          // SingleItem(
          //   isBool: false,
          // ),
        ],
      ),
    );
  }
}
