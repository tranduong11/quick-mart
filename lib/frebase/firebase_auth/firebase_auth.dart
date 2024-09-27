import 'package:firebase_auth/firebase_auth.dart';

class AuthLogin {
  AuthLogin._();

  static AuthLogin? _instance;

  static AuthLogin get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AuthLogin._();
      return _instance!;
    }
  }

  // Đăng nhập bằng email và mật khẩu
  Future<void> signIn(String email, String password, String check) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in: ${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
  }

  Future<User?> checkLoginEmail(String message) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    if (user != null) {
      message = 'Đăng nhập thành công';
    } else {
      message = 'Tài khoản chưa được đăng ký!!!';
    }
    return null;
  }

  Future<void> otpEmail() async {
    final FirebaseAuth _auth = await FirebaseAuth.instance;
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      print("Email xác nhận đã được gửi.");
    } else {
      print('Xác nhận chưa được gửi!!!');
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Registered user account: ${userCredential.user}');
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Đăng xuất
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    print('Đã đăng xuất tài khoản ${FirebaseAuth.instance.currentUser}');
  }
}
