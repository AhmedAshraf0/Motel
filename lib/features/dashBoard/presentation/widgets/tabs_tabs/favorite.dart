import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/NoDataScreen/noDataScreen2.dart';

class Favorite extends StatelessWidget {

  Favorite({super.key});

  @override
  Widget build(BuildContext context) {

    if (BookingAppBloc.get(context).yub) {
      return ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: BookingAppBloc.get(context).favoritesData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                HotelCard(
                  imageURL: BookingAppBloc.get(context).imgLinks[BookingAppBloc.get(context).favoritesData[index].id!-18],
                  distance:
                      BookingAppBloc.get(context).favoritesData[index].address!,
                  hotelName:
                      BookingAppBloc.get(context).favoritesData[index].name!,
                  location: BookingAppBloc.get(context)
                      .favoritesData[index]
                      .description!,
                  price:
                      BookingAppBloc.get(context).favoritesData[index].price!,
                  rate: double.parse(
                      BookingAppBloc.get(context).favoritesData[index].rate!),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            );
          });
    } else {
      return NoDataScreen2();
    }
  }
}
