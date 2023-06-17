import 'package:flutter/material.dart';
import 'package:todo_list_application/models/onboarding_model.dart';
import 'package:todo_list_application/pages/home_page.dart';

import '../custom_widget.dart';
import '../main.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          //Top Section
          Expanded(
            flex: 8,
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: onBoardingList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Image.asset(
                          onBoardingList[index].image,
                          height: 312,
                          width: 312,
                        ),
                        Text(
                          onBoardingList[index].title,
                          style: boldStyle(35, Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${onBoardingList[index].subTitle}",
                          style: regularStyle(18, Colors.black),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }),
          ),
          //dot design Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingList.length,
                  (index) => buildDot(index, context),
            ),
          ),
          //Button Section
          Expanded(
            flex: 2,
            child: SizedBox(

                child: InkWell(
                  onTap: () {
                    if (currentIndex == onBoardingList.length - 1) {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomePage()));
                    }
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                  child: Center(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).primaryColor,
                      ),

                        child: Center(
                          child: Text(
                            currentIndex == onBoardingList.length - 1
                                ? "Continue"
                                : "Next",
                            style: boldStyle(25, Colors.white),
                          ),
                        ),
                      ),
                  ),
                  ),
                ),
              ),


        ],
      ),
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
