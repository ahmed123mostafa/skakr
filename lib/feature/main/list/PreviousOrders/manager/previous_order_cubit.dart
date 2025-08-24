import 'dart:async';
import 'dart:convert';
import 'dart:developer';



import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/list/PreviousOrders/manager/previous_order_state.dart';



import '../../../../../core/api/dio_concumer.dart';
import '../../../../../core/api/encrupt.dart';
import '../../../../../core/api/end_point.dart';
import '../../../../../core/constant/conatant.dart';
import '../model/previous_order_details_model.dart';
import '../model/previous_order_model.dart';

class PreviousOrderCubit extends Cubit<PreviousOrderState> {
  PreviousOrderCubit() :super(InitializePreviousOrder());






  final StreamController<List<PreviousOrdersModel>> _previousOrdersController = StreamController<List<PreviousOrdersModel>>.broadcast();

  Stream<List<PreviousOrdersModel>> get previousOrdersStream => _previousOrdersController.stream;

  void dispose() {
    _previousOrdersController.close();
    _orderTrackingDetailsController.close();
    _timer?.cancel();
    super.close();
  }
  bool previousOrderLoading = true;
  List<PreviousOrdersModel> previousOrderList = [];

  Future<void> getPreviousOrders() async {
    print(CustomerID);
    emit(GetPreviousOrderLoading());

    await DioConsumer(dio: Dio()).get(
      EndPoint.previousOrdersByPhone,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      print('الداتا بعد فك التشفير');
      final decryptedText = decrypt(value, privateKey, publicKey);
      log(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);
      List<PreviousOrdersModel> newList =
      jsonList.map((json) => PreviousOrdersModel.fromJson(json)).toList();

      bool hasStatusChanged = previousOrderList.length != newList.length;

      if (hasStatusChanged) {
        previousOrderList = newList;
        previousOrderLoading = false;
        _previousOrdersController.sink.add(previousOrderList);
        emit(GetPreviousOrderSuccess());
      }
    }).catchError((error) {
      print('Error In Function Get Previous Orders: ${error.toString()}');
      emit(GetPreviousOrderError());
    });
  }


  Timer? _timer;

  void startOrderTrackingRealtime() {
    if (isClosed) return;

    getOrderTrackingDetails();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (isClosed) {
        timer.cancel();
      } else {
        getOrderTrackingDetails();
        getPreviousOrders();
      }
    });
  }

  List<PreviousOrderDetailsModel> previousOrderDetailsList = [];

  Future<void> getPreviousOrderDetails({required int orderId}) async {
    print('طلب تفاصيل الطلبية رقم: $orderId');
    emit(GetPreviousOrderItemsLoading());

    await DioConsumer(dio: Dio()).get(
      EndPoint.previousOrdersItem(itemId: orderId),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value.data);
      print('الداتا بعد فك التشفير');

      final decryptedText = decrypt(value.data, privateKey, publicKey);
      print(decryptedText);

      List<dynamic> jsonList = jsonDecode(decryptedText);
      print(jsonList);
      previousOrderDetailsList =
          jsonList.map((json) => PreviousOrderDetailsModel.fromJson(json)).toList();

      emit(GetPreviousOrderItemsSuccess());
    }).catchError((error) {
      print('Error In Function Get Previous Order Details: ${error.toString()}');
      emit(GetPreviousOrderItemsError());
    });
  }




  final StreamController<List<PreviousOrdersModel>> _orderTrackingDetailsController = StreamController<List<PreviousOrdersModel>>.broadcast();
  Stream<List<PreviousOrdersModel>> get orderTrackingDetailsStream => _orderTrackingDetailsController.stream;
  int getCurrentStep(PreviousOrdersModel lastOrder) {
    if (lastOrder.delivered) return 4;
    if (lastOrder.startDeliver) return 3;
    if (lastOrder.underDeliver) return 2;
    if (lastOrder.sendingOrder) return 1;
    if (lastOrder.prepare) return 0;
    return 0; // Default fallback
  }
  List<PreviousOrdersModel> orderTrackingDetails=[];
  Future<void> getOrderTrackingDetails() async {
    emit(OrderTrackingLoading());

    await DioConsumer(dio: Dio()).get(
      EndPoint.previousTrackingOrdersByPhone,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      print(value);
      print('الداتا بعد فك التشفير');
      final decryptedText = decrypt(value, privateKey, publicKey); // إذا كان هناك تشفير للبيانات
      print(decryptedText);


      List<dynamic> jsonList = jsonDecode(decryptedText);
      orderTrackingDetails = jsonList.map((json) => PreviousOrdersModel.fromJson(json)).toList();


      _orderTrackingDetailsController.sink.add(orderTrackingDetails);

      emit(OrderTrackingSuccess());
    }).catchError((error) {
      print('Error In Function Get Order Tracking Details: ${error.toString()}');
      emit(OrderTrackingError(errorMessage: error.toString()));
    });
  }


}
