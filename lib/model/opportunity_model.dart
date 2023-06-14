
import 'base_response_model.dart';
import 'organization.dart';


class OpportunityModel{

  String? id;
  String? title;
  String? image;
  String? organizationLogo;
  String? publishedDate;
  String? deadlineDate;
  String? longDescription;
  String? gender;
  Organization? organization;
  List<String>? countries;


  OpportunityModel({
    this.id,
    this.title,
    this.image,
    this.publishedDate,
    this.deadlineDate,
    this.longDescription,
    this.organizationLogo,
    this.gender,
    this.organization,
    this.countries,
    status,
    message,
    responseCode
  });

  factory OpportunityModel.fromJson(Map<String,dynamic> json){
    return OpportunityModel(
        id: json['id'],
        title: json['title'],
        organizationLogo: json['organization_logo'],
        deadlineDate: json['deadline'],
      gender: json['gender'],
      longDescription: json['long_description'],
      publishedDate: json['published_date'],
      // organization: Organization.fromJson(json['organization']),
      // countries: json['countries'],


    );
  }

}



class OpportunityResponseModel extends BaseResponseModel {

  final List<OpportunityModel> opportunities;
  final bool hasMore;
  final int? total;


  OpportunityResponseModel({
    required this.opportunities,
    required this.hasMore,
    required this.total,
    status,
    message,
    responseCode,
  }) : super(status: status,message: message,responseCode: responseCode);

  factory OpportunityResponseModel.fromJson(Map<String, dynamic> json) {
    return OpportunityResponseModel(
      status: json['status'],
      message: json['message'],
      responseCode: json['response_code'],
      hasMore: json['data']['has_more'] as bool,
      total: json['data']['total'] as int,
      opportunities: (json['data']['opportunities'] as List<dynamic>)
          .map((e) => OpportunityModel.fromJson(e))
          .toList(),
    );
  }
}

class OpportunityDetailsResponseModel extends BaseResponseModel {

  final OpportunityModel opportunity;

  OpportunityDetailsResponseModel({
    required this.opportunity,
    status,
    message,
    responseCode,
  }) : super(status: status, message: message, responseCode: responseCode);

  factory OpportunityDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return OpportunityDetailsResponseModel(
      status: json['status'],
      message: json['message'],
      responseCode: json['response_code'],
      opportunity: OpportunityModel.fromJson(json['data']),
    );
  }
}