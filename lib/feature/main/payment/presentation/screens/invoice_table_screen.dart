import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_bottom.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding:const  EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الفاتورة",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      infoRow("رقم الفاتورة", "114521", sized: 5),
                    const   Spacer(),
                      infoRow("تاريخ الفاتورة", "2025/4/25", sized: 5),
                    ],
                  ),
                  infoRow("طريقة الدفع", "الدفع عند الاستلام", sized: 5),
                  infoRow("إجمالي الطلب", "105.00", sized: 5),
                  infoRow("الخصم / الإضافة", "0.000", sized: 5),
                  infoRow("السعر النهائي", "105.00", sized: 5),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "الأصناف",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainAppColor),
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
                    _tableDataRow(
                        "1", "بيبسي 1.5 لتر كرتونة", "2", "30.00", "60.00"),
                    _tableDataRow(
                        "2", "مياه 1.5 لتر كرتونة", "2", "65.00", "130.00"),
                    _tableDataRow("3", "سبرايت كرتونة", "2", "130.00", "260.0"),
                    _tableDataRow("4", "فانتا كرتونة", "2", "150.00", "300.0"),
                    _tableDataRow(
                        "5", "كوكاكولا كرتونة", "2", "150.00", "300.0"),
                    _tableDataRow(
                        "6", "ببسي زجاج 250مل", "1", "20.00", "20.00"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                  width: 212,
                  height: 31,
                  text: "متابعة الطلب",
                  onPressed: () {}),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                  width: 212,
                  height: 31,
                  text: "الصفحة الرئيسية",
                  onPressed: () {}),
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
    return const TableRow(children: [
      _TableHeader(text: "رقم"),
      _TableHeader(text: "اسم الصنف"),
      _TableHeader(text: "الكمية"),
      _TableHeader(text: "السعر"),
      _TableHeader(text: "إجمالي"),
    ]);
  }

  TableRow _tableDataRow(
      String id, String name, String qty, String price, String total) {
    return TableRow(children: [
      _TableCell(text: id),
      _TableCell(
        text: name,
        imagePath: "assets/images/image (5).png",
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
            fontSize: 12.sp,
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
          color: AppColors.backgroundAppColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                child: Image.asset(
                  imagePath!,
                  width: 24,
                  height: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
