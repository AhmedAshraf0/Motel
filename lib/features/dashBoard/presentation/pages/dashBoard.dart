import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: state is LoadingHotelsDataState || state is ErrorHotelsDataState,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            ),
            fallback: (context)=>BookingAppBloc.get(context)
                .pages[BookingAppBloc.get(context).currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: ColorManager.primary,
              unselectedItemColor: ColorManager.grey,
              currentIndex: BookingAppBloc.get(context).currentIndex,
              onTap: BookingAppBloc.get(context).onTap,
              items: BookingAppBloc.get(context).items),
        );
      },
    );
  }
}
