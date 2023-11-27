import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phonenumber = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> submit() async {
    await auth.verifyPhoneNumber(
      phoneNumber: phonenumber.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == 'invalid-phone-number') {
          Get.snackbar('Đăng nhâp thất bại', 'Số điện thoại không hợp lệ!');
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = '123456';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        Get.toNamed('/verifyPage');
        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        
      },
    );
  }
}