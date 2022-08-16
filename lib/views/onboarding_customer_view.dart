import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mazare3/controllers/onboarding_customer_controller.dart';
import 'package:mazare3/views/home_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingCustomerView extends StatelessWidget {
  OnboardingCustomerView({Key? key}) : super(key: key);
  final _controller = OnboardingCustomerController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: 
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            _controller.onboardingPages[index].imageAsset),
                        SizedBox(height: 32),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                
                ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            TextButton(onPressed: (){
              Get.to(HomeView());
            }, child: const Text('SKIP')),
            Center(
              child: SmoothPageIndicator(
                controller: _controller.pageController,
                count: _controller.onboardingPages.length,
                effect: const WormEffect(
                  spacing:16,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.teal
                   ),

                   onDotClicked: (index) => _controller.jumpToPage(index),
                   



                   ),
            ),
            TextButton(onPressed: _controller.forwardAction, 
            child: Obx(()
            {return Text(_controller.isLastPage? 'START' : 'NEXT');}
            ),
            ),
          ],

        ),
      ),
    );
  }
}
