import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';

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
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: BookingAppBloc.get(context).hotelsData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          HotelCard(
                            imageURL:
                                BookingAppBloc.get(context).imgLinks[index],
                            distance: BookingAppBloc.get(context)
                                .hotelsData[index]
                                .description,
                            hotelName: BookingAppBloc.get(context)
                                .hotelsData[index]
                                .name,
                            location: BookingAppBloc.get(context)
                                .hotelsData[index]
                                .address,
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
