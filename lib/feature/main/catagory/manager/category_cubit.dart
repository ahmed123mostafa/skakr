import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/dio_concumer.dart';
import '../../../../core/api/encrupt.dart';
import '../../../../core/api/end_point.dart';
import '../model/brand_model.dart';
import '../model/main_category_model.dart';
import '../model/product_model.dart';
import '../model/sub_category_model.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(InitializeCategory());



// Get Main Category
  List<MainCategoryModel> mainCategoryList = [];

  Future<void> getMainCategory() async {
    emit(GetMainCategoryLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.getMainCategory,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
print('********************');
      List<dynamic> jsonList = jsonDecode(decryptedText);
      mainCategoryList = jsonList.map((json) => MainCategoryModel.fromJson(json)).toList();
      print('*********            ${mainCategoryList.length}        ***********');
      print(mainCategoryList.length);
      emit(GetMainCategorySuccess());
    }).catchError((error) {
      print('Error In Function Get Main Category This Error ${error.toString()}');
      emit(GetMainCategoryError());
    });
  }

  // get Sub Category
  List<SubCategoryModel> subCategoryList=[];
  Future<void> getSubCategory({required  mainCategoryId}) async {
    emit(GetSubCategoryLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.subCategory(mainCategoryId: mainCategoryId),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
      print('********************');
      List<dynamic> jsonList = jsonDecode(decryptedText);


      subCategoryList = jsonList.map((json) => SubCategoryModel.fromJson(json)).toList();


        emit(GetSubCategorySuccess());



    }).catchError((error) {
      print(
          'Error In Function Get Main Sub Category This Error ${error.toString()}');
      emit(GetMainCategoryError());
    });
  }
  int subCategorySelect=0;
  void changeSelectedCategory({required int index}) {
    subCategorySelect=index;
    emit(ChangeSubCategory());
  }

  int brandSelect=-1;
  void changeSelectedBrand({required int index}) {
    brandSelect=index;
    emit(ChangeSubCategory());
  }


  Map<String, bool> itemsForSubCategoryFavorite = {};
  List<ProductModel> itemsSubCategoryList=[];
  Future<void> getItemsForSubCategory({required  subCategoryId}) async {
    emit(GetItemsForSubCategoryLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.getProductsBySubCategory(subCategoryId: subCategoryId),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {


      itemsSubCategoryList.clear();
        final decryptedText = decrypt(value, privateKey, publicKey);
        print(decryptedText);


        List<dynamic> jsonList = jsonDecode(decryptedText);


        itemsSubCategoryList = jsonList.map((json) => ProductModel.fromJson(json)).toList();

        for (var element in itemsSubCategoryList) {
          itemsForSubCategoryFavorite.addAll({
            element.barCode:element.isFavorite,
          });
        }

        emit(GetItemsForSubCategorySuccess());



    }).catchError((error) {
      print(
          'Error In Function get Items For Sub Category This Error ${error.toString()}');
      emit(GetItemsForSubCategoryError());
    });
  }



  List<BrandResponseModel> brandList = [];

  Future<void> getBrandsBySubCategory({required  subCategoryId}) async {
    emit(GetBrandsLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.getBrandsBySubCategory(subCategory: subCategoryId),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
      print('********************');

      List<dynamic> jsonList = jsonDecode(decryptedText);
    brandList = jsonList.map((json) => BrandResponseModel.fromJson(json)).toList();
log(decryptedText);
      emit(GetBrandsSuccess());
    }).catchError((error) {
      print('Error In Function Get Brands By SubCategory: ${error.toString()}');
      emit(GetBrandsError());
    });
  }


  Map<String, bool> itemsForBrandFavorite = {};

  Future<void> getItemsForBrandCategory({required  categoryId,required brandId}) async {
    emit(GetItemsForBrandLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.getProductByBrand(categoryId: categoryId,brandId: brandId),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
print('--------------------------*******************---------');
print(value);
      itemsSubCategoryList.clear();
      final decryptedText = decrypt(value, privateKey, publicKey);
print('--------------------------***********888888********---------');
      print(decryptedText);


      List<dynamic> jsonList = jsonDecode(decryptedText);


      itemsSubCategoryList = jsonList.map((json) => ProductModel.fromJson(json)).toList();

      for (var element in itemsSubCategoryList) {
        itemsForSubCategoryFavorite.addAll({
          element.barCode:element.isFavorite,
        });
      }

      emit(GetItemsForBrandSuccess());



    }).catchError((error) {
      print(
          'Error In Function get Items For Get Items For Brand  This Error ${error.toString()}');
      emit(GetItemsForBrandError());
    });
  }
}