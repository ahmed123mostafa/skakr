class ProductDetailsModel {
  String? productCode;
  String? barCode;
  num? colorID;
  var colorArName;
  var colorEnName;
  num? sizeID;
  var sizeName;
  var sizeEName;
  String? productArName;
  String? productEnName;
  String? categoryId;
  String? categoryCode;
  String? categoryArName;
  String? categoryEnName;
  num? departmentId;
  var departmentArName;
  var departmentEnName;
  num? descriptionID;
  var descriptionArName;
  var descriptionEnName;
  num? seasonID;
  var seasonArName;
  var seasonEnName;
  var brandID;
  var brandArName;
  var brandEnName;
  num? countryID;
  var countryArName;
  var countryEnName;
  num? patternId;
  var patternArName;
  var patternEnName;
  num? stockQuantity;
  num? price;
  num? priceAfterDiscount;
  num? wholePrice;
  num? halfWholePrice;
  num? salePrice;
  var lastBuyPrice;
  var localCost;
  var exportPrice;
  var retailPrice;
  String? specification;
  num? productID;
  num? priceUnit2;
  num? wholePriceUnit2;
  num? halfWholePriceUnit2;
  num? salePriceUnit2;
  var lastBuyPriceUnit2;
  var exportPriceUnit2;
  var retailPriceUnit2;
  num? priceUnit3;
  num? wholePriceUnit3;
  num? halfWholePriceUnit3;
  num? salePriceUnit3;
  var lastBuyPriceUnit3;
  var exportPriceUnit3;
  var retailPriceUnit3;
  num? discountPercent;
  var commissionValue;
  var commissionPercent;
  String? specifications;
  num? modelNo;
  num? modelArName;
  num? modelEnName;
  num? supplierID;
  var supplierArName;
  var supplierEnName;
  num? unitID1;
  var unit1ArName;
  var unit1EnName;
  String? barcodeUnit1;
  num? unitID2;
  var unit2Factor;
  var unit2ArName;
  var unit2EnName;
  var barcodeUnit2;
  num? unitID3;
  var unit3Factor;
  var unit3ArName;
  var unit3EnName;
  var barcodeUnit3;
  num? unitID4;
  var unit4Factor;
  var unit4ArName;
  var unit4EnName;
  var barcodeUnit4;
  var productWeight;
  var unit1ponums;
  var unit2ponums;
  var unit3ponums;
  var unit4ponums;
  var maxQtyLimt;
  var minQtyLimit;
  var priceUnit4;
  var wholePriceUnit4;
  var halfWholePriceUnit4;
  var salePriceUnit4;
  var lastBuyPriceUnit4;
  var exportPriceUnit4;
  var retailPriceUnit4;
  num? producedProduct;
  String? productPeiceNo;
  bool? isWeighingProduct;
  num? productionDateProduct;
  num? expiredDateProduct;
  num? defaultUnitNumber;
  bool? branchesProduct;
  var additionalRate;
  var priceAddRatio;
  var taxesRate;
  bool? serialInput;
  bool? serialOutput;
  num? priceEdit;
  var registerationDate;
  num? stoppingProduct;
  bool? isPureCostProduct;
  bool? invisibleProduct;
  num? productType;
  num? productclassifyID;
  var productclassifyName;
  var productclassifyEnName;
  num? createdBy;
  String? productcImage;
  dynamic isFavorite;
  num? customerQuantity;
  num? totalQuantity;
  String? fromDate;
  String? toDate;
  num? soldQuantity;
  num? remainQuantity;
  num? requiredQTY;
  num? giftQTY;
  num? yGiftQty;
  var description1;
  var description2;
  var description3;
  var description4;
  var description5;
  var description6;
  var description7;
  var description8;
  var description9;
  var description10;
  var numOfPages;
  var defaultUnitArName;
  var defaultUnitEnName;
  List? productColorsSizes;
  List? productUnitsandPrices;
  List<UnitsModel>? productUnitImages;
  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    productCode = json['ProductCode'];
    barCode = json['BarCode'];
    colorID = json['ColorID'];
    colorArName = json['ColorArName'];
    colorEnName = json['ColorEnName'];
    sizeID = json['SizeID'];
    sizeName = json['SizeName'];
    sizeEName = json['SizeEName'];
    productArName = json['ProductArName'];
    productEnName = json['ProductEnName'];
    categoryId = json['CategoryId'];
    categoryCode = json['CategoryCode'];
    categoryArName = json['CategoryArName'];
    categoryEnName = json['CategoryEnName'];
    departmentId = json['DepartmentId'];
    departmentArName = json['DepartmentArName'];
    departmentEnName = json['DepartmentEnName'];
    descriptionID = json['DescriptionID'];
    descriptionArName = json['DescriptionArName']??'';
    descriptionEnName = json['DescriptionEnName']??'';
    seasonID = json['SeasonID'];
    seasonArName = json['SeasonArName'];
    seasonEnName = json['SeasonEnName'];
    brandID = json['BrandID'];
    brandArName = json['BrandArName'];
    brandEnName = json['BrandEnName'];
    countryID = json['CountryID'];
    countryArName = json['CountryArName'];
    countryEnName = json['CountryEnName'];
    patternId = json['PatternId'];
    patternArName = json['PatternArName'];
    patternEnName = json['PatternEnName'];
    stockQuantity = json['StockQuantity'];
    price = json['Price'];
    priceAfterDiscount = json['PriceAfterDiscount'];
    wholePrice = json['WholePrice'];
    halfWholePrice = json['HalfWholePrice'];
    salePrice = json['SalePrice'];
    lastBuyPrice = json['LastBuyPrice'];
    localCost = json['LocalCost'];
    exportPrice = json['ExportPrice'];
    retailPrice = json['RetailPrice'];
    specification = json['Specification'];
    productID = json['ProductID'];
    priceUnit2 = json['PriceUnit2'];
    wholePriceUnit2 = json['WholePriceUnit2'];
    halfWholePriceUnit2 = json['HalfWholePriceUnit2'];
    salePriceUnit2 = json['SalePriceUnit2'];
    lastBuyPriceUnit2 = json['LastBuyPriceUnit2'];
    exportPriceUnit2 = json['ExportPriceUnit2'];
    retailPriceUnit2 = json['RetailPriceUnit2'];
    priceUnit3 = json['PriceUnit3'];
    wholePriceUnit3 = json['WholePriceUnit3'];
    halfWholePriceUnit3 = json['HalfWholePriceUnit3'];
    salePriceUnit3 = json['SalePriceUnit3'];
    lastBuyPriceUnit3 = json['LastBuyPriceUnit3'];
    exportPriceUnit3 = json['ExportPriceUnit3'];
    retailPriceUnit3 = json['RetailPriceUnit3'];
    discountPercent = json['DiscountPercent'];
    commissionValue = json['CommissionValue'];
    commissionPercent = json['CommissionPercent'];
    specifications = json['Specifications']??'';
    modelNo = json['ModelNo'];
    modelArName = json['ModelArName'];
    modelEnName = json['ModelEnName'];
    supplierID = json['SupplierID'];
    supplierArName = json['SupplierArName'];
    supplierEnName = json['SupplierEnName'];
    unitID1 = json['UnitID1'];
    unit1ArName = json['Unit1ArName'];
    unit1EnName = json['Unit1EnName'];
    barcodeUnit1 = json['BarcodeUnit1'];
    unitID2 = json['UnitID2'];
    unit2Factor = json['Unit2Factor'];
    unit2ArName = json['Unit2ArName'];
    unit2EnName = json['Unit2EnName'];
    barcodeUnit2 = json['BarcodeUnit2'];
    unitID3 = json['UnitID3'];
    unit3Factor = json['Unit3Factor'];
    unit3ArName = json['Unit3ArName'];
    unit3EnName = json['Unit3EnName'];
    barcodeUnit3 = json['BarcodeUnit3'];
    unitID4 = json['UnitID4'];
    unit4Factor = json['Unit4Factor'];
    unit4ArName = json['Unit4ArName'];
    unit4EnName = json['Unit4EnName'];
    barcodeUnit4 = json['BarcodeUnit4'];
    productWeight = json['ProductWeight'];
    unit1ponums = json['Unit1ponums'];
    unit2ponums = json['Unit2ponums'];
    unit3ponums = json['Unit3ponums'];
    unit4ponums = json['Unit4ponums'];
    maxQtyLimt = json['MaxQtyLimt'];
    minQtyLimit = json['MinQtyLimit'];
    priceUnit4 = json['PriceUnit4'];
    wholePriceUnit4 = json['WholePriceUnit4'];
    halfWholePriceUnit4 = json['HalfWholePriceUnit4'];
    salePriceUnit4 = json['SalePriceUnit4'];
    lastBuyPriceUnit4 = json['LastBuyPriceUnit4'];
    exportPriceUnit4 = json['ExportPriceUnit4'];
    retailPriceUnit4 = json['RetailPriceUnit4'];
    producedProduct = json['ProducedProduct'];
    productPeiceNo = json['ProductPeiceNo'];
    isWeighingProduct = json['IsWeighingProduct'];
    productionDateProduct = json['ProductionDateProduct'];
    expiredDateProduct = json['ExpiredDateProduct'];
    defaultUnitNumber = json['DefaultUnitNumber'];
    branchesProduct = json['BranchesProduct'];
    additionalRate = json['AdditionalRate'];
    priceAddRatio = json['PriceAddRatio'];
    taxesRate = json['TaxesRate'];
    serialInput = json['SerialInput'];
    serialOutput = json['SerialOutput'];
    priceEdit = json['PriceEdit'];
    registerationDate = json['RegisterationDate'];
    stoppingProduct = json['StoppingProduct'];
    isPureCostProduct = json['IsPureCostProduct'];
    invisibleProduct = json['InvisibleProduct'];
    productType = json['ProductType'];
    productclassifyID = json['ProductclassifyID'];
    productclassifyName = json['ProductclassifyName'];
    productclassifyEnName = json['ProductclassifyEnName'];
    createdBy = json['CreatedBy'];
    productcImage = json['ProductcImage'];
    isFavorite = json['IsFavorite'];
    customerQuantity = json['CustomerQuantity'];
    totalQuantity = json['TotalQuantity'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    soldQuantity = json['SoldQuantity'];
    remainQuantity = json['RemainQuantity'];
    requiredQTY = json['RequiredQTY'];
    giftQTY = json['GiftQTY'];
    yGiftQty = json['YGiftQty'];
    description1 = json['Description1'];
    description2 = json['Description2'];
    description3 = json['Description3'];
    description4 = json['Description4'];
    description5 = json['Description5'];
    description6 = json['Description6'];
    description7 = json['Description7'];
    description8 = json['Description8'];
    description9 = json['Description9'];
    description10 = json['Description10'];
    numOfPages = json['NumOfPages'];
    defaultUnitArName = json['DefaultUnitArName'];
    defaultUnitEnName = json['DefaultUnitEnName'];
    productColorsSizes = json['ProductColorsSizes'];
    productUnitsandPrices = json['ProductUnitsandPrices'];
    productUnitImages = (json['Product_Images'] as List?)
        ?.map((e) => UnitsModel.fromJson(e))
        .toList();

  }
}





