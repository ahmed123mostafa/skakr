import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class FrequentlyQuestion extends StatelessWidget {
  FrequentlyQuestion({super.key});
  List<String> items = [
    "1. هناك حقيقة مثبتة منذ زمن طويل وهي أن",
    "2. المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز ",
    "3.  المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز  ",
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.5),
          centerTitle: true,
          title: Text(
            "frequently_asked_questions".tr(),
            style: TextStyle(
              color: AppColors.mainAppColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          leading: Icon(
            Icons.arrow_back,
            color: AppColors.mainAppColor,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ExpandableNotifier(
                      child: ExpandablePanel(
                        header: Container(
                          color: AppColors.mainAppColor,
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                items[index],
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Builder(
                                builder: (context) {
                                  final controller = ExpandableController.of(
                                      context,
                                      required: true)!;
                                  return Icon(
                                    controller.expanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        collapsed: const SizedBox.shrink(),
                        expanded: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء للصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص...",
                            style: TextStyle(
                                color: Color(0xff181818),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: false,
                          tapHeaderToExpand: true,
                          tapBodyToCollapse: true,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
