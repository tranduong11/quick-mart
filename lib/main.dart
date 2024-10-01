import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/data_local/hive_db.dart';
import 'package:quick_mart/providers/profile_provider.dart';
import 'package:quick_mart/routers/app_routers.dart';
import 'package:quick_mart/screens/categories_page/categories_vm.dart';
import 'package:quick_mart/screens/categories_page/product_detail_page/product_detail_vm.dart';
import 'package:quick_mart/screens/home_page/home_page_vm.dart';
import 'package:quick_mart/screens/login_page/login_page_vm.dart';
import 'package:quick_mart/screens/main_page/main_page_vm.dart';
import 'package:quick_mart/screens/profiles_page/profile_page_vm.dart';
import 'package:quick_mart/screens/sign_up_page/sign_up_vm.dart';
import 'package:quick_mart/screens/splashs_page/splash_vm.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  HiveData.instance.initHive();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashVm()),
        ChangeNotifierProvider(create: (_) => LoginVm()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => SignUpVm()),
        ChangeNotifierProvider(create: (_) => MainPageVm()),
        ChangeNotifierProvider(create: (_) => HomePageVm()),
        ChangeNotifierProvider(create: (_) => CateGoRiVm()),
        ChangeNotifierProvider(create: (_) => ProductDetailVm()),
        ChangeNotifierProvider(create: (_) => ProfilePageVm()),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
