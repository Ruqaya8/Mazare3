import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mazare3/controllers/farmer_or_customer_controller.dart';
import 'package:mazare3/views/home_view.dart';
import 'package:mazare3/views/onboarding_customer_view.dart';
import 'package:mazare3/views/onboarding_farmer_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FarmerOrCustomerView extends StatelessWidget {
  const FarmerOrCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = OnboardingFarmerOrCustomerController();
      return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                SizedBox(
                  
                  height: 300,
                  
                  child: PageView.builder(
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
                              
                            ],
                          ),
                        );
                      }
                      
                      ),
                ),
                 SizedBox(height: 32),
                         SmoothPageIndicator(
                controller: _controller.pageController,
                count: _controller.onboardingPages.length,
                effect: const WormEffect(
                  spacing:16,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.teal
                   ),

                   onDotClicked: (index) => _controller.jumpToPage(index),
                   



                    ),
                    SizedBox(height: 32),
                const Text('mazare3 is here to help farm owners and customers'),
              ],
            ),
        ),
      ),
      
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 80,
        child: Column(
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                TextButton(onPressed: (){
                  Get.to(OnboardingFarmerView());
                }, child: const Text('Farm owner')
                ),
                
                TextButton(onPressed: (){
                  Get.to(OnboardingCustomerView());
                }, child: const Text('Customer'),
            )
            ],

            ),
          ],
        ),
      ),
    );
  }
}