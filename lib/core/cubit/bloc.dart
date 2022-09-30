import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/api/dio_helper.dart';
import 'package:motel/core/assets_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/constants/constants.dart';
import 'package:motel/core/constants/endPoints.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/core/models/create_booking_model/create_booking_model.dart';
import 'package:motel/core/models/facilities_model/facilities_model.dart';
import 'package:motel/core/models/get_bookings_model/get_bookings_model.dart';
import 'package:motel/core/models/hotels_model/hotels_model.dart';
import 'package:motel/core/models/hotels_model/single_hotel_data_model.dart';
import 'package:motel/core/models/login_model/login_model.dart';
import 'package:motel/core/models/profile_model/profile_model.dart';
import 'package:motel/core/models/register_model/register_model.dart';
import 'package:motel/core/strings_manager.dart';
import 'package:motel/features/dashBoard/data/models/banner_model.dart';
import 'package:motel/features/dashBoard/data/models/cities.dart';
import 'package:motel/features/dashBoard/presentation/pages/dashBoard.dart';
import 'package:motel/features/dashBoard/presentation/pages/explore.dart';
import 'package:motel/features/dashBoard/presentation/pages/profile.dart';
import 'package:motel/features/dashBoard/presentation/pages/trips.dart';
import 'package:motel/features/dashBoard/presentation/widgets/tabs_tabs/favorite.dart';
import 'package:motel/features/dashBoard/presentation/widgets/tabs_tabs/finished.dart';
import 'package:motel/features/dashBoard/presentation/widgets/tabs_tabs/upcoming.dart';
import 'package:motel/features/onboarding/data/models/onboarding.dart';

class BookingAppBloc extends Cubit<BookingAppState> {
  BookingAppBloc() : super(BookingAppInitialState());

  static BookingAppBloc get(context) =>
      BlocProvider.of<BookingAppBloc>(context);

  var currentIndex = 0;
  int indexIndecator = 0;
  bool isLast = false , yub = false;
  TextEditingController textEditingController = TextEditingController();

  UserRegister? registerModel;
  LoginModel? loginModel;
  HotelsModel? hotelModel, searchModel;
  ProfileModel? profileModel;
  GetBookingModel? getBookingModelUpcoming,
      getBookingModelCancelled,
      getBookingModelCompleted;
  CreateBooking? createBookingModel;
  FacilitiesSearchModel? facilitiesModel;

  var boardController = PageController();

  Map<String, dynamic> searchQueries = {
    'count': 10,
    'page': 1,
  };

  Map<String,int> facilitiesMap = {};

  List<int> randomNums = [
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
    Random().nextInt(12) + 1,
  ];

