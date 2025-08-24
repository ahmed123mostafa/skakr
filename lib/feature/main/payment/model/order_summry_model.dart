class OrderSummryModel {
  final String orderDate;
  final String deliveryDate;
  final String customerPhone;
  final String email;
  final String customerAddress;
  final String? districtName;
  final int payID;
  final String apartment;
  final double totalValue;
  final double additions;
  final double discount;
  final double finalValue;
  final int onlineStoreId;
  final double discountCardValue;
  final List<OrderItem> orderItems;

  OrderSummryModel({
    required this.orderDate,
    required this.deliveryDate,
    required this.customerPhone,
    required this.email,
    required this.customerAddress,
    this.districtName,
    required this.payID,
    required this.apartment,
    required this.totalValue,
    required this.additions,
    required this.discount,
    required this.finalValue,
    required this.onlineStoreId,
    required this.discountCardValue,
    required this.orderItems,
  });


  factory OrderSummryModel.fromJson(Map<String, dynamic> json) {
    return OrderSummryModel(
      orderDate: json['OrderDate'],
      deliveryDate: json['DeliveryDate'],
      customerPhone: json['CustomerPhone'],
      email: json['email'],
      customerAddress: json['OrderAddress'],
      districtName: json['DistrictName'] != "null" ? json['DistrictName'] : null,
      payID: json['PayID'],
      apartment: json['Apartment'],
      totalValue: json['TotalValue'].toDouble(),
      additions: json['Additions'].toDouble(),
      discount: json['Discount'].toDouble(),
      finalValue: json['FinalValue'].toDouble(),
      onlineStoreId: json['OnlineStoreId'],
      discountCardValue: json['DiscountCardValue'].toDouble(),
      orderItems: (json['OrderItems'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'OrderDate': orderDate,
      'DeliveryDate': deliveryDate,
      'CustomerPhone': customerPhone,
      'email': email,
      'CustomerAddress': customerAddress,
      'DistrictName': districtName ?? "null",
      'PayID': payID,
      'Apartment': apartment,
      'TotalValue': totalValue,
      'Additions': additions,
      'Discount': discount,
      'FinalValue': finalValue,
      'OnlineStoreId': onlineStoreId,
      'DiscountCardValue': discountCardValue,
      'OrderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}

class OrderItem {
  final int itemID;
  final int quantity;
  final double price;
  final String nameAr;
  final String nameEn;
  final String barcode;
  final double priceBeforeDiscount;
  final String image;
  final double stockQuantity;
  final double billCustomerQty;

  OrderItem({
    required this.itemID,
    required this.quantity,
    required this.price,
    required this.nameAr,
    required this.nameEn,
    required this.barcode,
    required this.priceBeforeDiscount,
    required this.image,
    required this.stockQuantity,
    required this.billCustomerQty,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      itemID: json['productId'] ?? 0,
      quantity: json['quantity'] != null
          ? (json['quantity'] is int
          ? json['quantity']
          : (json['quantity'] as num).toInt())
          : 0,
      price: (json['priceAfterDiscount'] ?? 0).toDouble(),
      nameAr: json['ItemArMame'] ?? "",
      nameEn: json['ItemEnMame'] ?? "",
      barcode: json['barcode'] ?? "",
      priceBeforeDiscount: (json['priceBeforeDiscount'] ?? 0).toDouble(),
      image: json['image'] ?? "",
      stockQuantity: (json['stockQuantity'] ?? 0).toDouble(),
      billCustomerQty: (json['BillCustomerQty'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ItemID': itemID,
      'Quantity': quantity,
      'Price': price,
      'ItemArMame': nameAr,
      'ItemEnMame': nameEn,
      'barcode': barcode,
      'priceBeforeDiscount': priceBeforeDiscount,
      'image': image,
      'stockQuantity': stockQuantity,
      'BillCustomerQty': billCustomerQty,
    };
  }
}

