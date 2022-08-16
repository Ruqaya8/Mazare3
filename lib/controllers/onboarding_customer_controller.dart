import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazare3/models/onboarding_info.dart';
import 'package:mazare3/views/home_view.dart';

class OnboardingCustomerController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.to(()=>HomeView());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  jumpToPage(index){
    pageController.animateToPage(index,duration: 300.milliseconds, curve: Curves.ease);
  }


  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/onboarding_images/group_120.svg', 'FINDING THE RIGHT FARM',
        'Mazare3 helps you pick the right farm for you.'),
    OnboardingInfo('assets/onboarding_images/digital_nomad_cuate.svg', 'FINDING THE RIGHT FARM',
        'Mazare3 helps you pick the right farm for you.'),
    OnboardingInfo('assets/onboarding_images/payment_information_cuate.svg', 'EASY PAYMENT',
        'Now paying for your farm is easier than ever.'),
    OnboardingInfo('assets/onboarding_images/group_123.svg', 'WE VALUE OUR CUSTOMERS',
        'if you have any issues with a farm you booked we are here to help!'),
  ];
}
