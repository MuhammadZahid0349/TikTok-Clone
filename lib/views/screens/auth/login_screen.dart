import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/auth/signup_screen.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            65.h.heightBox,
            SizedBox(height: 180.h, child: Image.asset("assets/logo.png")),
            20.h.heightBox,
            Text(
              'Login',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            25.h.heightBox,
            Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            25.h.heightBox,
            Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextInputField(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            30.h.heightBox,
            showProgressBar == false
                ? Container(
                    width: Get.width - 40,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.r),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        // authController.loginUser(
                        //     _emailController.text, _passwordController.text);
                      },
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: const SimpleCircularProgressBar(
                      progressColors: [Colors.red, Colors.blue],
                      animationDuration: 3,
                      backColor: Colors.white,
                    ),
                  ),
            15.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SignupScreen());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20.sp, color: buttonColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
