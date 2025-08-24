
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/dio_concumer.dart';
import '../../../core/api/encrupt.dart';
import '../../../core/api/end_point.dart';
import '../../main/list/saved_address/model/area_model.dart';
import '../../main/list/saved_address/model/governorate_model.dart';
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
      if (value == "cXmUR9z1mAe20wCqm1ZR3Q==") {
        print('ggggggggggg');
        emit(LoginViewStateError(value));
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

  Future<void> registerUser({
    required String firstName,
    required String nameAddress,
    required String email,
    required String detailsAddress,

    required dynamic districtName,
    required dynamic regionName,

    required String lastName,required String companyName,required String password ,required String phone})
  async {
 //   token = await FirebaseMessaging.instance.getToken();
    emit(RegisterViewStateLoading());

    String encryptedData = encryptData(
        {
          "ArabicName":firstName,
          "CustomerLastName":lastName,
          "customerphone":phone,
          "email":email,
          "PassWord":password,
          "DistrictName":"$districtName",
          "RegionName":"$regionName",
          "Token" :'token',


          "AddressNotes":detailsAddress,
          "Gada":nameAddress  ,


        },
        privateKey, publicKey);
    print("Encrypted Data: $encryptedData");
    final decryptedText = decrypt(encryptedData, privateKey, publicKey);
    print(decryptedText);
    String jsonData = jsonEncode(encryptedData);

    await DioConsumer(dio: Dio()).post(
        EndPoint.register,
       data: jsonData ,


       ).then((value){
      print(value);
      print('Success Register');
      final decryptedText = decrypt(value, privateKey, publicKey);
      print(decryptedText);
      if (decryptedText == 'This customer exists.') {
        print('******************* العميل موجود من قبل **********************');
        emit(RegisterViewStateError(decryptedText));
      }
      else
      {
        emit(RegisterViewStateSuccess());
      }

    }).catchError((error){

      print('This is Error in RegisterNewUser '+error.toString());
      emit(RegisterViewStateError(error.toString()));
    });

  }

  bool isPassword=true;
  bool isPasswordConfirm=true;
  IconData subfix= Icons.visibility_off;
  IconData subfixConfirm= Icons.visibility_off;


  void changIconPassword()
  {
    isPassword=!isPassword;
    subfix=isPassword?Icons.visibility_off:Icons.visibility;
    emit(ChangeIconPasswordSuccess());
  }
  void changIconPasswordConfirm()
  {
    isPasswordConfirm=!isPasswordConfirm;
    subfixConfirm=isPasswordConfirm?Icons.visibility_off:Icons.visibility;
    emit(ChangeIconPasswordSuccess());
  }



  GovernorateModel? selectedGovernorate;
  void updateSelectedGovernorate(GovernorateModel governorate) {
    selectedGovernorate = governorate;

    emit(GovernorateSelected(selectedGovernorate!));
  }

  AreaModel? areaModel;
  void updateSelectedArea(AreaModel area) {
    areaModel = area;
    emit(AreaSelected(areaModel!));
  }
}
