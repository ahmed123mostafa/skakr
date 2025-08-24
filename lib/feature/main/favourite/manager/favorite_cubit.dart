import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/api/dio_concumer.dart';
import '../../../../core/api/encrupt.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/constant/conatant.dart';
import '../model/favorite_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() :super(InitializeFavorite());


  int pageNumberFavorite = 1;
  bool favoriteLoading = true;
  List<FavoriteModel> favoriteList = [];

  Future<void> getFavorite({bool fromPagination = false}) async {
    if (fromPagination) {

    }
    else {
      emit(GetFavoriteLoading());
    }


    await DioConsumer(dio: Dio()).get(
      EndPoint.getFavorite,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      print('الداتا بعد فك التشفير');
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);

      favoriteLoading = false;
      pageNumberFavorite++;
      favoriteList.addAll(jsonList.map((json) => FavoriteModel.fromJson(json)));
      emit(GetFavoriteSuccess());
    }).catchError((error) {
      print(
          'Error In Function Get Favorite This Error ${error.toString()}');
      emit(GetFavoriteError());
    });
  }

  Future<void> addFavorite({required int productId, required Map<String, bool> favorite,required String barcode}) async {
    print(favorite[barcode] = !favorite[barcode]!);
    favorite[barcode] = !favorite[barcode]!;
    print(favorite[barcode] = !favorite[barcode]!);
    emit(AddFavoriteLoading());

    String encryptedData = encryptData(
        {"ProductID": productId, "CustomerPhone": '$customerPhone', "BarCode": barcode},
        privateKey, publicKey);
    print("Encrypted Data: $encryptedData");
    String jsonData = jsonEncode(encryptedData);

    await DioConsumer(dio: Dio()).post(
      EndPoint.addFavorite,
      data: jsonData ,


    ).then((value){
      print('Success');

      print('الداتا بعد فك التشفير');
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
      emit(AddFavoriteSuccess());
    }).catchError((error) {
      favorite[barcode] = !favorite[barcode]!;
      emit(AddFavoriteError());
      print('is Error == $error');
      print('Error in Add Favorite ');
    }
    );
  }
  //
  //
  // void deleteFavorite({required int productId, required int index,required String barcode}) {
  //   // print(favorite[productId] =!favorite[productId]!);
  //   // favorite[productId] =!favorite[productId]!;
  //   // print(favorite[productId] =!favorite[productId]!);
  //   emit(DeleteFavoriteLoading());
  //   print(productId);
  //
  //
  //   DioHelper.deleteData(
  //       url: Endpoints.deleteFavorite(productId:  productId, barcode: barcode))
  //       .then((value) {
  //     print('Success');
  //     print('الداتا قبل فك التشفير');
  //     print(value.data);
  //
  //     print('الداتا بعد فك التشفير');
  //     final decryptedText = decrypt(value.data, privateKey, publicKey);
  //     print(decryptedText);
  //
  //     favoriteList.removeAt(index);
  //     emit(DeleteFavoriteSuccess());
  //   }).catchError((error) {
  //     // favorite[productId] =!favorite[productId]!;
  //     emit(DeleteFavoriteError());
  //     print('is Error == $error');
  //     print('Error in Add Favorite ');
  //   }
  //   );
  // }












}