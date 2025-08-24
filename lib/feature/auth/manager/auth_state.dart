import '../../main/list/saved_address/model/area_model.dart';
import '../../main/list/saved_address/model/governorate_model.dart';
import '../model/customer_model.dart';

abstract class AuthState {}

class InitializeAuthState extends AuthState{}

class LoginViewStateLoading extends AuthState{}
class LoginViewStateSuccess extends AuthState{
  Customer dataUser;
  LoginViewStateSuccess(this.dataUser);
}
class LoginViewStateError extends AuthState{

  final String error;
  LoginViewStateError(this.error);
}

class ChangeIconPasswordSuccess extends AuthState{}



class RegisterViewStateLoading extends AuthState{}
class RegisterViewStateSuccess extends AuthState{

  // UserRegisterModel? userRegisterModelModel;
  RegisterViewStateSuccess(
      // this.userRegisterModelModel
      );
}
class RegisterViewStateError extends AuthState{

  final String error;
  RegisterViewStateError(this.error);
}

class GovernorateSelected extends AuthState{
  final GovernorateModel selectedGovernorate;

  GovernorateSelected(this.selectedGovernorate);
}
class AreaSelected extends AuthState {
  final AreaModel areaModel;

  AreaSelected(this.areaModel);
}