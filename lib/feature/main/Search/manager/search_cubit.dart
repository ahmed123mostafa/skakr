import 'dart:async';
import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/Search/manager/search_state.dart';

import '../../../../core/api/dio_concumer.dart';
import '../../../../core/api/encrupt.dart';
import '../../../../core/api/end_point.dart';
import '../../catagory/model/product_model.dart';
import '../../favourite/model/favorite_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() :super(InitializeSearch());
  final TextEditingController searchController = TextEditingController();
  Timer? debounce;
  List<ProductModel > searchList=[];
  Future<void> searchKey({required searchKey}) async {
    emit(SearchLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.searchProduct(searchKey: searchKey),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      print('الداتا بعد فك التشفير');
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);
      searchList = jsonList.map((json) => ProductModel.fromJson(json)).toList();

      emit(SearchSuccess());
    }).catchError((error) {
      print(
          'Error In Function Get Search  This Error ${error.toString()}');
      emit(SearchError());
    });
  }
  
}