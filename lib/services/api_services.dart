import 'dart:async';
import 'dart:convert';

import '../model/base_request_model.dart';
import '../model/opportunity_model.dart';
import 'base_client.dart';



class APIService extends BaseClient {


  APIService._instantiate();
  static final APIService instance = APIService._instantiate();


  Future<OpportunityResponseModel> getAllOpportunities(BaseRequestModel request) async {

    var params = {
      'page': request.page,
      'per_page' : 20,
    };
    var response = await BaseClient().post("getAllOpportunities", params).catchError(handleError);
    return OpportunityResponseModel.fromJson(jsonDecode(response));
  }


  Future<OpportunityDetailsResponseModel> getOpportunity(BaseRequestModel request) async {

    var params = {
      'id': request.id,
    };
    var response = await BaseClient().post("getOpportunity", params).catchError(handleError);
    return OpportunityDetailsResponseModel.fromJson(jsonDecode(response));
  }

}
