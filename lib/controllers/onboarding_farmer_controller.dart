import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:mazare3/models/onboarding_info.dart';
import 'package:mazare3/views/home_view.dart';
import '../views/login.dart';

class OnboardingFarmerController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.to(()=>LoginView());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  jumpToPage(index){
    pageController.animateToPage(index,duration: 300.milliseconds, curve: Curves.ease);
  }


  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/onboarding_images/group _124.svg', 'START EARNING',
        'Using Mazare3, it is now easy and free to list your farm!'),
    OnboardingInfo('assets/onboarding_images/group_125.svg', 'EARN MORE',
        'We promise to help you earn more with your farm!'),
    OnboardingInfo('assets/onboarding_images/select_cuate.svg', 'EASY PLANNING',
        'You can select the dates you want to rent your farm, the type of rental and the audience you want to target.'),
    OnboardingInfo('assets/onboarding_images/group_127.svg', 'MAZARE3 SUPPORT',
        'Mazare3 provides you with around-the-clock support.'),
  ];
}
