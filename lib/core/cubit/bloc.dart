import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/api/dio_helper.dart';
import 'package:motel/core/assets_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/constants/constants.dart';
import 'package:motel/core/constants/endPoints.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/core/models/hotels_model/hotels_model.dart';
import 'package:motel/core/models/hotels_model/single_hotel_data_model.dart';
import 'package:motel/core/models/login_model/login_model.dart';
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
  bool isLast = false;

  LoginModel? loginModel;
  HotelsModel? hotelModel;

  var boardController = PageController();

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
  List<SingleHotelDataModel> hotelsData = [];//all of the hotels with its data
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

  List<Widget> screens = const [Upcoming(), Finished(), Favorite()];

  //Tabs Title
  List<Widget> tabTitles = const [
    Tab(text: 'Upcoming',),
    Tab(text: 'Finished',),
    Tab(text: 'Favorite',),
  ];

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
      getHotels(count: 7, page: 1);//Logged in so let's get the hotels
      navigateAndFinish(context, DashBoardScreen());
    }).catchError((e) {
      emit(ErrorLoginState());
      printFullText(
          '---------------Error In Login-----------------\n' + e.toString());
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
      hotelsData = hotelModel!.hotelsDataModel!
          .hotels; //saving the hotels in a list here in the bloc
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

  onTap(int index) {
    emit(MainLoadingBottomNavigationBarState());

    currentIndex = index;
    emit(MainChangeBottomNavigationBarState());
  }

  onChangeAnimatedSmoothIndicator(int index) {
    emit(MainLoadingAnimatedSmoothIndicatorState());

    indexIndecator = index;
    emit(MainChangeAnimatedSmoothIndicatorState());
  }
}
