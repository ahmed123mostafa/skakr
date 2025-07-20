

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/core/api/end_point.dart' show EndPoint;

import '../../../../core/api/dio_concumer.dart';
import '../../../../core/api/encrupt.dart';
import '../model/delivery_time_model.dart';
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

}