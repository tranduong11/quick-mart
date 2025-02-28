import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/routers/app_router_path.dart';

class LoginVm extends ChangeNotifier {
  TextEditingController ctrEmail = TextEditingController(text: "a@gmail.com");
  TextEditingController ctrPassword = TextEditingController(text: "1234567");
  bool isLoading = false;
  bool hintPass = true;

  Future<void> signInApp({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: ctrEmail.text,
        password: ctrPassword.text,
      );
      if (userCredential.user?.email != null) {
        Navigator.pushReplacementNamed(context, AppRoutePath.mainPage);
      } else {
        print('Lỗi đăng nhập!!!');
      }
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();
      if (e.code == 'user-not-found') {
        print('Email chua duoc dang ky.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
  }

  Future signInWithGoogle() async {}

  void onChangeHinPass() {
    hintPass = !hintPass;
    notifyListeners();
  }
}
