import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../../../../core/api/dio_concumer.dart';
import '../../../../../core/api/encrupt.dart';
import '../../../../../core/api/end_point.dart';
import '../mode/image_model.dart';
import 'about_us_state.dart';



class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() :super(InitializeAboutUs());

  List<ImageModel> aboutUsList=[];
  Future<void> getImageAboutUs() async {
    emit(GetImageAboutUsLoading());
    await DioConsumer(dio: Dio()).get(
      EndPoint.aboutUS,
      useCache: true,
      cacheDuration: const Duration(minutes: 10),
    ).then((value) {
      // print(value.data);
      print('الداتا بعد فك التشفير');
      final decryptedText = decrypt(value, privateKey, publicKey);
       print(decryptedText);
      List<dynamic> jsonList = jsonDecode(decryptedText);
      aboutUsList = jsonList.map((json) => ImageModel.fromJson(json)).toList();

      // areaModelLoading=false;
      emit(GetImageAboutUsSuccess());
    }).catchError((error) {
      print(
          'Error In Function Get Get Image AboutUs This Error ${error.toString()}');
      emit(GetImageAboutUsError());
    });
  }



}