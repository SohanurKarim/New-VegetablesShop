import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodtest0/models/product_models.dart';

class ProductProvider with ChangeNotifier {

  late ProductModel productModel;

  List<ProductModel>search=[];

  productModels(QueryDocumentSnapshot element){
      productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
        productId: element.get("productId"),
      );
      search.add(productModel);
  }

  ///////////////1. Firebase Code For Vegetables Products /////////////
  List<ProductModel> vegetablesProductList = [];

  fatchvegetablesProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("VegetablesProduct").get();

    value.docs.forEach(
      (element) {
        productModels(element);
        // productModel = ProductModel(
        //   productImage: element.get("productImage"),
        //   productName: element.get("productName"),
        //   productPrice: element.get("productPrice"),
        // );
        newList.add(productModel);
      },
    );
    vegetablesProductList = newList;
    notifyListeners();
  }

  List<ProductModel>get getvegetablesProductDataList{
    return vegetablesProductList;
  }

  ///////////////2. Firebase Code For Fruits Products /////////////
  List<ProductModel> fruitsProductList = [];

  fetchFruitsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("FruitsProduct").get();

    value.docs.forEach(
          (element) {
         productModels(element);
        // productModel = ProductModel(
        //   productImage: element.get("productImage"),
        //   productName: element.get("productName"),
        //   productPrice: element.get("productPrice"),
        // );
        newList.add(productModel);
      },
    );
    fruitsProductList = newList;
    notifyListeners();
  }

  List<ProductModel>get getfruitsProductDataList{
    return fruitsProductList;
  }

  ///////////////3. Firebase Code For Herbs Products /////////////
  List<ProductModel> herbsProductList = [];

  fetchherbsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("HerbsProduct").get();

    value.docs.forEach(
          (element) {
         productModels(element);
        // productModel = ProductModel(
        //   productImage: element.get("productImage"),
        //   productName: element.get("productName"),
        //   productPrice: element.get("productPrice"),
        // );
        newList.add(productModel);
      },
    );
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel>get getherbsProductDataList{
    return herbsProductList;
  }

  ///////////// Code of Search Product //////////////
  List<ProductModel>get getAllProductSearch{
    return search;
  }



  //////////////////////////
}
