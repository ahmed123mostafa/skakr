import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/catagory/presentation/screens/catagory_screen.dart';
import 'package:settings_app/feature/main/favourite/presentation/screens/favourites_card.dart';
import 'package:settings_app/feature/main/home/presentation/screens/home_screen.dart';
import 'package:settings_app/feature/main/list/presentation/screens/account_information.dart';
import 'package:settings_app/feature/main/menu/presentation/screens/menue_cart.dart';

import '../../../../../core/api/dio_concumer.dart';
import '../../../../../core/api/encrupt.dart';
import '../../../../../core/api/end_point.dart';
import '../../../catagory/model/product_model.dart';
import '../../model/banar_model.dart';
import '../../model/news_marquee_model.dart';
import '../../model/offer_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;

  List<Widget> screen = [
    const HomeScreen(),
    const CatagoryScreen(),
    const MenueCart(),
    const FavouritesCard(),
    const AccountInformation(),
  ];

  void changeSelectIndexBottom({required int index}) {
    currentIndex = index;
    emit(ChangeIndexBottom());
  }

  List<NewsMarqueeModel> newsMarqueeList = [];

  Future<void> getNewsMarquee() async {
    emit(GetNewsMarqueeLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.newsMarquee,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      final decryptedText = decrypt(value, privateKey, publicKey);


      List<dynamic> jsonList = jsonDecode(decryptedText);
      newsMarqueeList =
          jsonList.map((json) => NewsMarqueeModel.fromJson(json)).toList();

      emit(GetNewsMarqueeSuccess());
    }).catchError((error) {
      print(
          'Error In Function Get News Marquee This Error ${error.toString()}');
      emit(GetNewsMarqueeError());
    });
  }


  List<BannerModel> bannerOneImageList = [];

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
      bannerOneImageList =
          jsonList.map((json) => BannerModel.fromJson(json)).toList();
      print(bannerOneImageList.length);
      emit(GetBannerOneImageSuccess());
    }).catchError((error) {
      print('Error In Function Get Banner One Image This Error ${error
          .toString()}');
      emit(GetBannerOneImageError());
    });
  }

  List<BannerModel> bannerTwoImageList = [];

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
      bannerTwoImageList =
          jsonList.map((json) => BannerModel.fromJson(json)).toList();

      emit(GetBannerTwoImageSuccess());
    }).catchError((error) {
      print(
          'Error In Function Get Banner  Two Image This Error ${error
              .toString()}');
      emit(GetBannerTwoImageError());
    });
  }

  Map<String, bool> itemsBiggestDiscountFavorite = {};
  List<ProductModel> biggestDiscountList = [];

  Future<void> getBiggestDiscountProducts() async {
    emit(GetBiggestDiscountLoading());

    await DioConsumer(dio: Dio()).get(
      EndPoint.biggestDiscount,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);

      final decryptedText = decrypt(value, privateKey, publicKey);

      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);
      biggestDiscountList =
          jsonList.map((json) => ProductModel.fromJson(json)).toList();

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
  List<ProductModel> bestSellerList = [];

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

      bestSellerList =
          jsonList.map((json) => ProductModel.fromJson(json)).toList();

      for (var element in bestSellerList) {
        itemsBestSellerFavorite[element.barCode] = element.isFavorite;
      }

      emit(GetBestSellerSuccess());
    }).catchError((error) {
      print('Error In Function get Get Best Seller This Error ${error
          .toString()}');
      emit(GetBestSellerError());
    });
  }


  Map<String, bool> itemsNewProductFavorite = {};
  List<ProductModel> newProductList = [];

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


      newProductList =
          jsonList.map((json) => ProductModel.fromJson(json)).toList();


      for (var element in newProductList) {
        itemsNewProductFavorite.addAll({
          element.barCode: element.isFavorite,
        });
      }

      emit(GetNewProductSuccess());
    }).catchError((error) {
      print(
          'Error In Function get Get New Product This Error ${error
              .toString()}');
      emit(GetNewProductError());
    });
  }


  Map<String, bool> itemsOfferOneFavorite = {};
  List<OfferModel> offerOneList = [];

  Map<String, bool> itemsOfferTwoFavorite = {};
  List<OfferModel> offerTwoList = [];

  Map<String, bool> itemsOfferThreeFavorite = {};
  List<OfferModel> offerThreeList = [];

  Map<String, bool> itemsOfferFourFavorite = {};
  List<OfferModel> offerFourList = [];

  Map<String, bool> itemsOfferFiveFavorite = {};
  List<OfferModel> offerFiveList = [];


  Future<void> getOfferOne() async {
    emit(OfferOneLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.offers,
      useCache: false,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);


      offerOneList = jsonList.map((json) => OfferModel.fromJson(json)).toList();


      final firstOffer = offerOneList.isNotEmpty ? offerOneList[0] : null;


      final products = firstOffer != null
          ? firstOffer.offerItems.map((item) => item.toProductModel()).toList()
          : <ProductModel>[];
      for (var offerTwo in offerOneList) {
        for (var item in offerTwo.offerItems) {
          itemsOfferOneFavorite.addAll({
            item.barCode!: item.isFavorite,
          });
        }
      }

      emit(OfferOneSuccess());
    }).catchError((error) {
      print('Error in getOfferOne: ${error.toString()}');
      emit(OfferOneError());
    });
  }

  Future<void> getOfferTwo() async {
    emit(OfferTwoLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.offerTwo,
      useCache: false,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);


      offerTwoList = jsonList.map((json) => OfferModel.fromJson(json)).toList();


      final firstOffer = offerTwoList.isNotEmpty ? offerTwoList[0] : null;

      final products = firstOffer != null
          ? firstOffer.offerItems.map((item) => item.toProductModel()).toList()
          : <ProductModel>[];
      for (var offerTwo in offerTwoList) {
        for (var item in offerTwo.offerItems) {
          itemsOfferTwoFavorite.addAll({
            item.barCode!: item.isFavorite,
          });
        }
      }
      
      
      
      
      
      
      

      emit(OfferTwoSuccess());
    }).catchError((error) {
      print('Error in getOfferTwo: ${error.toString()}');
      emit(OfferTwoError());
    });
  }

  Future<void> getOfferThree() async {
    emit(OfferThreeLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.offerThree,
      useCache: false,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);

    


      List<dynamic> jsonList = jsonDecode(decryptedText);


      offerThreeList = jsonList.map((json) => OfferModel.fromJson(json)).toList();


      final firstOffer = offerThreeList.isNotEmpty ? offerThreeList[0] : null;

      final products = firstOffer != null
          ? firstOffer.offerItems.map((item) => item.toProductModel()).toList()
          : <ProductModel>[];
      for (var offerThree in offerThreeList) {
        for (var item in offerThree.offerItems) {
          itemsOfferThreeFavorite.addAll({
            item.barCode!: item.isFavorite,
          });
        }
      }
      
      
      // offerThreeList = jsonList.map((json) => ProductModel.fromJson(json)).toList();
      //
      // for (var element in offerThreeList) {
      //   itemsOfferThreeFavorite.addAll({
      //     element.barCode: element.isFavorite,
      //   });
      // }

      emit(OfferThreeSuccess());
    }).catchError((error) {
      print('Error in getOfferThree: ${error.toString()}');
      emit(OfferThreeError());
    });
  }

  Future<void> getOfferFour() async {
    emit(OfferFourLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.offerFour,
        useCache: false,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
      List<dynamic> jsonList = jsonDecode(decryptedText);


      offerFourList = jsonList.map((json) => OfferModel.fromJson(json)).toList();


      final firstOffer = offerFourList.isNotEmpty ? offerFourList[0] : null;

      final products = firstOffer != null
          ? firstOffer.offerItems.map((item) => item.toProductModel()).toList()
          : <ProductModel>[];
      for (var offerFour in offerFourList) {
        for (var item in offerFour.offerItems) {
          itemsOfferFourFavorite.addAll({
            item.barCode!: item.isFavorite,
          });
        }
      }


      emit(OfferFourSuccess());
    }).catchError((error) {
      print('Error in getOfferFour: ${error.toString()}');
      emit(OfferFourError());
    });
  }

  Future<void> getOfferFive() async {
    emit(OfferFiveLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.offerFive,
      useCache: false,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);


      offerFiveList = jsonList.map((json) => OfferModel.fromJson(json)).toList();


      final firstOffer = offerFiveList.isNotEmpty ? offerFiveList[0] : null;

      final products = firstOffer != null
          ? firstOffer.offerItems.map((item) => item.toProductModel()).toList()
          : <ProductModel>[];
      for (var offerFive in offerFiveList) {
        for (var item in offerFive.offerItems) {
          itemsOfferFiveFavorite.addAll({
            item.barCode!: item.isFavorite,
          });
        }
      }


      emit(OfferFiveSuccess());
    }).catchError((error) {
      print('Error in getOfferFive: ${error.toString()}');
      emit(OfferFiveError());
    });
  }


}
