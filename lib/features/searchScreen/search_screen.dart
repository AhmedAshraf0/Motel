import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/NoDataScreen/noDataScreen2.dart';
import 'package:motel/features/filterScreen/filteer_sctreen.dart';
import 'package:motel/features/hotel/presentation/pages/hotel_page.dart';
import 'package:motel/features/searchScreen/widgets/custom_input_field.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Explore',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.mapLocationDot, color: Colors.black))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: Row(
              children: [
                Container(
                  width: 280,
                  child: CustomInputField(
                    hintText: 'london..',
                    function: (value) {
                      BookingAppBloc.get(context).searchQueries['name'] =
                          value.toString();
                      BookingAppBloc.get(context).searchForHotels();
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      BookingAppBloc.get(context).searchQueries['name'] =
                          BookingAppBloc.get(context)
                              .textEditingController
                              .text;
                      BookingAppBloc.get(context).searchForHotels();
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 32,
                      child: Icon(
                        Icons.search,
                        size: 28,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Choose Date',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '23, sep - 28, sep',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 2,
                height: 70,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Number of Room',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1 Room, 2 People',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                BlocConsumer<BookingAppBloc, BookingAppState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Text(
                      '${BookingAppBloc.get(context).searchList.length.toString()} Hotel Found',
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 15,
                      ),
                    );
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'Filter',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      navigateTo(context, FiltterScreen());
                    },
                    icon: const Icon(
                      Icons.sort,
                      size: 25,
                    ))
              ],
            ),
          ),
          BlocConsumer<BookingAppBloc, BookingAppState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              int hotelCount = BookingAppBloc.get(context).searchList.length;
              return ConditionalBuilder(
                condition: state is LoadingSearchForHotelsState ||
                    state is ErrorSearchForHotelsState,
                builder: (context) => Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                ),
                fallback: (context) => Expanded(
                  child: (hotelCount == 0)
                      ? SingleChildScrollView(child: NoDataScreen2())
                      : ListView.builder(
                          itemCount: hotelCount,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String currentKM;
                            int j = BookingAppBloc.get(context)
                                .searchList[index]
                                .description!
                                .indexOf('km');
                            if (j != -1) {
                              currentKM = BookingAppBloc.get(context)
                                      .searchList[index]
                                      .description![j - 3] +
                                  BookingAppBloc.get(context)
                                      .searchList[index]
                                      .description![j - 2];
                            } else {
                              currentKM =
                                  '${index * BookingAppBloc.get(context).randomNums[index]}';
                            }
                            currentKM += ' km to airport';

                            return GestureDetector(
                              onTap: () {
                                navigateTo(
                                    context,
                                    HotelPage(
                                      hotelListIndex:
                                          BookingAppBloc.get(context)
                                                  .searchList[index]
                                                  .id! -
                                              18,
                                      distance: currentKM,
                                      indexOfHotel: index,
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: 350,
                                      height: 290,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  BookingAppBloc.get(context)
                                                          .imgLinks[
                                                      BookingAppBloc.get(
                                                                  context)
                                                              .searchList[index]
                                                              .id! -
                                                          18],
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            width: double.infinity,
                                            height: 200,
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8, top: 8),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.favorite_outline,
                                                      color: Color(0xff4fbe9e),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    BookingAppBloc.get(context)
                                                        .searchList[index]
                                                        .name!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                Text(
                                                  '\$${BookingAppBloc.get(context).searchList[index].price!}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Hurghada, Egypt',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.location_on_rounded,
                                                      size: 16,
                                                      color: Color(0xff4fbe9e),
                                                    ),
                                                    Text(
                                                      currentKM,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Text(
                                                  '/per night',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Row(
                                              children: [
                                                RatingBar.builder(
                                                  minRating: 1,
                                                  maxRating: 5,
                                                  initialRating: 4.5,
                                                  allowHalfRating: true,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemSize: 16,
                                                  itemPadding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 2.0,
                                                  ),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Color(0xff4fbe9e),
                                                  ),
                                                  onRatingUpdate:
                                                      (double value) {},
                                                ),
                                                const Text(
                                                  '80 Reviews',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
