import 'package:flutter/material.dart';

import '../../auth/login_page.dart';
import '../login_main_page.dart';

class FeatureShowCasePage extends StatefulWidget {
  const FeatureShowCasePage({super.key});

  @override
  State<FeatureShowCasePage> createState() => _FeatureShowCasePageState();
}

class _FeatureShowCasePageState extends State<FeatureShowCasePage> {
  final PageController pageController = PageController();
  int currentPage = 0;
  List<FeatureShowCaseModel> featureList = [
    FeatureShowCaseModel(
        subtitle:
            "Your Journey Starts Here: Seamless Car Rentals at Your Fingertips.",
        title: "Drive into Freedom",
        imgPath: "assets/doddle/img_1.png"),
    FeatureShowCaseModel(
        subtitle:
            "Seamless Car Rentals for Your Next Adventure: Fast, Easy, and Tailored to You.",
        title: "Onboard to Explore",
        imgPath: "assets/doddle/img_2.png"),
    FeatureShowCaseModel(
        subtitle:
            "Your Passport to Exploring: Start Your Journey with Hassle-Free Car Rentals.",
        title: "Road Trip Ready",
        imgPath: "assets/doddle/img_3.png"),
  ];

  onNext() {
    setState(() {
      pageController.nextPage(
          duration: const Duration(microseconds: 9000), curve: Curves.easeIn);
    });
  }

  goToNextPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
      return LoginMainPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isDark =
        Theme.of(context).textTheme.labelMedium!.color == Colors.white;

    buildFeatureDetail({required int index}) {
      var feature = featureList[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Center(
              child: Image.asset(feature.imgPath,
                  height: height * .35, width: width * .99),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: Text(
                feature.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: height * .015,
            ),
            Container(
              width: width * .85,
              child: Text(
                feature.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: isDark
                        ? Colors.white.withOpacity(.7)
                        : Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            Spacer(),
          ],
        ),
      );
    }

    buildBottomController() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(featureList.length, (id) {
                  if (id == currentPage) {
                    return Container(
                      width: 28,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        Icons.circle,
                        size: 12,
                        color: Colors.blue.withOpacity(.2),
                      ),
                    );
                  }
                }).toList()),
            SizedBox(
              height: height * .07,
            ),
            currentPage == 2
                ? Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800),
                        onPressed: goToNextPage,
                        child: Text(
                          'Get Started',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  )
                : Row(
                    children: [
                      TextButton(
                          onPressed: goToNextPage,
                          child: Text(
                            "Skip",
                            style: TextStyle(color: Colors.blue.shade800),
                          )),
                      Spacer(),

                      GestureDetector(
                        onTap: () {
                          onNext();
                        },
                        child: Container(
                          //   color: Colors.black,
                          width: 100,
                          height: 50,
                          child: Stack(
                            children: [
                              ...List.generate(
                                  3,
                                  (index) => Positioned(
                                      right: index * 10,
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue.shade700
                                              .withOpacity(.15 + index * .13),
                                        ),
                                      ))).toList(),
                              Positioned(
                                  right: 3 * 10,
                                  child: Container(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue.shade800,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),

                      // Container(
                      //   width: 90,
                      //   height: 40,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.blue.shade800),
                      //     onPressed: onNext,
                      //     child: Text(
                      //       'Next',
                      //       style: TextStyle(fontSize: 16, color: Colors.white),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (int pageId) {
                    setState(() {
                      currentPage = pageId;
                    });
                  },
                  itemCount: featureList.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return buildFeatureDetail(index: index);
                  }),
            ),
            buildBottomController()
          ],
        ),
      ),
    );
  }
}

class FeatureShowCaseModel {
  final String imgPath;
  final String title;
  final String subtitle;

  FeatureShowCaseModel(
      {required this.subtitle, required this.title, required this.imgPath});
}
