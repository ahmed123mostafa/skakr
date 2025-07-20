abstract class CategoryState{}
class InitializeCategory extends CategoryState{}




class GetMainCategoryLoading extends CategoryState{}
class GetMainCategorySuccess extends CategoryState{}
class GetMainCategoryError extends CategoryState{}


class GetSubCategoryLoading extends CategoryState{}
class GetSubCategorySuccess extends CategoryState{}
class GetSubCategoryError extends CategoryState{}

class GetBrandsLoading extends CategoryState{}
class GetBrandsSuccess extends CategoryState{}
class GetBrandsError extends CategoryState{}

class GetItemsForSubCategoryLoading extends CategoryState {}
class GetItemsForSubCategorySuccess extends CategoryState {}
class GetItemsForSubCategoryError extends CategoryState {}

class GetItemsForBrandLoading extends CategoryState {}
class GetItemsForBrandSuccess extends CategoryState {}
class GetItemsForBrandError extends CategoryState {}

class ChangeSubCategory extends CategoryState{}