class UnitsModel {
  final int productId;
  final String barcode;
  final String imagePath;
   var unitNumber;
  var unitId;
  final String unitArName;
  final String unitEnName;
  final double price;
  final double priceAfterDiscount;
  final int discountRate;
  final int giftQty;
  final int requiredQty;
  final double stockQty;
  final double customerQuantity;
  final double totalQuantity;
  final int yGiftQty;
  final String productArName;
  final String productEnName;
  final int categoryId;
  var unitValue;
  final double customerQtyFree;
  final double totalQtyFree;

  UnitsModel({
    required this.productId,
    required this.barcode,
    required this.imagePath,
    required this.unitNumber,
    required this.unitId,
    required this.unitArName,
    required this.unitEnName,
    required this.price,
    required this.priceAfterDiscount,
    required this.discountRate,
    required this.giftQty,
    required this.requiredQty,
    required this.stockQty,
    required this.customerQuantity,
    required this.totalQuantity,
    required this.yGiftQty,
    required this.productArName,
    required this.productEnName,
    required this.categoryId,
    required this.unitValue,
    required this.customerQtyFree,
    required this.totalQtyFree,
  });

  factory UnitsModel.fromJson(Map<String, dynamic> json) {
    return UnitsModel(
      productId: int.tryParse(json['ProductID'].toString()) ?? 0,
      barcode: json['Barcode'].toString(),
      imagePath: json['ImagePath'] ?? '',
      unitNumber: json['UnitNumber'],
      unitId: json['UnitID'],
      unitArName: json['UnitArName'] ?? '',
      unitEnName: json['UnitEnName'] ?? '',
      price: (json['Price'] as num?)?.toDouble() ?? 0.0,
      priceAfterDiscount: (json['PriceAfterDiscount'] as num?)?.toDouble() ?? 0.0,
      discountRate: int.tryParse(json['DiscountRate'].toString()) ?? 0,
      giftQty: int.tryParse(json['GiftQTY'].toString()) ?? 0,
      requiredQty: int.tryParse(json['RequiredQTY'].toString()) ?? 0,
      stockQty: (json['StockQty'] as num?)?.toDouble() ?? 0.0,
      customerQuantity: (json['CustomerQuantity'] as num?)?.toDouble() ?? 0.0,
      totalQuantity: (json['TotalQuantity'] as num?)?.toDouble() ?? 0.0,
      yGiftQty: int.tryParse(json['Y_Gift_Qty'].toString()) ?? 0,
      productArName: json['ProductArName'] ?? '',
      productEnName: json['ProductEnName'] ?? '',
      categoryId: int.tryParse(json['CategoryId'].toString()) ?? 0,
      unitValue: json['UnitValue'],
      customerQtyFree: (json['CustomerQtyFree'] as num?)?.toDouble() ?? 0.0,
      totalQtyFree: (json['TotalQtyFree'] as num?)?.toDouble() ?? 0.0,
    );
  }



}
