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

class OfferOneLoading extends HomeState {}
class OfferOneSuccess extends HomeState {}
class OfferOneError extends HomeState {}

class OfferTwoLoading extends HomeState {}
class OfferTwoSuccess extends HomeState {}
class OfferTwoError extends HomeState {}

class OfferThreeLoading extends HomeState {}
class OfferThreeSuccess extends HomeState {}
class OfferThreeError extends HomeState {}

class OfferFourLoading extends HomeState {}
class OfferFourSuccess extends HomeState {}
class OfferFourError extends HomeState {}

class OfferFiveLoading extends HomeState {}
class OfferFiveSuccess extends HomeState {}
class OfferFiveError extends HomeState {}