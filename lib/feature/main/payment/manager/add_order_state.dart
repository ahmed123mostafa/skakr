import '../model/order_summry_model.dart';

abstract class AddOrderState{}
class InitializeAddOrder extends AddOrderState{}




class GetDeliveryTimesLoading extends AddOrderState {}

class GetDeliveryTimesSuccess extends AddOrderState {}

class GetDeliveryTimesError extends AddOrderState {}

class GetTomorrowDeliveryTimesLoading extends AddOrderState {}

class GetTomorrowTimesSuccess extends AddOrderState {}

class GetTomorrowTimesError extends AddOrderState {}


// class GetSubAddOrderLoading extends AddOrderState{}
// class GetSubAddOrderSuccess extends AddOrderState{}
// class GetSubAddOrderError extends AddOrderState{}
//
// class GetItemsForSubAddOrderLoading extends AddOrderState {}
// class GetItemsForSubAddOrderSuccess extends AddOrderState {}
// class GetItemsForSubAddOrderError extends AddOrderState {}
//
class ChangeDeliveryTimeSelected extends AddOrderState{}

class ChangeSelectedDayState extends AddOrderState{}
class ChangeVisibilityState extends AddOrderState{}

class DeliveryTimeChanged extends AddOrderState {
  final String selectedOption;
  DeliveryTimeChanged(this.selectedOption);
}

class AddOrderLoading extends AddOrderState{}
class AddOrderSuccess extends AddOrderState{

  OrderSummryModel? orderSummryModel;
  dynamic invoiceNumber;
  AddOrderSuccess(this.orderSummryModel,{required this.invoiceNumber});
}
class AddOrderError extends AddOrderState{
  final String error;
  AddOrderError(this.error);
}





