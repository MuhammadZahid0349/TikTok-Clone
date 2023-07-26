import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/auth/auth_controller.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              50.h.heightBox,
              Text(
                'Tiktok Clone',
                style: TextStyle(
                  fontSize: 30.sp,
                  color: buttonColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Create a Account',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              25.h.heightBox,
              GestureDetector(onTap: () {
                authController.pickImage();
                // authController.getImage();
              }, child: Obx(() {
                return CircleAvatar(
                  radius: 64.r,
                  backgroundImage:
                      authController.isProfilePicPathset.value == true
                          ? FileImage(File(authController.profilePicPath.value))
                              as ImageProvider
                          : const AssetImage("assets/p.jpg"),
                  // backgroundImage: authController.imagePath.isNotEmpty
                  // ? FileImage(authController.imagePath as File)
                  // : null,
                  backgroundColor: Colors.white,
                );
              })),

              // Stack(
              //   children: [
              //     CircleAvatar(
              //       radius: 64.r,
              //       backgroundImage: AssetImage("assets/p.jpg"),
              //       backgroundColor: Colors.white,
              //     ),

              //     Positioned(
              //       bottom: -10,
              //       left: 80,
              //       child: IconButton(
              //         onPressed: () {
              //           authController.pickImage();
              //         },
              //         icon: const Icon(
              //           Icons.add_a_photo,
              //         ),
              //       ),
              //     ),

              //   ],
              // ),
              15.h.heightBox,
              Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                child: TextInputField(
                  controller: _usernameController,
                  labelText: 'Username',
                  icon: Icons.person,
                ),
              ),
              15.h.heightBox,
              Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                child: TextInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                ),
              ),
              15.h.heightBox,
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
              40.h.heightBox,
              Container(
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
                    authController.registerUser(
                        _usernameController.text,
                        _emailController.text,
                        _passwordController.text,
                        authController.profilePhoto);
                  },
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              25.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20.sp, color: buttonColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
