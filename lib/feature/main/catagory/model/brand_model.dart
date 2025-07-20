class BrandModel {
  final String fabricID;
  final String fabricName;
  final String fabricEName;
  final String fabricImage;

  BrandModel({
    required this.fabricID,
    required this.fabricName,
    required this.fabricEName,
    required this.fabricImage,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      fabricID: json['FabricID'] ?? '',
      fabricName: json['FabricName'] ?? '',
      fabricEName: json['FabricEName'] ?? '',
      fabricImage: json['FabricImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FabricID': fabricID,
      'FabricName': fabricName,
      'FabricEName': fabricEName,
      'FabricImage': fabricImage,
    };
  }
}
class BrandResponseModel {
  final List<BrandModel> brands;

  BrandResponseModel({required this.brands});

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) {
    return BrandResponseModel(
      brands: (json['Brands'] as List<dynamic>)
          .map((e) => BrandModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Brands': brands.map((e) => e.toJson()).toList(),
    };
  }
}