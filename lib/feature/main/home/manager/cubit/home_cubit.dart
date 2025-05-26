import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/catagory/presentation/screens/catagory_screen.dart';
import 'package:settings_app/feature/main/favourite/presentation/screens/favourites_card.dart';
import 'package:settings_app/feature/main/home/presentation/screens/home_screen.dart';
import 'package:settings_app/feature/main/list/presentation/screens/account_information.dart';
import 'package:settings_app/feature/main/menu/presentation/screens/menue_cart.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;

  List<Widget> screen = [
    HomeScreen(),
    const CatagoryScreen(),
    const MenueCart(),
    const FavouritesCard(),
    const AccountInformation(),
  ];

  void changeSelectIndexBottom({required int index}) {
    currentIndex = index;
    emit(ChangeIndexBottom());
  }
}
