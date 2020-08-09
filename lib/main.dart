import 'screens/home_navigator.dart';
import 'ui/helper/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: AppStrings.appName,
      initialRoute: AppStrings.pageHomeNavigator,
      routes: {
        AppStrings.pageHomeNavigator: (context) => HomeNavigator(),
        AppStrings.pageHome: (context) => HomeScreen(),
      },
    );
  }
}
