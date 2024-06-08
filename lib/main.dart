import 'package:bloc/bloc.dart';
import 'package:e_commerce_route/ui/auth/login_screen/login_screen.dart';
import 'package:e_commerce_route/ui/auth/register_screen/register_screen.dart';
import 'package:e_commerce_route/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_route/ui/home/home_screen/home_screen_view.dart';
import 'package:e_commerce_route/ui/home/product_details/product_details_view.dart';
import 'package:e_commerce_route/ui/splash/splash_screen.dart';
import 'package:e_commerce_route/ui/utils/my_theme.dart';
import 'package:e_commerce_route/ui/utils/shared_pre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_bloc_abserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPre.init();
  String route;
  var user = SharedPre.getDate(key: "Token");
  if (user == null) {
    route = SplashScreen.routeName;
  } else {
    route = HomeScreenView.routeName;
  }
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(route: route));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: route,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreenView.routeName: (context) => HomeScreenView(),
          ProductDetailsView.routeName: (context) => ProductDetailsView(),
          CartScreen.routeName:(context)=>CartScreen()
        },
        theme: MyTheme.mainTheme,
      ),
    );
  }
}
