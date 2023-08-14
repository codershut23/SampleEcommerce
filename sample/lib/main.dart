import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample/LoginScreen.dart';

import 'flashscreen.dart';
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
   runApp(ProviderScope(
            child: MyApp(),
          ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
 @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: "/LoginPage",
      routes: {
        "/": (context) => SplashScreen(),
        "/VersionUpdate": (context) => LoginPage(
        ),
        "/LoginPage": (context) => LoginPage(),
      },
      
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: '/LoginPage',
          page: () => LoginPage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/',
          page: () => SplashScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/VersionUpdate",
          page: () => LoginPage(),
          binding: HomeBinding(),
        ),
      ],

      // home: _isLoggedInCheck==true ? TabBarWidget() : LoginPage(),
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends FullLifeCycleController with FullLifeCycleMixin {
  // Mandatory
  @override
  void onDetached() {
    print('HomeController - onDetached called');
  }

  // Mandatory
  @override
  void onInactive() {
    print('HomeController - onInative called');
  }

  // Mandatory
  @override
  void onPaused() {
    print('HomeController - onPaused called');
  }

  // Mandatory
  @override
  void onResumed() {
    print('HomeController - onResumed called');
  }
}




