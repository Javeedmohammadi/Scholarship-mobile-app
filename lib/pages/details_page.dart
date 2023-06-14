import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_html/flutter_html.dart';
import '../controller/opportunity_details_controller.dart';
import '../model/opportunity_model.dart';
import '../services/base_client.dart';
import '../widgets/details_tile.dart';
import '../widgets/image_widget.dart';

class DetailsPage extends StatefulWidget {

  const DetailsPage({Key? key, required this.opportunity})
      : super(key: key);
  final OpportunityModel opportunity;


  static String routeName = "/DetailsPage";

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  final opportunityDetailsController = Get.find<OpportunityDetailsController>();


  @override
  void initState() {
    super.initState();

    opportunityDetailsController.fetchOpportunity(widget.opportunity.id!);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            Obx(() {



                return SliverAppBar(
                  backgroundColor: Colors.grey[300],
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.grey),
                    onPressed: () {
                      finish(context);
                    },
                  ).visible(innerBoxIsScrolled),
                  title: Text(("${opportunityDetailsController.opportunity.value?.opportunity.title}"),
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                      .visible(innerBoxIsScrolled),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.subdirectory_arrow_right,
                          color: Color(0xffc79a9a)),
                      onPressed: () {},
                    ).visible(innerBoxIsScrolled),
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Color(0xffc79a9a)),
                      onPressed: () {},
                    ).visible(innerBoxIsScrolled),
                  ],
                  leadingWidth: 30,
                  pinned: true,
                  elevation: 0.5,
                  expandedHeight: 450,
                  flexibleSpace: FlexibleSpaceBar(
                      titlePadding:
                      const EdgeInsets.only(bottom: 66, left: 30, right: 50),
                      collapseMode: CollapseMode.parallax,
                      background: Column(
                        children: [
                          Stack(
                            children: [
                              ImageWidget(
                                height: 300,
                                width: double.infinity,
                                errorAsset: "assets/images/food_ic_intro.jpg",
                                fit: BoxFit.cover,
                                imageUrl: '${opportunityDetailsController.opportunity.value?.opportunity.image}',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: radius(100),
                                      color: context.cardColor,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    margin:
                                    const EdgeInsets.only(left: 16, top: 30),
                                    child: const Icon(Icons.arrow_back,
                                        color: Color(0xffc79a9a)),
                                  ).onTap(() {
                                    finish(context);
                                  }, borderRadius: radius(100)),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: radius(100),
                                          color: context.cardColor,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        margin: const EdgeInsets.only(
                                            right: 16, top: 30),
                                        child: const Icon(
                                            Icons.subdirectory_arrow_right,
                                            color: Color(0xffc79a9a)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: radius(100),
                                          color: context.cardColor,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        margin: const EdgeInsets.only(
                                            right: 16, top: 30),
                                        child: const Icon(Icons.favorite,
                                            color: Color(0xffc79a9a)),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            color: Colors.grey[300],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(("${opportunityDetailsController.opportunity.value?.opportunity.title}"), maxLines: 4),
                                8.height,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.date_range,
                                        color: Color(0xffc79a9a), size: 16),
                                    4.width,
                                    Text("${opportunityDetailsController.opportunity.value?.opportunity.publishedDate}",
                                        style: secondaryTextStyle(
                                            size: 12, color: Colors.black))
                                  ],
                                ),
                                8.height,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.timelapse,
                                        color: Color(0xffc79a9a), size: 16),
                                    4.width,
                                    Text("${opportunityDetailsController.opportunity.value?.opportunity.deadlineDate}",
                                        style:
                                        secondaryTextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              }
            )
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xfffff7f7),
            borderRadius: radiusOnly(topLeft: 32, topRight: 32),
          ),
          child: SingleChildScrollView(
            child:
            Container(padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xff520d1c).withAlpha(30),
                          borderRadius: radius(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: Color(0xff520d1c),
                          )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: Image.asset('assets/images/food_ic_intro.jpg',height: 50, width: 50, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          16.width,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text( "Opportunity Organization ",
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 18, )),
                                8.height,


                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    DetailsTile(title: "Language Requirement",subtitle: "Not Required",),
                    DetailsTile(title: "Gender",subtitle: "${opportunityDetailsController.opportunity.value?.opportunity.gender}",),
                    DetailsTile(title: "Level",subtitle: "Non-Degree /Short program",),
                    DetailsTile(title: "Eligible Region/Countries",subtitle: "All",),
                    DetailsTile(title: "Medium of Instruction",subtitle: "English",),
                    DetailsTile(title: "Field of study",subtitle: "Global Health",),
                    DetailsTile(title: "Opportunity ID",subtitle: "35069",),
                    DetailsTile(title: "Funding Type",subtitle: "Fully Funded",),
                    Html(data: "${opportunityDetailsController.opportunity.value?.opportunity.longDescription}"),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
