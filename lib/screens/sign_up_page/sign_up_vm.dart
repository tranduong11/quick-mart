import 'package:flutter/cupertino.dart';

class SignUpVm extends ChangeNotifier {
  TextEditingController ctr_name = TextEditingController();
  TextEditingController ctr_email = TextEditingController();
  TextEditingController ctr_password = TextEditingController();

  bool password = true;

  void checkPassWord() {
    password = !password;
    notifyListeners();
  }
}
