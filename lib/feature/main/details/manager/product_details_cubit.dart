import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/details/manager/product_details_state.dart';


import '../../../../core/api/dio_concumer.dart';
import '../../../../core/api/encrupt.dart';
import '../../../../core/api/end_point.dart';
import '../model/product_details_model.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() :super(InitializeProductDetails());


  List<ProductDetailsModel> productDetailsList = [];
  Map<int, bool> itemDetailsFavorite = {};
  Future<void> getProductDetails({required productId}) async {
    emit(GetProductDetailsLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.getProductById(productId: productId),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {

        final decryptedText = decrypt(value, privateKey, publicKey);
        print(decryptedText);


        List<dynamic> jsonList = jsonDecode(decryptedText);


        productDetailsList =
            jsonList.map((json) => ProductDetailsModel.fromJson(json)).toList();

       // itemDetailsFavorite[productDetailsList[0].productID!.toInt()] = productDetailsList[0].isFavorite??false;

        emit(GetProductDetailsSuccess());
      }
    ).catchError((error) {
      print(
          'Error In Function Get Product DetailsThis Error ${error.toString()}');
      emit(GetProductDetailsError());
    });
  }

  int selectedUnit=0;
  void changeSelectedUnit({required int index}) {
    selectedUnit=index;
    emit(ChangeSelectedUnit());
  }

}