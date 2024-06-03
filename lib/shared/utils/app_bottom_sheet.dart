import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/constants/app_color.dart';

void modalBottomSheet(
    {required BuildContext context,
    required Widget child,
    double? height,
    bool? isScrollControlled}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled ?? true,
      builder: (context) => Container(
            height: height ?? MediaQuery.of(context).size.height * .5,
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Column(
              children: [
                Container(
                  height: 3.h,
                  width: 50.w,
                  margin: EdgeInsets.only(top: 16.h),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                ),
                12.heightBox,
                Expanded(child: child)
              ],
            ),
          ));
}
