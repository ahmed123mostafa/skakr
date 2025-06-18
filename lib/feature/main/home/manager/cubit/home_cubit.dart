import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/catagory/presentation/screens/catagory_screen.dart';
import 'package:settings_app/feature/main/favourite/presentation/screens/favourites_card.dart';
import 'package:settings_app/feature/main/home/presentation/screens/home_screen.dart';
import 'package:settings_app/feature/main/list/presentation/screens/account_information.dart';
import 'package:settings_app/feature/main/menu/presentation/screens/menue_cart.dart';

import '../../../../../core/api/api_concumer.dart';
import '../../../../../core/api/dio_concumer.dart';
import '../../../../../core/api/encrupt.dart';
import '../../../../../core/api/end_point.dart';
import '../../../catagory/model/product_model.dart';
import '../../model/banar_model.dart';
import '../../model/news_marquee_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;

  List<Widget> screen = [
    HomeScreen(),
    const CatagoryScreen(),
    const MenueCart(),
    const FavouritesCard(),
    const AccountInformation(),
  ];

  void changeSelectIndexBottom({required int index}) {
    currentIndex = index;
    emit(ChangeIndexBottom());
  }

  List<NewsMarqueeModel> newsMarqueeList=[];
  Future<void> getNewsMarquee() async {
    emit(GetNewsMarqueeLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.newsMarquee,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {


      final decryptedText = decrypt(value, privateKey, publicKey);


      List<dynamic> jsonList = jsonDecode(decryptedText);
      newsMarqueeList = jsonList.map((json) => NewsMarqueeModel.fromJson(json)).toList();

      emit(GetNewsMarqueeSuccess());
    }).catchError((error) {
      print('Error In Function Get News Marquee This Error ${error.toString()}');
      emit(GetNewsMarqueeError());
    });
  }


  List<BannerModel> bannerOneImageList=[];
  Future<void> getBannerOneImage() async {
    emit(GetBannerOneImageLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.bannerOne,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {

      final decryptedText = decrypt(value, privateKey, publicKey);

      print(decryptedText);
      List<dynamic> jsonList = jsonDecode(decryptedText);
      bannerOneImageList = jsonList.map((json) => BannerModel.fromJson(json)).toList();
      print(bannerOneImageList.length);
      emit(GetBannerOneImageSuccess());
    }).catchError((error) {
      print('Error In Function Get Banner One Image This Error ${error.toString()}');
      emit(GetBannerOneImageError());
    });
  }

  List<BannerModel> bannerTwoImageList=[];
  Future<void> getBannerTwoImage() async {
    emit(GetBannerTwoImageLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.bannerTwo,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {

      print('الداتا بعد فك التشفير');

      final decryptedText = decrypt(value, privateKey, publicKey);

      print(decryptedText);
      List<dynamic> jsonList = jsonDecode(decryptedText);
      bannerTwoImageList = jsonList.map((json) => BannerModel.fromJson(json)).toList();

      emit(GetBannerTwoImageSuccess());
    }).catchError((error) {
      print(
          'Error In Function Get Banner  Two Image This Error ${error.toString()}');
      emit(GetBannerTwoImageError());
    });
  }

  Map<String, bool> itemsBiggestDiscountFavorite = {};
  List<ProductModel> biggestDiscountList = [];

  Future<void> getBiggestDiscountProducts() async {
    emit(GetBiggestDiscountLoading());

    await DioConsumer(dio: Dio()).get(
      EndPoint.getMainCategory,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);

      final decryptedText = decrypt(value, privateKey, publicKey);

      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);
        biggestDiscountList = jsonList.map((json) => ProductModel.fromJson(json)).toList();

        for (var element in biggestDiscountList) {
          itemsBiggestDiscountFavorite.addAll({
            element.barCode: element.isFavorite,
          });
        }

        emit(GetBiggestDiscountSuccess());

    }).catchError((error) {
      print('Error in getBiggestDiscountProducts: ${error.toString()}');
      emit(GetBiggestDiscountError());
    });
  }


  Map<String, bool> itemsBestSellerFavorite = {};
  List<ProductModel> bestSellerList=[];
  Future<void> getBestSellers() async {
    emit(GetBestSellerLoading());

    await DioConsumer(dio: Dio()).get(
      EndPoint.bestSeller,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);

      final decryptedText = decrypt(value, privateKey, publicKey);

      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);

      bestSellerList = jsonList.map((json) => ProductModel.fromJson(json)).toList();

      for (var element in bestSellerList) {
        itemsBestSellerFavorite[element.barCode] = element.isFavorite;
      }

      emit(GetBestSellerSuccess());

    }).catchError((error) {
      print('Error In Function get Get Best Seller This Error ${error.toString()}');
      emit(GetBestSellerError());
    });
  }


  Map<String, bool> itemsNewProductFavorite = {};
  List<ProductModel> newProductList=[];
  Future<void> getNewProduct() async {
    emit(GetNewProductLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.newProduct,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {

      print(value);

      final decryptedText = decrypt(value, privateKey, publicKey);

      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);


        newProductList = jsonList.map((json) => ProductModel.fromJson(json)).toList();


        for (var element in  newProductList) {
          itemsNewProductFavorite.addAll({
            element.barCode: element.isFavorite,
          });
        }

        emit(GetNewProductSuccess());



    }).catchError((error) {
      print(
          'Error In Function get Get New Product This Error ${error.toString()}');
      emit(GetNewProductError());
    });
  }


}
