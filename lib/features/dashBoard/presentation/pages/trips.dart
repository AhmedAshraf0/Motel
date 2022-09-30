import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/core/strings_manager.dart';

class TripsPage extends StatelessWidget {
  TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingAppBloc.get(context).favoritesData = [];
    for (int i = 0; i < BookingAppBloc.get(context).hotelsData.length; ++i) {
      if (BookingAppBloc.get(context).hotelsData[i].like!) {
        BookingAppBloc.get(context).yub = true;
        BookingAppBloc.get(context).favoritesData.add(BookingAppBloc.get(context).hotelsData[i]);
      }
    }

    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: BookingAppBloc.get(context).getBookingModelUpcoming != null && BookingAppBloc.get(context).getBookingModelCompleted != null,
          builder: (context) => DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Scaffold(
              appBar: tripsScreenAppBar(BookingAppBloc(),context),
              body: TabBarView(children: BookingAppBloc.get(context).screens),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: Colors.greenAccent,
            ),
          ),
        );
      },
    );
  }

  PreferredSize tripsScreenAppBar(BookingAppBloc cubit , context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 50.0,
                left: 24,
              ),
              child: Text(
                'My Trip',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),

                      spreadRadius: 1,
                      blurRadius: 9,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                    labelColor: ColorManager.primary,
                    indicatorColor: Colors.transparent,
                    enableFeedback: true,
                    unselectedLabelColor: ColorManager.grey,
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    onTap: (index) {
                      if(index == 0){
                        // BookingAppBloc.get(context).getBookingCompledted(token: AppStrings.upcomming, count: 10);
                      }else if(index == 1){
                        // BookingAppBloc.get(context).getBookingCompledted(token: AppStrings.completed, count: 10);
                      }
                      cubit.emit(TripChangeTabBarState());
                    },
                    tabs: cubit.tabTitles),
              ),
            ),
          ],
        ));
  }
}
