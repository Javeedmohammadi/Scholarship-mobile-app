

import 'package:get/get.dart';

import 'controller/opportunity_controller.dart';
import 'controller/opportunity_details_controller.dart';


Future<void> init() async {
  Get.put(OpportunityController());
  Get.put(OpportunityDetailsController());
}