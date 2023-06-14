import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scholer/pages/home_page.dart';
import 'package:scholer/routes.dart';

import 'di.dart' as di;
import 'services/my_http_overrides.dart';

void main() async{

  HttpOverrides.global= MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp( const MyApp());
}


class MyApp extends StatelessWidget {

   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'simple scholarship',
      getPages: Routes.pages,
      initialRoute: Home.routeName,
    );
  }
}
