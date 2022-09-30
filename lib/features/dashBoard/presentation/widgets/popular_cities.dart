import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';

class PopularCities extends StatelessWidget {
  const PopularCities({
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
          transform: Matrix4.translationValues(0, -165.0, 0),
          child: Column(
            children: [
              ExplorPageTitle(
                title: 'Popular Destination',
              ),
              Container(
                height: 166,
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: BookingAppBloc.get(context).cities.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 32,
                          ),
                          PopularCitiesCard(
                              imageURL: BookingAppBloc.get(context)
                                  .cities[index]
                                  .image,
                              cityName: 'Egypt'),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        );
      },
    );
  }
}
