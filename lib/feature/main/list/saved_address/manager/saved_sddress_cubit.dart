import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/list/saved_address/manager/saved_address_state.dart';

import '../../../../../core/api/dio_concumer.dart';
import '../../../../../core/api/encrupt.dart';
import '../../../../../core/api/end_point.dart';
import '../model/all_address_model.dart';

class SavedAddressCubit extends Cubit<SavedAddressState> {
  SavedAddressCubit() :super(InitializeSavedAddress());

  List<AllAddressModel> allAddressList = [];
  Future<void> getAllAddress() async {

    emit(GetGAllAddressLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.getAllAddress,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value)  {


        final decryptedText = decrypt(value, privateKey, publicKey);
        log(decryptedText);


        List<dynamic> jsonList = jsonDecode(decryptedText);
print(jsonList);

        allAddressList =
            jsonList.map((json) => AllAddressModel.fromJson(json)).toList();

        print(allAddressList.length);
        print('-----------------------------------------------');
        print(allAddressList[0].customerPhone);
        print('-----------------------------------------------');
        emit(GetGAllAddressSuccess());

    }).catchError((error) {
      if (kDebugMode) {
        print(
          'Error In Function Get GAll Address This Error ${error.toString()}');
      }
      emit(GetGAllAddressError());
    });
  }


  int selectAddress=0;
  AllAddressModel? addressSelect;
  void changeSelectedAddress(int index){
    selectAddress=index;
    emit(ChangeSelectedAddress());

  }
}