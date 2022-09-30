import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/features/NoDataScreen/noDataScreen.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    if(BookingAppBloc.get(context).getBookingModelUpcoming!.status!.type == '0'){
      return NoDataScreen();
    }else{
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: BookingAppBloc.get(context).getBookingModelUpcoming!.data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                UpcomingCard(
                  imageURL:BookingAppBloc.get(context).imgLinks[int.parse(BookingAppBloc.get(context).getBookingModelUpcoming!.data[index].hotelId!)-18],
                  distance: BookingAppBloc.get(context).getBookingModelUpcoming!.data[index].hotelDataModel!.address!,
                  hotelName: BookingAppBloc.get(context).getBookingModelUpcoming!.data[index].hotelDataModel!.name!,
                  location: BookingAppBloc.get(context).getBookingModelUpcoming!.data[index].hotelDataModel!.description!,
                  price: BookingAppBloc.get(context).getBookingModelUpcoming!.data[index].hotelDataModel!.price!,
                  rate: double.parse(BookingAppBloc.get(context).getBookingModelUpcoming!.data[index].hotelDataModel!.rate!),
                  offerdate: '01 sep - 05 Sep, 1 Room 2 People',
                  reviews: '90', like: BookingAppBloc.get(context).getBookingModelUpcoming!.data[index].hotelDataModel!.like!,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            );
          });
    }
  }
}
