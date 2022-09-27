import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  HotelCard(
                    imageURL:
                    'https://pix8.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg?ca=6&ce=1&s=1024x768s',
                    distance: '70 km to city',
                    hotelName: 'Queen Hotel',
                    location: 'Wembley, London',
                    price: '60',
                    rate: 4.5,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              );
            });
      },
    );
  }
}
