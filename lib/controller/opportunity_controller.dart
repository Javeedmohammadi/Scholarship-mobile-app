

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


import '../model/base_request_model.dart';
import '../model/opportunity_model.dart';
import '../services/api_services.dart';

class OpportunityController extends GetxController {


  String? searchKeyWord;

  final PagingController<int, OpportunityModel> pageController = PagingController(firstPageKey: 1);

  final TextEditingController searchEditTextController = TextEditingController();

  Future<void> fetchAllOpportunity(int pageKey) async {

    try {
      // Fetch all data from api resource page wise.
      APIService.instance.getAllOpportunities(
          BaseRequestModel(
              page: pageKey,
              searchKeyWord: searchKeyWord
          )).then((value){

        if(!value.hasMore){
          pageController.appendLastPage(value.opportunities);
        }
        else {
          pageController.appendPage(value.opportunities, pageKey+1);
        }

      },onError: (error){
        pageController.error = error;
      });

    } catch (error) {
      pageController.error = error;
    }
  }

}