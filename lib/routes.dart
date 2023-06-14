
import 'package:get/get.dart';
import 'package:scholer/pages/details_page.dart';
import 'package:scholer/pages/home_page.dart';


class Routes {


  static List<GetPage> pages = [

    GetPage(name: Home.routeName, page:()=> const Home() ),
  ];


}