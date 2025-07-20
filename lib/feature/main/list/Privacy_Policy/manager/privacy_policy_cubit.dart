import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/list/Privacy_Policy/manager/privacy_policy_state.dart';

import '../../../../../core/api/dio_concumer.dart';
import '../../../../../core/api/encrupt.dart';
import '../../../../../core/api/end_point.dart';
import '../../about_us/mode/image_model.dart';








class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit() :super(InitializePrivacyPolicy());

  List<ImageModel> privacyPolicyList=[];
  Future<void> getImagePrivacyPolicy() async {
    emit(GetImagePrivacyPolicyLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.privacyAndPlo,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      // print(value.data);
      print('الداتا بعد فك التشفير');
      final decryptedText = decrypt(value, privateKey, publicKey);
       print(decryptedText);
      List<dynamic> jsonList = jsonDecode(decryptedText);
      privacyPolicyList = jsonList.map((json) => ImageModel.fromJson(json)).toList();

      // areaModelLoading=false;
      emit(GetImagePrivacyPolicySuccess());
    }).catchError((error) {
      print(
          'Error In Function Get Get Image Privacy Policy This Error ${error.toString()}');
      emit(GetImagePrivacyPolicyError());
    });
  }



}