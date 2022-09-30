import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';

abstract class BookingAppState{}

class BookingAppInitialState extends BookingAppState{}

class IsLastOnboardingState extends BookingAppState {}

class IsNotLastOnboardingState extends BookingAppState {}

class LoadingLoginState extends BookingAppState{}

class SuccessLoginState extends BookingAppState{
  static String? apiStatus;
}

class ErrorLoginState extends BookingAppState{}

class LoadingRegisterState extends BookingAppState{}

class SuccessRegisterState extends BookingAppState{
  static String? apiStatus;
}

class ErrorRegisterState extends BookingAppState{}

class MainLoadingBottomNavigationBarState extends BookingAppState{

}

class MainChangeBottomNavigationBarState extends BookingAppState{}

class MainLoadingAnimatedSmoothIndicatorState extends BookingAppState{}

class MainChangeAnimatedSmoothIndicatorState extends BookingAppState{}

class TripChangeTabBarState extends BookingAppState{}

class LoadingHotelsDataState extends BookingAppState{}

class SuccessHotelsDataState extends BookingAppState{}

class ErrorHotelsDataState extends BookingAppState{}

class LoadingProfileDataState extends BookingAppState{}

class SuccessProfileDataState extends BookingAppState{}

class ErrorProfileDataState extends BookingAppState{}

class LoadingBookingUpcomingDataState extends BookingAppState{}

class SuccessBookingUpcomingDataState extends BookingAppState{}

class ErrorBookingUpcomingDataState extends BookingAppState{}

class LoadingBookingCancelledDataState extends BookingAppState{}

class SuccessBookingCancelledDataState extends BookingAppState{}

class ErrorBookingCancelledDataState extends BookingAppState{}

class LoadingBookingCompletedDataState extends BookingAppState{}

class SuccessBookingCompletedDataState extends BookingAppState{}

class ErrorBookingCompletedDataState extends BookingAppState{}

class LoadingCreatingBookingState extends BookingAppState{}

class SuccessCreatingBookingState extends BookingAppState{}

class ErrorCreatingBookingState extends BookingAppState{}

class LoadingSearchForHotelsState extends BookingAppState{}

class SuccessSearchForHotelsState extends BookingAppState{}

class ErrorSearchForHotelsState extends BookingAppState{}

class LoadingFacilitiesState extends BookingAppState{}

class SuccessFacilitiesState extends BookingAppState{}

class ErrorFacilitiesState extends BookingAppState{}

class ChangeIconState extends BookingAppState{}
