import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/dashBoard/presentation/widgets/banner.dart';
import 'package:motel/features/dashBoard/presentation/widgets/best_deals.dart';
import 'package:motel/features/dashBoard/presentation/widgets/popular_cities.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBanner(),
            PopularCities(),
            BestDeals(),
          ],
        ),
      ),
    );
  }
}
