class DeliveryTimeModel {
  final int id;
  final DateTime startTime;
  final DateTime endTime;
  final int orderNumber;
  final DateTime nowStartTime;
  final DateTime nowEndTime;

  DeliveryTimeModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.orderNumber,
    required this.nowStartTime,
    required this.nowEndTime,
  });

  factory DeliveryTimeModel.fromJson(Map<String, dynamic> json) {
    return DeliveryTimeModel(
      id: json['ID'],
      startTime: DateTime.parse(json['StartTime']),
      endTime: DateTime.parse(json['EndTime']),
      orderNumber: json['OrderNumber'],
      nowStartTime: DateTime.parse(json['NowStartTime']),
      nowEndTime: DateTime.parse(json['NowEndTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'StartTime': startTime.toIso8601String(),
      'EndTime': endTime.toIso8601String(),
      'OrderNumber': orderNumber,
      'NowStartTime': nowStartTime.toIso8601String(),
      'NowEndTime': nowEndTime.toIso8601String(),
    };
  }
}
