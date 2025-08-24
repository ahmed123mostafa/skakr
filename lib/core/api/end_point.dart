import '../constant/conatant.dart';

var beasUrlCairoOrMa;
class EndPoint {

  static String baseUrl = "$beasUrlCairoOrMa/api";

  static  String newsMarquee = "$baseUrl/News";

  static  String bannerOne = "$baseUrl/Baner1";

  static  String bannerTwo= "$baseUrl/Baner2";



  /// Category
  static  String getMainCategory= "$baseUrl/Category/GetMainCategory";

  static String subCategory ({required num mainCategoryId}) => "/Category/GetCategoryByParentId?Parent=$mainCategoryId";
 static String getProductsBySubCategory ({required num subCategoryId}) => "/Product/GetProductsByCategory?categoryId=$subCategoryId&pageNumber=1&pageSize=200000&CustomerPhone=$customerPhone";
static String getProductById ({required num productId}) => "/Product/GetProductById?ProductId=$productId&CustomerPhone=$customerPhone";
static String getProductByBrand ({required var categoryId,required var brandId}) => "/Product/GetProductsByBrandID?categoryId=$categoryId&pageNumber=1&pageSize=100&CustomerPhone=$customerPhone&BrandID=$brandId";
  static String addFavorite= "/Customer/AddCustomerProduct";
  static String getFavorite= "/Customer/GetCustomerProducts?CustomerPhone=$customerPhone";
  static String deleteFavorite({required int productId, required String barcode}) =>
      "/Customer/DeleteCustomerProduct?CustomerPhone=$customerPhone&ProductID=$productId&BarCode=$barcode";
static String searchProduct({required String searchKey, }) =>
      "/Product/SearchProducts?searchKey=$searchKey";


//Address

  static  String getAllAddress= "$baseUrl/Customers/GetCustomerAddress?CustomerPhone=$customerPhone";

static String getBrandsBySubCategory ({required  subCategory}) => "/Product/GetBrandsByCatgory?categoryId=$subCategory&pageNumber=1&pageSize=100";

  static const String aboutUS = "/AboutUs";
  static const String privacyAndPlo = "/Privacy";


  ///
  ///
  static  String biggestDiscount = "$baseUrl/Product/GetProductsWithBiggestDiscount?pageNumber=1&pageSize=100&CustomerPhone=$customerPhone";
  static String bestSeller = "$baseUrl/Product/GetProductsWithBestSeller?pageNumber=1&pageSize=10000000&CustomerPhone=$customerPhone";
  static String newProduct = "$baseUrl/Product/GetNewProducts?pageNumber=1&pageSize=100&CustomerPhone=";
  static String offerOne   = "$baseUrl/Offer1?CustomerPhone=$customerPhone";
  static String offerTwo   = "$baseUrl/Offer2?CustomerPhone=$customerPhone";
  static String offerThree = "$baseUrl/Offer3?CustomerPhone=$customerPhone";
  static String offerFour  = "$baseUrl/Offer4?CustomerPhone=$customerPhone";
  static String offerFive  = "$baseUrl/Offer5?CustomerPhone=$customerPhone";
  static String offers  = "$baseUrl/Offers";



  ///Add Order
  ///
  static String addOrder = "$baseUrl/Order";
  /// auth

  static String login ({required String customerPhone,required String password}) => "$baseUrl/Customer/Login?CustomerPhone=$customerPhone&passWord=$password&Token=1111";
  static String register = "$baseUrl/Customer/AddCustomer";
  static String forgetpassw = "$baseUrl/Member/forgotpassword";
  static String changePassconfirm = "$baseUrl/Member/resetpassword";
  static String logout = "$baseUrl/Member/logout";

  /// invitation
  static String recurring = "$baseUrl/Invitation/recurring";
  static String oneTime = "$baseUrl/Invitation/oneTime";
  static String group = "$baseUrl/Invitation/group";

  //Address
  static  String governorates = "$baseUrl/Governorates";
  static String getArea  ({required num governorateId}) => "$baseUrl/Areas/GetAreaByGovernorateId?GovernorateId=$governorateId";
  static final String addNewAddress = "$baseUrl/Customer/AddCustomerAddress";
  static String previousTrackingOrdersByPhone = "/Order/GetCurrentOrdersByCustomerPhone/$customerPhone";
  static String previousOrdersByPhone = "/Order/GetByCustomerPhone/$customerPhone";
  /// get info about invitation
  static String invitation = "$baseUrl/Member/byStatus?status=";
  static String previousOrdersItem({required int itemId}) => "/api/Order/GetOrderProducts/$itemId?CustomerPhone=$customerPhone";
  static String addFamilyDependant = "$baseUrl/Member/addFamilyDependant";
  static String getfammilydata = "$baseUrl/Member/familyDependants";
  static String deletememberid = "$baseUrl/Member/";
  static String familydependts = "$baseUrl/Member/familyDependants";

  /// chat
  static const String hubUrl =
      'http://78.89.159.126:9393/TheOneAPIRehana/chatHub';

  static String chat = "$baseUrl/Chat/messages";
  static String sendmessage = "$baseUrl/Chat/sendMessage";

  ///finance

  static String finnance = "$baseUrl/Member/bondsSummaryByYear";
  static String cancel = "$baseUrl/Member/cancelInvitation/";
  static String reschudle = "$baseUrl/Member/invitation/reschedule";

  //Add Order
  static String deliveryTimes = "$baseUrl/DeliveringTimes";
  static String tomorrowDeliveryTimes= "$baseUrl/DeliveringTimes/TomorowDeliveringTimes";





}
