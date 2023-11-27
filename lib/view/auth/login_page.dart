import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vn_friendship/view/auth/verify_page.dart';

import '../../controller/auth/login_controller.dart';
import '../../unit.dart';

class LoginPage extends StatelessWidget {
  final loginController = Get.put(LoginController());
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        title: const Text(
          'VN Friendship',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: kWidth,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(kWidth * 0.03),
                    child: Column(
                      children: [
                        const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: kHeight * 0.04,
                        ),
                        SizedBox(
                          child: TextFormField(
                            controller: loginController.phonenumber,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Số điện thoại',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(
                                Icons.phone_android,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kHeight * 0.02,
                        ),
                        SizedBox(
                          width: kWidth,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              backgroundColor: pColor, // Background color
                            ),
                            onPressed: () => loginController.submit(),
                            child: const Text('Tiếp tục',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}