import 'package:flutter/material.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';

class FiltterScreen extends StatefulWidget {
  @override
  State<FiltterScreen> createState() => _FiltterScreenState();
}

class _FiltterScreenState extends State<FiltterScreen> {
  RangeValues values = const RangeValues(10, 1000);
  int maxValue = 1000, minValue = 10;
  double price = 100.0;
  bool firstValue = false,
      secondValue = false,
      thirdValue = false,
      forthValue = false,
      fifthValue = false,
      sixthValue = false,
      allValue = false,
      apartValue = false,
      homeValue = false,
      villaValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.cancel_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Price (for 1 night)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Min: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${minValue.toString()}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '-',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Max: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${maxValue.toString()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    //range slider
                  ],
                ),
              ),
              RangeSlider(
                  activeColor: ColorManager.primary,
                  values: values,
                  max: 1000,
                  min: 10,
                  divisions: 24,
                  labels: RangeLabels(values.start.round().toString(),
                      values.end.round().toString()),
                  onChanged: (value) {
                    setState(() {
                      values = value;
                      maxValue = values.end.toInt();
                      minValue = values.start.toInt();
                    });
                  }),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Popular Filters',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorManager.primary,
                          value: firstValue,
                          onChanged: (value) {
                            setState(() {
                              firstValue = value!;
                            });
                          }),
                      const Text(
                        "A/C ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Image.network(
                        BookingAppBloc.get(context)
                            .facilitiesModel!
                            .data![BookingAppBloc.get(context)
                                    .facilitiesMap['A/C']! -
                                5]
                            .image!,
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorManager.primary,
                          value: secondValue,
                          onChanged: (value) {
                            setState(() {
                              secondValue = value!;
                            });
                          }),
                      const Padding(
                        padding: EdgeInsets.only(right: 28.0),
                        child: Text(
                          'Wifi ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Image.network(
                        BookingAppBloc.get(context)
                            .facilitiesModel!
                            .data![BookingAppBloc.get(context)
                            .facilitiesMap['Wifi']! -
                            5]
                            .image!,
                        width: 25,
                        height: 25,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorManager.primary,
                          value: thirdValue,
                          onChanged: (value) {
                            setState(() {
                              thirdValue = value!;
                            });
                          }),
                      const Text(
                        'Garden ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Image.network(
                        BookingAppBloc.get(context)
                            .facilitiesModel!
                            .data![BookingAppBloc.get(context)
                            .facilitiesMap['Garden']! -
                            5]
                            .image!,
                        width: 25,
                        height: 25,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorManager.primary,
                          value: forthValue,
                          onChanged: (value) {
                            setState(() {
                              forthValue = value!;
                            });
                          }),
                      const Text(
                        'Parking ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Image.network(
                        BookingAppBloc.get(context)
                            .facilitiesModel!
                            .data![BookingAppBloc.get(context)
                            .facilitiesMap['Parking']! -
                            5]
                            .image!,
                        width: 25,
                        height: 25,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorManager.primary,
                          value: fifthValue,
                          onChanged: (value) {
                            setState(() {
                              fifthValue = value!;
                            });
                          }),
                      const Text(
                        'Sea View ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Image.network(
                        BookingAppBloc.get(context)
                            .facilitiesModel!
                            .data![BookingAppBloc.get(context)
                            .facilitiesMap['Sea View']! -
                            5]
                            .image!,
                        width: 25,
                        height: 25,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorManager.primary,
                          value: sixthValue,
                          onChanged: (value) {
                            setState(() {
                              sixthValue = value!;
                            });
                          }),
                      const Text(
                        'Kitchen ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Image.network(
                        BookingAppBloc.get(context)
                            .facilitiesModel!
                            .data![BookingAppBloc.get(context)
                            .facilitiesMap['Kitchen']! -
                            5]
                            .image!,
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Distance from city center',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Less than ${price.toInt().toString()} km',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Slider(
                  value: price,
                  max: 200,
                  min: 1,
                  activeColor: ColorManager.primary,
                  onChanged: (value) {
                    setState(() {
                      price = value;
                    });
                  }),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Type of accommodation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'All',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Expanded(
                      child: Switch(
                    value: allValue,
                    activeColor: ColorManager.primary,
                    onChanged: (bool value) {
                      setState(() {
                        allValue = value;
                      });
                    },
                  ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey,
              ),
              Row(
                children: [
                  const Text(
                    'Apartment',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Expanded(
                      child: Switch(
                    activeColor: ColorManager.primary,
                    value: allValue || apartValue,
                    onChanged: (bool value) {
                      setState(() {
                        apartValue = value;
                      });
                    },
                  ))
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Expanded(
                      child: Switch(
                    activeColor: ColorManager.primary,
                    value: allValue || homeValue,
                    onChanged: (bool value) {
                      setState(() {
                        homeValue = value;
                      });
                    },
                  ))
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Villa',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Expanded(
                      child: Switch(
                    activeColor: ColorManager.primary,
                    value: allValue || villaValue,
                    onChanged: (bool value) {
                      setState(() {
                        villaValue = value;
                      });
                    },
                  ))
                ],
              ),
              MainButton(
                text: 'Apply',
                function: () {
                  BookingAppBloc.get(context).searchQueries['max_price'] =
                      maxValue;
                  BookingAppBloc.get(context).searchQueries['min_price'] =
                      minValue;
                  if (firstValue) {
                    if (BookingAppBloc.get(context)
                            .searchQueries['facilities[0]'] ==
                        null) {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[0]'] =
                          BookingAppBloc.get(context).facilitiesMap['A/c'];
                    } else {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[1]'] =
                          BookingAppBloc.get(context).facilitiesMap['A/c'];
                    }
                  }
                  if (secondValue) {
                    if (BookingAppBloc.get(context)
                            .searchQueries['facilities[0]'] ==
                        null) {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[0]'] =
                          BookingAppBloc.get(context).facilitiesMap['Wifi'];
                    } else {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[1]'] =
                          BookingAppBloc.get(context).facilitiesMap['Wifi'];
                    }
                  }
                  if (thirdValue) {
                    if (BookingAppBloc.get(context)
                            .searchQueries['facilities[0]'] ==
                        null) {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[0]'] =
                          BookingAppBloc.get(context).facilitiesMap['Garden'];
                    } else {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[1]'] =
                          BookingAppBloc.get(context).facilitiesMap['Garden'];
                    }
                  }
                  if (forthValue) {
                    if (BookingAppBloc.get(context)
                            .searchQueries['facilities[0]'] ==
                        null) {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[0]'] =
                          BookingAppBloc.get(context).facilitiesMap['Parking'];
                    } else {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[1]'] =
                          BookingAppBloc.get(context).facilitiesMap['Parking'];
                    }
                  }
                  if (fifthValue) {
                    if (BookingAppBloc.get(context)
                            .searchQueries['facilities[0]'] ==
                        null) {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[0]'] =
                          BookingAppBloc.get(context).facilitiesMap['Sea View'];
                    } else {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[1]'] =
                          BookingAppBloc.get(context).facilitiesMap['Sea View'];
                    }
                  }
                  if (sixthValue) {
                    if (BookingAppBloc.get(context)
                            .searchQueries['facilities[0]'] ==
                        null) {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[0]'] =
                          BookingAppBloc.get(context).facilitiesMap['Kitchen'];
                    } else {
                      BookingAppBloc.get(context)
                              .searchQueries['facilities[1]'] =
                          BookingAppBloc.get(context).facilitiesMap['Kitchen'];
                    }
                  }
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
