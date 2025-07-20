var beasUrlCairoOrMa;
class EndPoint {

  static String baseUrl = "$beasUrlCairoOrMa/api";

  static  String newsMarquee = "$baseUrl/News";

  static  String bannerOne = "$baseUrl/Baner1";

  static  String bannerTwo= "$baseUrl/Baner2";



  /// Category
  static  String getMainCategory= "$baseUrl/Category/GetMainCategory";

  static String subCategory ({required num mainCategoryId}) => "/Category/GetCategoryByParentId?Parent=$mainCategoryId";
 static String getProductsBySubCategory ({required num subCategoryId}) => "/Product/GetProductsByCategory?categoryId=$subCategoryId&pageNumber=1&pageSize=200000&CustomerPhone=01224739338";
static String getProductById ({required num productId}) => "/Product/GetProductById?ProductId=$productId&CustomerPhone=01224739338";
static String getProductByBrand ({required var categoryId,required var brandId}) => "/Product/GetBrandsByCatgory?categoryId=$categoryId&pageNumber=1&pageSize=10&CustomerPhone=01224739338&BrandID=$brandId";


static String getBrandsBySubCategory ({required  subCategory}) => "/Product/GetBrandsByCatgory?categoryId=$subCategory&pageNumber=1&pageSize=100000&CustomerPhone=CustomerPhone=94440596";

  static const String aboutUS = "/AboutUs";
  static const String privacyAndPlo = "/Privacy";


  ///
  ///
  static  String biggestDiscount = "$baseUrl/Product/GetProductsWithBiggestDiscount?pageNumber=1&pageSize=100&CustomerPhone=01224739338";
  static String bestSeller = "$baseUrl/Product/GetProductsWithBestSeller?pageNumber=1&pageSize=10000000&CustomerPhone==01224739338";
  static String newProduct = "$baseUrl/Product/GetNewProducts?pageNumber=1&pageSize=100&CustomerPhone=01224739338";
  /// auth

  static String login ({required String customerPhone,required String password}) => "$baseUrl/Customer/Login?CustomerPhone=$customerPhone&passWord=$password&Token=1111'";
  static String forgetpassw = "$baseUrl/Member/forgotpassword";
  static String changePassconfirm = "$baseUrl/Member/resetpassword";
  static String logout = "$baseUrl/Member/logout";

  /// invitation
  static String recurring = "$baseUrl/Invitation/recurring";
  static String oneTime = "$baseUrl/Invitation/oneTime";
  static String group = "$baseUrl/Invitation/group";

  /// get info about invitation
  static String invitation = "$baseUrl/Member/byStatus?status=";

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
