part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class ChangeIndexBottom extends HomeState{}

class GetNewsMarqueeLoading extends HomeState {}
class GetNewsMarqueeSuccess extends HomeState {}
class GetNewsMarqueeError extends HomeState {}


class GetBannerOneImageLoading extends HomeState{}
class GetBannerOneImageSuccess extends HomeState{}
class GetBannerOneImageError extends HomeState{}

class GetBannerTwoImageLoading extends HomeState{}
class GetBannerTwoImageSuccess extends HomeState{}
class GetBannerTwoImageError extends HomeState{}



class GetBestSellerLoading extends HomeState {}
class GetBestSellerSuccess extends HomeState {}
class GetBestSellerError extends HomeState {}

class GetBiggestDiscountLoading extends HomeState {}
class GetBiggestDiscountSuccess extends HomeState {}
class GetBiggestDiscountError extends HomeState {}

class GetNewProductLoading extends HomeState {}
class GetNewProductSuccess extends HomeState {}
class GetNewProductError extends HomeState {}