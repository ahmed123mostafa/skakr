import '../model/area_model.dart';
import '../model/governorate_model.dart';

abstract class SavedAddressState{}
class InitializeSavedAddress extends SavedAddressState{}

class GetGovernoratesLoading extends SavedAddressState{}
class GetGovernoratesSuccess extends SavedAddressState{}
class GetGovernoratesError extends SavedAddressState{}

class GovernorateSelected extends SavedAddressState {
  final GovernorateModel selectedGovernorate;

  GovernorateSelected(this.selectedGovernorate);
}
class ChangeSelectedAddress extends SavedAddressState{}

class GetGAllAddressLoading extends SavedAddressState{}
class GetGAllAddressSuccess extends SavedAddressState{}
class GetGAllAddressError extends SavedAddressState{}




class GetAreaLoading extends SavedAddressState{}
class GetAreaSuccess extends SavedAddressState{}
class GetAreaError extends SavedAddressState{}
class AreaSelected extends SavedAddressState {
  final AreaModel areaModel;

  AreaSelected(this.areaModel);
}

class AddNewAddressLoading extends SavedAddressState{}
class AddNewAddressSuccess extends SavedAddressState{
  dynamic data;
  AddNewAddressSuccess(this.data);
}
class AddNewAddressError extends SavedAddressState{}
