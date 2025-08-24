

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/core/api/end_point.dart' show EndPoint;

import '../../../../core/api/dio_concumer.dart';
import '../../../../core/api/encrupt.dart';
import '../../../../core/constant/conatant.dart';
import '../model/delivery_time_model.dart';
import '../model/order_summry_model.dart';
import 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit() : super(InitializeAddOrder());





  List<DeliveryTimeModel> deliveryTimesList = [];

  Future<void> getDeliveryTimes() async {
    emit(GetDeliveryTimesLoading());

    await DioConsumer(dio: Dio()).get(
      EndPoint.deliveryTimes,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      deliveryTimesList.clear();
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
      print('********************');

      List<dynamic> jsonList = jsonDecode(decryptedText);
print(jsonList);
      deliveryTimesList = jsonList
          .map((json) => DeliveryTimeModel.fromJson(json))
          .toList();

      emit(GetDeliveryTimesSuccess());
    }).catchError((error) {
      print('Error in getDeliveryTimes: ${error.toString()}');
      emit(GetDeliveryTimesError());
    });
  }


  Future<void> getTomorrowDeliveryTimes() async {
    emit(GetDeliveryTimesLoading());

    await DioConsumer(dio: Dio()).get(
      EndPoint.tomorrowDeliveryTimes,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      deliveryTimesList.clear();
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
      print('********************');

      List<dynamic> jsonList = jsonDecode(decryptedText);
print(jsonList);
      deliveryTimesList = jsonList
          .map((json) => DeliveryTimeModel.fromJson(json))
          .toList();

      emit(GetDeliveryTimesSuccess());
    }).catchError((error) {
      print('Error in getDeliveryTimes: ${error.toString()}');
      emit(GetDeliveryTimesError());
    });
  }
  int selectedDeliveryTimeId = 0;
  int selectedDeliveryIndex=0;
  void changeSelectedDeliveryTime({required int id,required int index}) {
    selectedDeliveryTimeId = id;
    selectedDeliveryIndex=index;
    emit(ChangeDeliveryTimeSelected());
  }
  String selectedDay = "today";

  void toggleSelectedDay({required String dayName}) {
    if (selectedDay == "today") {
      selectedDay = "tomorrow";
      getTomorrowDeliveryTimes();
    } else {
      selectedDay = "today";
      getDeliveryTimes();
    }
    emit(ChangeSelectedDayState());
  }
  bool isVisibleTodayOrTomorrow = true;


  void toggleVisibility({required bool showToday}) {
    isVisibleTodayOrTomorrow = showToday;
    emit(ChangeVisibilityState());
  }

  String deliveryTimeOption = "now";

  void changeDeliveryTime(String option) {
    deliveryTimeOption = option;
    emit(DeliveryTimeChanged(option));
  }



  OrderSummryModel? orderSummryModel;
  Future<void> addOrder({
    required String customName,




    required double total,
    required dynamic listItem,
    required dynamic districtName,
    required dynamic regionName,
    required String email,
    required String customerAddress,
    required num addition,
    required num discount,
    required String discountCode,
    required var deliveryId,
    required var deliveryTime,
    required var deliveryDate,


  })
  async {
    print('1212111111111111111111111111111111111111111111111111111');
    print(listItem);
    print('111111111111111111111111111111111111111111111111111111111');
    emit(AddOrderLoading());

    String encryptedData = encryptData(
        {






          "OrderDate":DateFormat('yyyy-MM-dd','en').format(DateTime.now()),
          "DeliveryDate":'${deliveryDate}',
          "CustomerPhone":customerPhone??'',
          "email":email,
          "OrderAddress":customerAddress,
          "DistrictName":"$districtName",
          "RegionName":"$regionName",
          "DeliveryID": '${deliveryId}',


          "OrderTime": '${deliveryTime}',


          "PayID":0,
          "DiscountCode":discountCode,
          "Apartment":"",
          "TotalValue":total,"Additions":addition,
          "Discount":discount,"FinalValue": ((total - discount) + addition),
          "OnlineStoreId":-1,"DiscountCardValue":0,
          "OrderItems":listItem

        },
        privateKey, publicKey);
    print("Encrypted Data: $encryptedData");

    final decryptedText = decrypt(encryptedData, privateKey, publicKey);
    log(decryptedText);
 String jsonData = jsonEncode(encryptedData);
    //
    orderSummryModel=OrderSummryModel.fromJson(jsonDecode(decryptedText));
    await DioConsumer(dio: Dio()).post(
      EndPoint.addOrder,
      data: jsonData ,


    ).then((value){

      print(value);
      print('Success Order');
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);

      emit(AddOrderSuccess( orderSummryModel ,invoiceNumber:decryptedText ,));
    }).catchError((error){

      print('This is Error in Add Order $error');
      emit(AddOrderError(error.toString()));
    });

  }

}