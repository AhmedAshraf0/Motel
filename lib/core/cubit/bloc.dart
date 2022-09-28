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

  bool networkImage = true;
  var currentIndex = 0;
  int indexIndecator = 0;
  bool isLast = false;

  UserRegister? registerModel;
  LoginModel? loginModel;
  HotelsModel? hotelModel;
  ProfileModel? profileModel;

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
  List<SingleHotelDataModel> hotelsData = []; //all of the hotels with its data
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
      debugPrint(value.data.toString());
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

  void profileData({required String token}) {
    emit(LoadingProfileData()) ;
    DioHelper.getData(
      path: profileInfo,
      queries: null,
      useHeader: true,
      key: token,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(SuccessProfileData());
      if(profileModel?.data?.image == null || (profileModel!.data!.image!.indexOf('images') == 27 && profileModel!.data!.image!.length <= 33)){
        profileModel?.data?.image = 'assets/images/dp1.png';
        networkImage = false;
      }
    }).catchError((e){
      emit(ErrorProfileData());
      debugPrint('----------Error in profieData-----------\n${e.toString()}');
    });
  }

  onTap(int index) {
    emit(MainLoadingBottomNavigationBarState());

    currentIndex = index;

    if (currentIndex == 2) {
      profileData(token: loginModel!.data!.token!);
    }
    emit(MainChangeBottomNavigationBarState());
  }

  onChangeAnimatedSmoothIndicator(int index) {
    emit(MainLoadingAnimatedSmoothIndicatorState());

    indexIndecator = index;
    emit(MainChangeAnimatedSmoothIndicatorState());
  }
}
