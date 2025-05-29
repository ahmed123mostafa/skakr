import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class StepperPageView extends StatelessWidget {
  const StepperPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "order date April 11, 2025".tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "2000 pounds".tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(child: StepperPage())
          ],
        ),
      ),
    );
  }
}

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;

  final List<Map<String, dynamic>> _steps = [
    {
      'title': 'the order has been received'.tr(),
      'image': "assets/images/Group 224.png",
      'description':
          'your order has been successfully received and will be processed soon. Thank you for choosing us'
              .tr(),
    },
    {
      'title': 'the order has been confirmed'.tr(),
      'image': "assets/images/Group 223.png",
      'description':
          'your order has been confirmed successfully and we are now in the process of preparing it for shipment to you'
              .tr()
    },
    {
      'title': 'the order is in the preparation stage'.tr(),
      "image": "assets/images/Group 37060.png",
      'description':
          'the order is currently in preparation. It will be ready for shipping as soon as possible'
              .tr(),
    },
    {
      'title': 'on the way to you'.tr(),
      "image": "assets/images/Group 220.png",
      'description':
          'the order is on its way to you. It will be delivered by shipping service soon'
              .tr(),
    },
    {
      'title': 'delivered'.tr(),
      "image": "assets/images/Group 221.png",
      'description':
          'your order has been successfully received, thank you for your purchase. We hope you are satisfied with your products'
              .tr(),
    },
  ];

  void _handleStepTap(int index) {
    setState(() {
      _currentStep = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: _steps.asMap().entries.map((entry) {
              final index = entry.key;
              final step = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 30.h),
                        ClipOval(
                          child: Container(
                            width: 40,
                            height: 40,
                            color: _currentStep >= index
                                ? AppColors.mainAppColor
                                : Colors.grey.shade300,
                            child: Center(
                              child: _currentStep > index
                                  ? const Icon(Icons.check,
                                      color: Color(0xffAAAAAA))
                                  : const Icon(Icons.check,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                        if (index != _steps.length - 1)
                          Container(
                            height: 120,
                            width: 2,
                            color: _currentStep >= index
                                ? AppColors.mainAppColor
                                : Colors.grey.shade300,
                          ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    TicketWidget(
                      color: Colors.white,
                      width: 250,
                      height: 150,
                      bordercolor: _currentStep == index
                          ? AppColors.mainAppColor
                          : Colors.white,
                      isCornerRounded: true,
                      child: InkWell(
                        onTap: () => _handleStepTap(index),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(height: 10.h),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        _currentStep >= index
                                            ? AppColors.mainAppColor
                                            : Colors.grey,
                                        BlendMode.srcIn,
                                      ),
                                      child: Image.asset(
                                        step['image'] as String,
                                        width: 30,
                                        height: 28,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      step['title'],
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600,
                                        color: _currentStep >= index
                                            ? AppColors.mainAppColor
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  step['description'],
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: _currentStep >= index
                                        ? AppColors.mainAppColor
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.isCornerRounded = false,
    this.shadow,
    this.bordercolor = Colors.transparent,
  });

  final double width;
  final double height;
  final Widget child;
  final Color color;
  final Color bordercolor;
  final bool isCornerRounded;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? shadow;

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          boxShadow: widget.shadow,
          color: widget.color,
          border: Border.all(color: widget.bordercolor, width: 1),
          borderRadius: widget.isCornerRounded
              ? BorderRadius.circular(20.0)
              : BorderRadius.circular(0.0),
        ),
        child: widget.child,
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: 30.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: 30.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
