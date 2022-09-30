import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/hotel/presentation/pages/hotel_page.dart';

class BestDeals extends StatelessWidget {
  const BestDeals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        String currentKM;
        return Container(
          transform: Matrix4.translationValues(0, -170.0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ExplorPageTitle(
                    title: 'Best Deals',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Row(
                      children: [
                        ExplorPageTitle(
                          title: 'View all',
                          textColor: ColorManager.primary,
                        ),
                        Icon(
                          Icons.arrow_right_alt_outlined,
                          color: ColorManager.primary,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                transform: Matrix4.translationValues(0, -20.0, 0),
                // width: double.infinity,
                // color: Colors.blue,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: BookingAppBloc.get(context).hotelsData.length,
                    itemBuilder: (context, index) {
                      int j = BookingAppBloc.get(context).hotelsData[index].description!.indexOf('km');
                      if(j != -1){
                        currentKM = BookingAppBloc.get(context).hotelsData[index].description![j-3]+BookingAppBloc.get(context).hotelsData[index].description![j-2];
                      }else{
                        currentKM = '${index*BookingAppBloc.get(context).randomNums[index]}';
                      }
                      currentKM += ' km to airport';
                      return GestureDetector(
                        onTap: (){
                          navigateTo(context, HotelPage(hotelListIndex: index,distance: currentKM,indexOfHotel: index,));
                        },
                        child: Column(
                          children: [
                            HotelCard(
                              imageURL:
                                  BookingAppBloc.get(context).imgLinks[index],
                              distance: currentKM,
                              hotelName: BookingAppBloc.get(context)
                                  .hotelsData[index]
                                  .name,
                              location: 'Hurghada, Egypt',
                              price: BookingAppBloc.get(context)
                                  .hotelsData[index]
                                  .price,
                              rate: double.parse(BookingAppBloc.get(context)
                                  .hotelsData[index]
                                  .rate!),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
