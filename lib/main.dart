import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/api/dio_helper.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/core/cubit/blocObserver.dart';
import 'package:motel/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:motel/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
        () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingAppBloc()..getFacilities(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MOTEL',
        home: OnBoardingScreen(),
      ),
    );
  }
}
