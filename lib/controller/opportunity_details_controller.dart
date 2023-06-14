

import 'package:get/get.dart';

import '../model/base_request_model.dart';
import '../model/opportunity_model.dart';
import '../services/api_services.dart';
import '../services/base_client.dart';

class OpportunityDetailsController extends GetxController {


  final networkState = NetworkState.loading.obs;
  final error = "Something went wrong".obs;
  final opportunity = Rxn<OpportunityDetailsResponseModel?>();


  Future<void> fetchOpportunity(String id) async {


    try {
      // Fetch all data from api resource page wise.
      APIService.instance.getOpportunity(BaseRequestModel(id: id,)).then((value){
        opportunity.value = value;

      },onError: (error){
        this.error.value = error.toString();
        networkState.value = NetworkState.failed;
      });

    } catch (error) {
      this.error.value = error.toString();
      networkState.value = NetworkState.failed;
    }
  }

}