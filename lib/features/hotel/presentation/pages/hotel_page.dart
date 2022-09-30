import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/hotel/presentation/pages/room_screen.dart';
import 'package:motel/features/hotel/presentation/widgets/hotel_page_body.dart';
import 'package:motel/features/hotel/presentation/widgets/hotel_page_sliver_appbar.dart';

class HotelPage extends StatelessWidget {
  int hotelListIndex;
  String distance;
  int indexOfHotel;

  HotelPage(
      {required this.hotelListIndex,
      required this.distance,
      required this.indexOfHotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              BlocConsumer<BookingAppBloc, BookingAppState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return HotelPageSliverAppBar(
                    like: BookingAppBloc.get(context)
                        .hotelsData[hotelListIndex].like!,
                    imageURL:
                        BookingAppBloc.get(context).imgLinks[hotelListIndex],
                    distance: distance,
                    hotelName: BookingAppBloc.get(context)
                        .hotelsData[hotelListIndex]
                        .name!,
                    location: 'Hurghada, Egypt',
                    price: BookingAppBloc.get(context)
                        .hotelsData[hotelListIndex]
                        .price!,
                    rate: double.parse(BookingAppBloc.get(context)
                        .hotelsData[hotelListIndex]
                        .rate!),
                    reviews: '90',
                    bookingNowButtonFun: () {
                      navigateTo(
                          context,
                          RoomScreen(
                            hotelListIndex: hotelListIndex,
                            hotelName: BookingAppBloc.get(context)
                                .hotelsData[hotelListIndex]
                                .name!,
                          ));
                    },
                    moreDetailsButtonFun: () {},
                    addToFavoriteBottonFun: () {
                      if (BookingAppBloc.get(context)
                          .hotelsData[indexOfHotel]
                          .like!) {
                        BookingAppBloc.get(context)
                            .hotelsData[indexOfHotel]
                            .like = false;
                      } else {
                        BookingAppBloc.get(context)
                            .hotelsData[indexOfHotel]
                            .like = true;
                      }
                      BookingAppBloc.get(context).emit(ChangeIconState());
                    },
                  );
                },
              ),
            ];
          },
          body: HotelPageBody(
            hotelListIndex: hotelListIndex,
            distance: distance,
            hotelName:
                BookingAppBloc.get(context).hotelsData[hotelListIndex].name!,
            location: 'Hurghada, Egypt',
            price:
                BookingAppBloc.get(context).hotelsData[hotelListIndex].price!,
            rate: double.parse(
                BookingAppBloc.get(context).hotelsData[hotelListIndex].rate!),
            summry: BookingAppBloc.get(context)
                .hotelsData[hotelListIndex]
                .description!,
          ),
        ),
      ),
    );
  }
}
