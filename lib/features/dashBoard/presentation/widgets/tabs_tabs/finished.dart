import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/NoDataScreen/noDataScreen.dart';

class Finished extends StatelessWidget {
  const Finished({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(BookingAppBloc.get(context).getBookingModelCompleted!.status!.type == '0'){
          return NoDataScreen();
        }else{
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: BookingAppBloc.get(context).getBookingModelCompleted!.data.length,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? Column(
                  children: [
                    FinishedCardLeft(
                      imageURL:BookingAppBloc.get(context).imgLinks[index],
                      distance: BookingAppBloc.get(context).getBookingModelCompleted!.data[index].hotelDataModel!.address!,
                      hotelName: BookingAppBloc.get(context).getBookingModelCompleted!.data[index].hotelDataModel!.name!,
                      location: 'Hurghada, Egypt',
                      price: BookingAppBloc.get(context).getBookingModelCompleted!.data[index].hotelDataModel!.price!,
                      rate: double.parse(BookingAppBloc.get(context).getBookingModelCompleted!.data[index].hotelDataModel!.rate!),
                      date: '01 sep - 05 Sep,1 Room 2 People',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                )
                    : Column(
                  children: [
                    FinishedCardRight(
                      imageURL:BookingAppBloc.get(context).imgLinks[index],
                      distance: BookingAppBloc.get(context).getBookingModelCompleted!.data[index].hotelDataModel!.address!,
                      hotelName: BookingAppBloc.get(context).getBookingModelCompleted!.data[index].hotelDataModel!.name!,
                      location: 'Hurghada, Egypt',
                      price: BookingAppBloc.get(context).getBookingModelCompleted!.data[index].hotelDataModel!.price!,
                      rate: double.parse(BookingAppBloc.get(context).getBookingModelCompleted!.data[index].hotelDataModel!.rate!),
                      date: '01 sep - 05 Sep,1 Room 2 People',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
