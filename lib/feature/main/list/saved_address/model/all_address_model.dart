

class AllAddressModel {
  final int customerID;
  final String arabicName;
  final String englishName;
  final String customerPhone;
  final String? lastName;
  final String passWord;
  final String email;
  final int regionId;
  final String? regionName;
  final int placeId;
  final String? districtName;
  final String? streetName;
  final String? gada;
  final String? houseNo;
  final String? block;
  final String? floor;
  final String? apartment;
  final String? addressNotes;
  final String customerAddress;
  final String? billValue;
  final String? paymentMethod;
  final String? deliveryValue;
  final String? districtName2;
  final String? districtEName2;
  final String? token;
  final String? mapCustomerAddress;
  final String? mapPlaceID;
  final String addressID;
  final String? customerLastName;
  final int regionID3;
  final String? regionname3;
  final String? regionEname3;
  final String? addressNotes3;
  final String? address;
  final mainAddress;

  AllAddressModel({
    required this.customerID,
    required this.arabicName,
    required this.englishName,
    required this.customerPhone,
    this.lastName,
    required this.passWord,
    required this.email,
    required this.regionId,
    this.regionName,
    required this.placeId,
    this.districtName,
    this.streetName,
    this.gada,
    this.houseNo,
    this.block,
    this.floor,
    this.apartment,
    this.addressNotes,
    required this.customerAddress,
    this.billValue,
    this.paymentMethod,
    this.deliveryValue,
    this.districtName2,
    this.districtEName2,
    this.token,
    this.mapCustomerAddress,
    this.mapPlaceID,
    required this.addressID,
    this.customerLastName,
    required this.regionID3,
    this.regionname3,
    this.regionEname3,
    this.addressNotes3,
    this.address,
    this.mainAddress
  });

  factory AllAddressModel.fromJson(Map<String, dynamic> json) {
    return AllAddressModel(
      customerID: json['CustomerID'] ?? 0,
      arabicName: json['ArabicName']?.toString() ?? '',
      englishName: json['EnglishName']?.toString() ?? '',
      customerPhone: json['CustomerPhone']?.toString() ?? '',
      lastName: json['LastName']?.toString(),
      passWord: json['PassWord']?.toString() ?? '',
      email: json['Email']?.toString() ?? '',
      regionId: (json['region_id'] is int) ? json['region_id'] : int.tryParse(json['region_id'].toString()) ?? 0,
      regionName: json['RegionName']?.toString(),
      placeId: (json['place_id'] is int) ? json['place_id'] : int.tryParse(json['place_id'].toString()) ?? 0,
      districtName: json['DistrictName']?.toString(),
      streetName: json['StreetName']?.toString(),
      gada: json['Gada']?.toString(),
      houseNo: json['HouseNo']?.toString(),
      block: json['Block']?.toString(),
      floor: json['Floor']?.toString(),
      apartment: json['Apartment']?.toString(),
      addressNotes: json['AddressNotes']?.toString(),
      customerAddress: json['CustomerAddress']?.toString() ?? '',
      billValue: json['BillValue']?.toString(),
      paymentMethod: json['PaymentMethod']?.toString(),
      deliveryValue: json['DeliveryValue']?.toString(),
      districtName2: json['DistrictName2']?.toString(),
      districtEName2: json['DistrictEName2']?.toString(),
      token: json['Token']?.toString(),
      mapCustomerAddress: json['MapCustomerAddress']?.toString(),
      mapPlaceID: json['MapPlaceID']?.toString(),
      addressID: json['AddressID']?.toString() ?? '',
      customerLastName: json['CustomerLastName']?.toString(),
      regionID3: (json['RegionID3'] is int) ? json['RegionID3'] : int.tryParse(json['RegionID3'].toString()) ?? 0,
      regionname3: json['Regionname3']?.toString(),
      regionEname3: json['RegionEname3']?.toString(),
      addressNotes3: json['AddressNotes3']?.toString(),
      address: json['Address']?.toString(),
      mainAddress: json['MainAddress']??0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CustomerID': customerID,
      'ArabicName': arabicName,
      'EnglishName': englishName,
      'CustomerPhone': customerPhone,
      'LastName': lastName,
      'PassWord': passWord,
      'Email': email,
      'region_id': regionId,
      'RegionName': regionName,
      'place_id': placeId,
      'DistrictName': districtName,
      'StreetName': streetName,
      'Gada': gada,
      'HouseNo': houseNo,
      'Block': block,
      'Floor': floor,
      'Apartment': apartment,
      'AddressNotes': addressNotes,
      'CustomerAddress': customerAddress,
      'BillValue': billValue,
      'PaymentMethod': paymentMethod,
      'DeliveryValue': deliveryValue,
      'DistrictName2': districtName2,
      'DistrictEName2': districtEName2,
      'Token': token,
      'MapCustomerAddress': mapCustomerAddress,
      'MapPlaceID': mapPlaceID,
      'AddressID': addressID,
      'CustomerLastName': customerLastName,
      'RegionID3': regionID3,
      'Regionname3': regionname3,
      'RegionEname3': regionEname3,
      'AddressNotes3': addressNotes3,
      'Address': address,
    };
  }
}