  List<BoardingModel> boarding = [
    BoardingModel(
      image: ImageAssets.onboardingLogo1,
      title: AppStrings.onBoardingTitle1,
      body: AppStrings.onBoardingSubTitle1,
    ),
    BoardingModel(
      image: ImageAssets.onboardingLogo2,
      title: AppStrings.onBoardingTitle2,
      body: AppStrings.onBoardingSubTitle2,
    ),
    BoardingModel(
      image: ImageAssets.onboardingLogo3,
      title: AppStrings.onBoardingTitle3,
      body: AppStrings.onBoardingSubTitle3,
    ),
  ];
  List<Widget> pages = [
    ExplorePage(),
    TripsPage(),
    ProfilePage(),
  ];
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
          size: 32,
        ),
        label: AppStrings.explore),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_border,
          size: 32,
        ),
        label: AppStrings.trips),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline,
          size: 32,
        ),
        label: AppStrings.profile),
  ];
  List<String> imgLinks = [
    'assets/images/hotel1.jpg',
    'assets/images/hotel2.jpg',
    'assets/images/hotel3.jpeg',
    'assets/images/hotel4.jpg',
    'assets/images/hotel5.jpg',
    'assets/images/hotel6.jpg',
    'assets/images/hotel7.jpg',
  ];
  List<SingleHotelDataModel> hotelsData = [] , favoritesData = []; //all of the hotels with its data
  List<BannerModel> banners = [
    BannerModel(
      image: 'assets/images/hotel1.jpg',
      title: AppStrings.onBoardingTitle1,
      body: AppStrings.onBoardingSubTitle1,
    ),
    BannerModel(
      image: 'assets/images/hotel2.jpg',
      title: AppStrings.onBoardingTitle2,
      body: AppStrings.onBoardingSubTitle2,
    ),
    BannerModel(
      image: 'assets/images/hotel3.jpeg',
      title: AppStrings.onBoardingTitle3,
      body: AppStrings.onBoardingSubTitle3,
    ),
  ];

  List<CitiesModel> cities = [];

  List<Widget> screens = [Upcoming(), Finished(), Favorite()];

  //Tabs Title
  List<Widget> tabTitles = const [
    Tab(
      text: 'Upcoming',
    ),
    Tab(
      text: 'Finished',
    ),
    Tab(
      text: 'Favorite',
    ),
  ];

  List<SingleHotelDataModel> searchList = [];

  isLastOnboardingScreen() {
    isLast = true;
    emit(IsLastOnboardingState());
  }

  isNotLastOnboardingScreen() {
    isLast = false;
    emit(IsNotLastOnboardingState());
  }

  void loginFunction(
      {required String email, required String password, required context}) {
    emit(LoadingLoginState());

    DioHelper.postData(
      path: login,
      data: {
        'email': email,
        'password': password,
      },
      useHeader: false,
    ).then((value) {
      emit(SuccessLoginState());
      loginModel = LoginModel.fromJson(value.data);
      if (loginModel!.status!.type == '1') {
        getHotels(count: 7, page: 1); //Logged in so let's get the hotels
        navigateAndFinish(context, DashBoardScreen());
      }
      SuccessLoginState.apiStatus = loginModel!.status!.type;
    }).catchError((e) {
      emit(ErrorLoginState());
      printFullText(
          '---------------Error In Login-----------------\n' + e.toString());
    });
  }

  void registerFunction({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    emit(LoadingRegisterState());
    DioHelper.postData(
      path: register,
      data: {
        'name': '$firstName $lastName',
        'email': email,
        'password': password,
        'password_confirmation': password
      },
      useHeader: false,
    ).then((value) {
      registerModel = UserRegister.fromJson(value.data);
      emit(SuccessRegisterState());
      SuccessRegisterState.apiStatus = registerModel!.status!.type;
    }).catchError((e) {
      emit(ErrorRegisterState());
      debugPrint('----------Error in Regiser-----------\n${e.toString()}');
    });
  }

  void getHotels({required int count, required int page}) {
    emit(LoadingHotelsDataState());
    DioHelper.getData(
      path: explore,
      queries: {
        'count': count,
        'page': page,
      },
      useHeader: false,
    ).then((value) {
      hotelModel = HotelsModel.fromJson(value.data);
      hotelsData = hotelModel!.hotelsDataModel!.hotels; //saving the hotels in a list here in the bloc
      // favoritesData = hotelModel!.hotelsDataModel!.hotels;
      cities = [
        CitiesModel(
          image: 'assets/images/hotel4.jpg',
          title: hotelsData[3].address,
        ),
        CitiesModel(
          image: 'assets/images/hotel5.jpg',
          title: hotelsData[4].address,
        ),
        CitiesModel(
          image: 'assets/images/hotel6.jpg',
          title: hotelsData[5].address,
        ),
      ];
      emit(SuccessHotelsDataState());
    }).catchError((e) {
      emit(ErrorHotelsDataState());
      debugPrint(
          '----------------Error in getHotels--------------\n${e.toString()}');
    });
  }

  void profileData({required String token}) {
    emit(LoadingProfileDataState());
    DioHelper.getData(
      path: profileInfo,
      queries: null,
      useHeader: true,
      key: token,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      printFullText(value.data.toString());
      emit(SuccessProfileDataState());
      if (profileModel?.data?.image == null ||
          (profileModel!.data!.image!.indexOf('images') == 27 &&
              profileModel!.data!.image!.length <= 33)) {
        profileModel?.data?.image =
            'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg';
      } else {
        // profileModel!.data!.image = AppStrings.imageApi + profileModel!.data!.image!;
      }
    }).catchError((e) {
      emit(ErrorProfileDataState());
      debugPrint('----------Error in profieData-----------\n${e.toString()}');
    });
  }

  void getBookingUpcoming({
    required String token,
    required int count,
  }) {
    emit(LoadingBookingUpcomingDataState());
    DioHelper.getData(
      path: getBookings,
      queries: {'type': AppStrings.upcomming, 'count': count},
      useHeader: true,
      key: token,
    ).then((value) {
      getBookingModelUpcoming = GetBookingModel.fromJson(value.data);
      emit(SuccessBookingUpcomingDataState());
    }).catchError((e) {
      emit(ErrorBookingUpcomingDataState());
      debugPrint(
          '----------Error in getting Upcoming Bookings-----------\n${e.toString()}');
    });
  }

  void getBookingCancelled({
    required String token,
    required int count,
  }) {
    emit(LoadingBookingCancelledDataState());
    DioHelper.getData(
      path: getBookings,
      queries: {'type': AppStrings.cancelled, 'count': count},
      useHeader: true,
      key: token,
    ).then((value) {
      getBookingModelCancelled = GetBookingModel.fromJson(value.data);
      emit(SuccessBookingCancelledDataState());
    }).catchError((e) {
      emit(ErrorBookingCancelledDataState());
      debugPrint(
          '----------Error in getting Cancelled Bookings-----------\n${e.toString()}');
    });
  }

  void getBookingCompledted({
    required String token,
    required int count,
  }) {
    emit(LoadingBookingCompletedDataState());
    DioHelper.getData(
      path: getBookings,
      queries: {'type': AppStrings.completed, 'count': count},
      useHeader: true,
      key: token,
    ).then((value) {
      getBookingModelCompleted = GetBookingModel.fromJson(value.data);
      emit(SuccessBookingCompletedDataState());
    }).catchError((e) {
      emit(ErrorBookingCompletedDataState());
      debugPrint(
          '----------Error in getting Completed Bookings-----------\n${e.toString()}');
    });
  }

  void createHotelBooking({required String token, required int hotelId}) {
    emit(LoadingCreatingBookingState());
    DioHelper.postData(
      path: createBooking,
      data: {'hotel_id': hotelId},
      useHeader: true,
      key: token,
    ).then((value) {
      createBookingModel = CreateBooking.fromJson(value.data);
      emit(SuccessCreatingBookingState());
    }).catchError((e) {
      debugPrint(
          '----------Error in creating hotel booking-----------\n${e.toString()}');
      emit(ErrorCreatingBookingState());
    });
  }

  void searchForHotels() {
    emit(LoadingSearchForHotelsState());
    DioHelper.getData(
      path: searchHotels,
      queries: searchQueries,
      useHeader: false,
    ).then((value) {
      searchModel = HotelsModel.fromJson(value.data);
      printFullText(value.data.toString());
      searchList = searchModel!.hotelsDataModel!.hotels;
      emit(SuccessSearchForHotelsState());
    }).catchError((e) {
      emit(ErrorSearchForHotelsState());
      debugPrint(
          '----------Error in search for hotels-----------\n${e.toString()}');
    });
  }

  void getFacilities() {
    emit(LoadingFacilitiesState());
    DioHelper.getData(
      path: searchFacilities,
      queries: null,
      useHeader: false,
    ).then((value) {
      facilitiesModel = FacilitiesSearchModel.fromJson(value.data);
      emit(SuccessFacilitiesState());
      for(int i = 0 ; i < facilitiesModel!.data!.length ; ++i){
        facilitiesMap[facilitiesModel!.data![i].name!] = facilitiesModel!.data![i].id!;
      }
    }).catchError((e) {
      debugPrint(
          '----------Error in Getting features-----------\n${e.toString()}');
      emit(ErrorFacilitiesState());
    });
  }

  onTap(int index) {
    emit(MainLoadingBottomNavigationBarState());

    currentIndex = index;

    if (currentIndex == 2) {
      profileData(token: loginModel!.data!.token!);
    } else if (currentIndex == 1) {
      getBookingUpcoming(token: loginModel!.data!.token!, count: 10);
      getBookingCompledted(token: loginModel!.data!.token!, count: 10);
    }
    if (currentIndex == 2 || currentIndex == 0) {
      getBookingModelCompleted = null;
      getBookingModelUpcoming = null;
    }
    emit(MainChangeBottomNavigationBarState());
  }

  onChangeAnimatedSmoothIndicator(int index) {
    emit(MainLoadingAnimatedSmoothIndicatorState());

    indexIndecator = index;
    emit(MainChangeAnimatedSmoothIndicatorState());
  }
}
