
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/dio_concumer.dart';
import '../../../core/api/encrupt.dart';
import '../../../core/api/end_point.dart';
import '../model/customer_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitializeAuthState());

  Future<void> userLogin(
      {required String customerPhone, required String password}) async {
    emit(LoginViewStateLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.login(customerPhone: customerPhone, password: password),
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {

      final decryptedText = decrypt(value, privateKey, publicKey);




      dynamic jsonString = jsonEncode(decryptedText);
      print(jsonString);
      print(jsonString.runtimeType);
      if (value.data == "cXmUR9z1mAe20wCqm1ZR3Q==") {
        print('ggggggggggg');
        emit(LoginViewStateError(value.data));
      }
      else {
        print(decryptedText);
        Map<String, dynamic> customerMap = jsonDecode(decryptedText);


        Customer customer = Customer.fromJson(customerMap);
        print(customer.email);
        emit(LoginViewStateSuccess(customer));
      }
    }).catchError((error) {
      emit(LoginViewStateError(error.toString()));
      print('is Error == $error');
      print('Error in Login ');
    }
    );
  }


}
