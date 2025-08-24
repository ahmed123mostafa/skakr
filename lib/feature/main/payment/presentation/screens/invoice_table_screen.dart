import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_bottom.dart';
import 'package:settings_app/feature/main/home/presentation/home_view.dart';
import 'package:settings_app/feature/main/home/presentation/screens/home_screen.dart';
import 'package:settings_app/feature/main/list/PreviousOrders/screen/previous_orders.dart' show MyPreviousOrders;
import 'package:settings_app/feature/main/list/presentation/screens/prevuis_order/screen/previous_order.dart';

import '../../model/order_summry_model.dart';

class InvoiceScreen extends StatelessWidget {
  OrderSummryModel? orderSummryModel;
  dynamic invoiceNumber;
InvoiceScreen({super.key,required this.orderSummryModel,required this.invoiceNumber});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "bill".tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      infoRow("invoice number".tr(), "${invoiceNumber??''}", sized: 5),
                      const Spacer(),
                      infoRow("invoice date".tr(), "${orderSummryModel?.orderDate}", sized: 5),
                    ],
                  ),
                  infoRow("payment method".tr(), "cash on delivery".tr(),
                      sized: 5),
                  Row(
                    children: [
                      infoRow("total quantity".tr(),"${orderSummryModel?.orderItems.length}", sized: 5),
                      const Spacer(),
                      infoRow("total invoice".tr(), "${orderSummryModel?.totalValue}", sized: 5),
                    ],
                  ),
                  Row(
                    children: [
                      infoRow("deduction / addition".tr(), "${orderSummryModel?.additions}", sized: 5),
                      const Spacer(),
                      infoRow("the final price".tr(), "${orderSummryModel?.finalValue}", sized: 5),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: context.locale == const Locale('ar')
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  "categories".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(30),
                    1: FlexColumnWidth(6),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  border: TableBorder.symmetric(
                      inside: BorderSide(color: AppColors.mainAppColor)),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _tableHeaderRow(),
                    ...List.generate(orderSummryModel!.orderItems.length, (index) {
                      final item = orderSummryModel!.orderItems[index];
                      return _tableDataRow(
                        id:
                        "${index + 1}",
name:
                        item.nameAr,
                        qty:

                        item.quantity.toString(),
                        price:
                        item.priceBeforeDiscount.toStringAsFixed(2),
                       total:  (item.priceBeforeDiscount * item.quantity).toStringAsFixed(2),
                        imageItem:
                        item.image,
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                  width: 212,
                  height: 31,
                  text: "tracking the order".tr(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyPreviousOrders()));
                  }),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                  width: 212,
                  height: 31,
                  text: "home page".tr(),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeView()));
                  }),
              const SizedBox(height: 24),
              Center(
                child: Image.asset("assets/images/Group 195.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _tableHeaderRow() {
    return TableRow(children: [
      _TableHeader(text: "number".tr()),
      _TableHeader(text: "product name".tr()),
      _TableHeader(text: "amount".tr()),
      _TableHeader(text: "price piece".tr()),
      _TableHeader(text: "total".tr()),
    ]);
  }

  TableRow _tableDataRow(
      {required String id,
      required String name,
      required String qty,
      required String price,
      required String total,
      required String imageItem}) {
    return TableRow(children: [
      _TableCell(text: id),
      _TableCell(
        text: name,
        imagePath: imageItem,
      ),
      _TableCell(text: qty),
      _TableCell(text: price),
      _TableCell(text: total),
    ]);
  }

  Widget infoRow(String label, String value, {required double sized}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(color: AppColors.mainAppColor, fontSize: 14),
          ),
          SizedBox(width: sized),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  final String text;

  const _TableHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.mainAppColor,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 6.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.backgroundAppColor),
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String text;
  final String? imagePath;

  const _TableCell({required this.text, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 9),
              ),
            ),
            if (imagePath != null)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: InkWell(
                  onTap: (){
                    print(imagePath);
                  },
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.network(
                      imagePath!,

                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, size: 24),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                    ),
                  )

                ),
              ),
          ],
        ),
      ),
    );
  }
}
