import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoomScreen extends StatefulWidget {
  int hotelListIndex;
  String hotelName;

  RoomScreen({
    required this.hotelListIndex,
    required this.hotelName,
  });

  @override
  State<RoomScreen> createState() => _RoomScreenState(
        hotelListIndexSecond: hotelListIndex,
        hotelName: hotelName,
      );
}

class _RoomScreenState extends State<RoomScreen> {
  int hotelListIndexSecond;
  String hotelName;
  CarouselController carouselController = CarouselController();
  int indexpage = 0;

  _RoomScreenState(
      {required this.hotelListIndexSecond, required this.hotelName});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        if (state is SuccessCreatingBookingState) {
          toastMsg(
            msg: BookingAppBloc.get(context).createBookingModel!.status!.enMsg!,
            color: Colors.green,
          );
        } else if (state is ErrorCreatingBookingState) {
          toastMsg(
            msg: BookingAppBloc.get(context).createBookingModel!.status!.enMsg!,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(hotelName,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.favorite_border, color: Colors.black)),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                        carouselController: carouselController,
                        items: const [
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC4TgSbb4p1Q0MeKRy7Ctjm1If4_sx7SGNZjKRO9hPSZozDt6Ycs_5g0ZaoYHdl4EurOY&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT8TdPwD2Un2oKvl3IZmoBee5KNuKVbwpkNOyX9v1f5ziznGYjNhVUtJczYczCuBYHk9E&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: NetworkImage(
                                'https://media.designcafe.com/wp-content/uploads/2019/11/17054922/how-to-make-your-bedroom-feel-like-five-star-hotel-intro.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ],
                        options: CarouselOptions(
                          onPageChanged: (index, reson) =>
                              setState(() => indexpage = index),
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          height: 250,
                          initialPage: 0,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedSmoothIndicator(
                        effect: const WormEffect(
                          dotColor: Colors.white,
                          activeDotColor: Colors.teal,
                          dotHeight: 9,
                          dotWidth: 9,
                          spacing: 3.0,
                        ),
                        count: 3,
                        activeIndex: indexpage,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Deluxe Room',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorManager.primaryButtonColor),
                          child: TextButton(
                              onPressed: () {
                                BookingAppBloc.get(context).createHotelBooking(
                                  token: BookingAppBloc.get(context)
                                      .loginModel!
                                      .data!
                                      .token!,
                                  hotelId: BookingAppBloc.get(context)
                                      .hotelsData[hotelListIndexSecond]
                                      .id!,
                                );
                              },
                              child: Text(
                                'Book now',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "180/",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          "per night",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Sleeps 2 people+2 Children",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Spacer(flex: 1),
                        InkWell(
                          onTap: () {},
                          child: DefaultButtom(
                              color: Colors.transparent,
                              size: 12,
                              coloricon: Colors.black,
                              colortext: Colors.black,
                              icon: Icons.arrow_drop_down,
                              text: 'More Details'),
                        )
                      ],
                    ),
                  ],
                ),

                /////////////////////////////////////////////////
                SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                        carouselController: carouselController,
                        items: const [
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC4TgSbb4p1Q0MeKRy7Ctjm1If4_sx7SGNZjKRO9hPSZozDt6Ycs_5g0ZaoYHdl4EurOY&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT8TdPwD2Un2oKvl3IZmoBee5KNuKVbwpkNOyX9v1f5ziznGYjNhVUtJczYczCuBYHk9E&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: NetworkImage(
                                'https://media.designcafe.com/wp-content/uploads/2019/11/17054922/how-to-make-your-bedroom-feel-like-five-star-hotel-intro.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ],
                        options: CarouselOptions(
                          onPageChanged: (index, reson) =>
                              setState(() => indexpage = index),
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          height: 250,
                          initialPage: 0,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedSmoothIndicator(
                        effect: const WormEffect(
                          dotColor: Colors.white,
                          activeDotColor: ColorManager.primaryButtonColor,
                          dotHeight: 9,
                          dotWidth: 9,
                          spacing: 3.0,
                        ),
                        count: 3,
                        activeIndex: indexpage,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Premmium Room',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorManager.primaryButtonColor),
                          child: TextButton(
                              onPressed: () {
                                BookingAppBloc.get(context).createHotelBooking(
                                  token: BookingAppBloc.get(context)
                                      .loginModel!
                                      .data!
                                      .token!,
                                  hotelId: BookingAppBloc.get(context)
                                      .hotelsData[hotelListIndexSecond]
                                      .id!,
                                );
                              },
                              child: Text(
                                'Book now',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "180/",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          "per night",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Sleeps 3 people +3 Children",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Spacer(flex: 1),
                        InkWell(
                          onTap: () {},
                          child: DefaultButtom(
                              color: Colors.transparent,
                              size: 12,
                              coloricon: Colors.black,
                              colortext: Colors.black,
                              icon: Icons.arrow_drop_down,
                              text: 'More Details'),
                        )
                      ],
                    ),
                  ],
                ),
                ///////////////////////////////////////////////////////
                SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                        carouselController: carouselController,
                        items: const [
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC4TgSbb4p1Q0MeKRy7Ctjm1If4_sx7SGNZjKRO9hPSZozDt6Ycs_5g0ZaoYHdl4EurOY&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT8TdPwD2Un2oKvl3IZmoBee5KNuKVbwpkNOyX9v1f5ziznGYjNhVUtJczYczCuBYHk9E&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: NetworkImage(
                                'https://media.designcafe.com/wp-content/uploads/2019/11/17054922/how-to-make-your-bedroom-feel-like-five-star-hotel-intro.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ],
                        options: CarouselOptions(
                          onPageChanged: (index, reson) =>
                              setState(() => indexpage = index),
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          height: 250,
                          initialPage: 0,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedSmoothIndicator(
                        effect: const WormEffect(
                          dotColor: Colors.white,
                          activeDotColor: ColorManager.primaryButtonColor,
                          dotHeight: 9,
                          dotWidth: 9,
                          spacing: 3.0,
                        ),
                        count: 3,
                        activeIndex: indexpage,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Queen Room',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorManager.primaryButtonColor),
                          child: TextButton(
                              onPressed: () {
                                BookingAppBloc.get(context).createHotelBooking(
                                  token: BookingAppBloc.get(context)
                                      .loginModel!
                                      .data!
                                      .token!,
                                  hotelId: BookingAppBloc.get(context)
                                      .hotelsData[hotelListIndexSecond]
                                      .id!,
                                );
                              },
                              child: Text(
                                'Book now',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "240/",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          "per night",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Sleeps 4 people +4 Children",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Spacer(flex: 1),
                        InkWell(
                          onTap: () {},
                          child: DefaultButtom(
                              color: Colors.transparent,
                              size: 12,
                              coloricon: Colors.black,
                              colortext: Colors.black,
                              icon: Icons.arrow_drop_down,
                              text: 'More Details'),
                        )
                      ],
                    ),
                  ],
                ),

                ///////////////////////////////////////////////////////////////
                SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                        carouselController: carouselController,
                        items: const [
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC4TgSbb4p1Q0MeKRy7Ctjm1If4_sx7SGNZjKRO9hPSZozDt6Ycs_5g0ZaoYHdl4EurOY&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT8TdPwD2Un2oKvl3IZmoBee5KNuKVbwpkNOyX9v1f5ziznGYjNhVUtJczYczCuBYHk9E&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: NetworkImage(
                                'https://media.designcafe.com/wp-content/uploads/2019/11/17054922/how-to-make-your-bedroom-feel-like-five-star-hotel-intro.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ],
                        options: CarouselOptions(
                          onPageChanged: (index, reson) =>
                              setState(() => indexpage = index),
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          height: 250,
                          initialPage: 0,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedSmoothIndicator(
                        effect: const WormEffect(
                          dotColor: Colors.white,
                          activeDotColor: ColorManager.primaryButtonColor,
                          dotHeight: 9,
                          dotWidth: 9,
                          spacing: 3.0,
                        ),
                        count: 3,
                        activeIndex: indexpage,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'King Room',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: ColorManager.primaryButtonColor),
                          child: TextButton(
                              onPressed: () {
                                BookingAppBloc.get(context).createHotelBooking(
                                  token: BookingAppBloc.get(context)
                                      .loginModel!
                                      .data!
                                      .token!,
                                  hotelId: BookingAppBloc.get(context)
                                      .hotelsData[hotelListIndexSecond]
                                      .id!,
                                );
                              },
                              child: Text(
                                'Book now',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "240/",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          "per night",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Sleeps 4 people +4 Children",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Spacer(flex: 1),
                        InkWell(
                          onTap: () {},
                          child: DefaultButtom(
                              color: Colors.transparent,
                              size: 12,
                              coloricon: Colors.black,
                              colortext: Colors.black,
                              icon: Icons.arrow_drop_down,
                              text: 'More Details'),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
