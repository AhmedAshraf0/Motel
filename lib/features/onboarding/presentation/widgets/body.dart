import 'package:flutter/material.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/strings_manager.dart';
import 'package:motel/features/loginScreen/login_screen.dart';
import 'package:motel/features/onboarding/presentation/widgets/build_boarding_item.dart';
import 'package:motel/features/signUpScreen/signup_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Padding onboardingBody(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: BookingAppBloc.get(context).boardController,
            onPageChanged: (int index) {
              if (index == BookingAppBloc.get(context).boarding.length - 1) {
                BookingAppBloc.get(context).isLastOnboardingScreen();
              } else {
                BookingAppBloc.get(context).isNotLastOnboardingScreen();
              }
            },
            itemBuilder: (context, index) =>
                BuildBoardingItem(model: BookingAppBloc.get(context).boarding[index]),
            itemCount: BookingAppBloc.get(context).boarding.length,
          ),
        ),
        SizedBox(
          height: 80.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: BookingAppBloc.get(context).boardController,
              effect: WormEffect(
                dotColor: Colors.grey,
                activeDotColor: ColorManager.primary,
                dotHeight: 9,
                dotWidth: 9,
                spacing: 3.0,
              ),
              count: BookingAppBloc.get(context).boarding.length,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultButton(
            onPressed: () {
              navigateTo(context, LoginScreen());
            },
            text: AppStrings.login,
            isUpperCase: true,
            radius: 8,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultButton(
            onPressed: () {
              navigateTo(context, SignupScreen());
            },
            text: AppStrings.createAccount,
            isUpperCase: true,
            radius: 8,
            buttonColor: ColorManager.white,
            textColor: ColorManager.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
