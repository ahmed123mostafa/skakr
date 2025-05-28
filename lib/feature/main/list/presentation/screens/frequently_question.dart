import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class FrequentlyQuestion extends StatelessWidget {
  FrequentlyQuestion({super.key});
  List<String> items = [
    "1.there_is_a_long_established_fact_that".tr(),
    "2.there_is_a_long_established_fact_that".tr(),
    "3.there_is_a_long_established_fact_that".tr(),
   
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.mainAppColor,
            ),
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
                        expanded: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "there_is_a_long_established_fact_that_the_readable_content_of_a_page_will_distract_the_reader_from_focusingon_the_text's_outer_appearance_or_the_layout_of_the_paragraphson_the_page_they_are_reading.therefore,the_Lorem_Ipsum_method_is_used."
                                .tr(),
                            style: const TextStyle(
                                color: Color(0xff181818),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
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
