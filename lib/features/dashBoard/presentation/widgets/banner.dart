import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/dashBoard/presentation/widgets/search_text_feild.dart';
import 'package:motel/features/filterScreen/filteer_sctreen.dart';
import 'package:motel/features/searchScreen/search_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            CarouselSlider.builder(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.56,
                    autoPlay: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) =>
                        BookingAppBloc.get(context)
                            .onChangeAnimatedSmoothIndicator(index)),
                itemCount: BookingAppBloc.get(context).banners.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          BookingAppBloc.get(context).banners[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 2.5,
                              left: 20,
                              right: 20,
                          ),
                          child: Text(
                            BookingAppBloc.get(context).banners[index].title,
                            style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 2,
                                color: ColorManager.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 2.3,
                              left: 20,
                              right: 20),
                          child: Text(
                            BookingAppBloc.get(context).banners[index].title,
                            style: const TextStyle(
                                fontSize: 18.0,
                                wordSpacing: 2,
                                color: ColorManager.white),
                          ),
                        )
                      ],
                    ),
                  );
                }),
            SearchTextField(),
            Container(
              transform: Matrix4.translationValues(0.0, -180.0, 0),
              child: Row(//
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
                      child: DefaultButton(
                        onPressed: () => navigateTo(context, SearchScreen()),
                        text: 'View Hotel',
                        radius: 30,
                        textSize: 16,
                        buttonColor: ColorManager.primary,
                        width: MediaQuery.of(context).size.width / 3,
                      )),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 150, end: 20, bottom: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedSmoothIndicator(
                          activeIndex:
                              BookingAppBloc.get(context).indexIndecator,
                          effect: const WormEffect(
                            dotColor: Colors.grey,
                            activeDotColor: ColorManager.primary,
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 3.0,
                          ),
                          count: BookingAppBloc.get(context).banners.length,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16,),
          ],
        );
      },
    );
  }
}
