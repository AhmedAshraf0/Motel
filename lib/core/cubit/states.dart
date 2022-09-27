import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';

abstract class BookingAppState{}

class BookingAppInitialState extends BookingAppState{}

class IsLastOnboardingState extends BookingAppState {}

class IsNotLastOnboardingState extends BookingAppState {}

class LoadingLoginState extends BookingAppState{}

class SuccessLoginState extends BookingAppState{}

class ErrorLoginState extends BookingAppState{}

class MainLoadingBottomNavigationBarState extends BookingAppState{}

class MainChangeBottomNavigationBarState extends BookingAppState{}

class MainLoadingAnimatedSmoothIndicatorState extends BookingAppState{}

class MainChangeAnimatedSmoothIndicatorState extends BookingAppState{}

class TripChangeTabBarState extends BookingAppState{}

class LoadingHotelsDataState extends BookingAppState{}

class SuccessHotelsDataState extends BookingAppState{}

class ErrorHotelsDataState extends BookingAppState{}
