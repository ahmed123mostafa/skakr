import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/list/saved_address/manager/saved_address_state.dart';

import '../../../../../core/api/dio_concumer.dart';
import '../../../../../core/api/encrupt.dart';
import '../../../../../core/api/end_point.dart';
import '../../../../../core/constant/conatant.dart';
import '../model/all_address_model.dart';
import '../model/area_model.dart';
import '../model/governorate_model.dart';

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



  List<GovernorateModel> governoratesList = [];

  Future<void> getGovernorates() async {

    emit(GetGovernoratesLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.governorates,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value)  {
     log(value);

        final decryptedText = decrypt(value, privateKey, publicKey);
        log(decryptedText);


        List<dynamic> jsonList = jsonDecode(decryptedText);


        governoratesList =
            jsonList.map((json) =>GovernorateModel.fromJson(json)).toList();
     if (governoratesList.isNotEmpty) {
       selectedGovernorate = governoratesList.first;
     }
        emit(GetGovernoratesSuccess());

    }).catchError((error) {
      log(
          'Error In Function Get Governorates This Error ${error.toString()}');
      emit(GetGovernoratesError());
    });
  }
  GovernorateModel? selectedGovernorate;
  void updateSelectedGovernorate(GovernorateModel governorate) {
    selectedGovernorate = governorate;
    getArea(governorateId:governorate.governorateID );
    emit(GovernorateSelected(selectedGovernorate!));
  }


  bool areaModelLoading = true;
  List<AreaModel> areaModelList = [];
  AreaModel? areaModel;



  Future<void> getArea({int? governorateId}) async {
    areaModelList=[];
    emit(GetAreaLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.getArea(governorateId:governorateId??selectedGovernorate?.governorateID ?? 0 ),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {

      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
      List<dynamic> jsonList = jsonDecode(decryptedText);
      print('----------------${areaModelList.length}-----------------------');
      print(areaModelList);
      print('***************************************');
      areaModelList =
          jsonList.map((json) => AreaModel.fromJson(json)).toList();


      areaModelList = areaModelList.toSet().toList();


      if (areaModelList.isNotEmpty) {
        areaModel = areaModelList.first;
      }
     print('******************ddddddd******************************');
      print(areaModel?.districtName??'');
      print('************************************************');
      areaModelLoading = false;
      emit(GetAreaSuccess());
    }).catchError((error) {
      print('Error In Function Get Area This Error ${error.toString()}');
      emit(GetAreaError());
    });
  }

  void updateSelectedArea(AreaModel area) {
    areaModel = area;
    emit(AreaSelected(areaModel!));
  }








  Future<void> addNewAddress({
    required String nameAddress,

    required String detailsAddress,

    required dynamic districtName,
    required dynamic regionName,


  })
  async {

    emit(AddNewAddressLoading());
    {
    }

    String encryptedData = encryptData(
        {
          "customerphone":'${customerPhone}',
          "DistrictName":"$districtName",
          "RegionName":"$regionName",
          "AddressNotes":detailsAddress,
          "Gada":nameAddress        //backend

        },
        privateKey, publicKey);
    print("Encrypted Data: $encryptedData");
    final decryptedText = decrypt(encryptedData, privateKey, publicKey);
    print(decryptedText);
    String jsonData = jsonEncode(encryptedData);

    await DioConsumer(dio: Dio()).post(
      EndPoint.addNewAddress,
      data: jsonData ,


    ).then((value){
      print(value);

      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);

      emit(AddNewAddressSuccess(decryptedText));
    }).catchError((error){

      print('This is Error in Add New Address $error');
      emit(AddNewAddressError());
    });

  }

}