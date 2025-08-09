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

