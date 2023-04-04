import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      height: 30.h,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 10.h,
            ),
            width: 38.w,
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                255,
                250,
                45,
                108,
              ),
              borderRadius: BorderRadius.circular(7.r),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 10.h,
            ),
            width: 38.w,
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                255,
                32,
                211,
                234,
              ),
              borderRadius: BorderRadius.circular(7.r),
            ),
          ),
          Center(
            child: Container(
              height: Get.height,
              width: 38.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
