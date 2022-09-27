import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';

class TripsPage extends StatelessWidget {
  TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            appBar: tripsScreenAppBar(BookingAppBloc()),
            body: TabBarView(children: BookingAppBloc.get(context).screens),
          ),
        );
      },
    );
  }

  PreferredSize tripsScreenAppBar(BookingAppBloc cubit) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(135),
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
                      cubit.emit(TripChangeTabBarState());
                    },
                    tabs: cubit.tabTitles),
              ),
            ),
          ],
        ));
  }
}
