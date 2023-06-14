import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:get/get.dart';
import '../controller/opportunity_controller.dart';
import '../model/opportunity_model.dart';
import '../model/scholarships_data.dart';

import '../widgets/image_widget.dart';
import '../widgets/my_card.dart';
import 'details_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  static String routeName="/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final opportunityController = Get.find<OpportunityController>();

  @override
  void initState() {
    opportunityController.pageController.addPageRequestListener((pageKey) {
      opportunityController.fetchAllOpportunity(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              pinned: false,
              snap: true,
              stretch: true,
              elevation: 0,
              expandedHeight: 200,
              collapsedHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle
                ],
                background: Container(
                    color: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [

                          Icon(Icons.dashboard_outlined),
                          Spacer(),
                          Icon(Icons.notifications),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(Icons.person))
                        ]),
                        const SizedBox(
                          height: 16,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Your Favorite!",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Color(0x95E9EBF0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey[400],
                                    ),
                                    // icon: ,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        gapPadding: 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        gapPadding: 10),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(Icons.dashboard_outlined))
                          ],
                        )
                      ],
                    )),
              )),

          PagedSliverList<int, OpportunityModel>(
            pagingController: opportunityController.pageController,
            builderDelegate: PagedChildBuilderDelegate<OpportunityModel>(
              itemBuilder: (context, item, index) => MyCard(opportunity: item),
            ),
          ),




        ],
      )),
    );
  }
}
