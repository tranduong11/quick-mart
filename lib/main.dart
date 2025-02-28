import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quick_mart/data_local/hive_db.dart';
import 'package:quick_mart/frebase/firebase_messaging/firebase_messaging.dart';
import 'package:quick_mart/generated/l10n.dart';
import 'package:quick_mart/providers/profile_provider.dart';
import 'package:quick_mart/routers/app_routers.dart';
import 'package:quick_mart/screens/cart_page/my_cart_vm.dart';
import 'package:quick_mart/screens/categories_page/categories_vm.dart';
import 'package:quick_mart/screens/categories_page/product_detail_page/product_detail_vm.dart';
import 'package:quick_mart/screens/categories_page/product_page/product_vm.dart';
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
  FirebaseMessaging.onBackgroundMessage(FirebaseApi().handlerMessaging);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseApi firebaseApi = FirebaseApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    firebaseApi.initNotification(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
        ChangeNotifierProvider(create: (_) => MyCartVm()),
        ChangeNotifierProvider(create: (_) => ProductVm()),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.instance.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('vi', ''),
        ],
        locale: Locale('en', ''),
      ),
    );
  }
}
