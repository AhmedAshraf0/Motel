import 'package:fluttertoast/fluttertoast.dart';

import 'color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//General Button For App
class DefaultButton extends StatelessWidget {
  VoidCallback? onPressed;
  String text;
  double? width;
  double? height;
  double? textSize;
  double radius;
  bool isUpperCase;
  Color? buttonColor;
  Color? textColor;

  DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width = double.infinity,
      this.height,
      this.radius = 12.0,
      this.isUpperCase = false,
      this.buttonColor = ColorManager.primaryButtonColor,
      this.textColor = ColorManager.white,
      this.textSize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: textColor, fontSize: textSize),
        ),
      ),
    );
  }
}

//General TextButton For App
class DefaultTextButton extends StatelessWidget {
  VoidCallback? function;
  String text;

  DefaultTextButton({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(color: ColorManager.primary),
      ),
    );
  }
}

//Navigat to Screen
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

//Navigat to Screen And Close old Screen
void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

class HotelCard extends StatelessWidget {
  String imageURL;
  String? hotelName;
  String? location;
  String? distance;
  String? price;
  double? rate;
  Color? backgrowndColor;

  HotelCard(
      {required this.imageURL,
      required this.hotelName,
      required this.location,
      required this.distance,
      required this.price,
      required this.rate,
      this.backgrowndColor = Colors.white70});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        // width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgrowndColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0,3),
            ),
          ],
        ),
        child: Row(
          //
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              child: Image.asset(
                imageURL,
                fit: BoxFit.cover,
                width: 108,
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 170,
                        child: Text(
                          hotelName!,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 160,
                        child: Text(
                          location!,
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 106,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  size: 16,
                                  color: ColorManager.primary,
                                ),
                                Container(
                                  width: 86,
                                  child: Text(
                                    distance!,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RatingBarIndicator(
                            direction: Axis.horizontal,
                            rating: rate!,
                            itemSize: 18,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.only(right: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: ColorManager.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            '\$$price',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '/per night',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinishedCardLeft extends StatelessWidget {
  String imageURL;
  String hotelName;
  String location;
  String distance;
  String date;
  String price;
  double rate;

  FinishedCardLeft({
    required this.imageURL,
    required this.hotelName,
    required this.location,
    required this.distance,
    required this.price,
    required this.date,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              imageURL,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140,
                child: Text(
                  maxLines: 1,
                  hotelName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 100,
                child: Text(
                  maxLines: 1,
                  location,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Text(
                maxLines: 1,
                textAlign: TextAlign.left,
                date.split(',')[0],
                style: TextStyle(fontSize: 12),
              ),
              Text(
                maxLines: 1,
                textAlign: TextAlign.left,
                date.split(',')[1],
                style: TextStyle(fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 18,
                    color: ColorManager.primary,
                  ),
                  Container(
                    width: 110,
                    child: Text(
                      maxLines: 1,
                      distance,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
              RatingBarIndicator(
                direction: Axis.horizontal,
                rating: rate,
                itemSize: 22,
                itemCount: 5,
                itemPadding: const EdgeInsets.only(right: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: ColorManager.primary,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$$price',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    ' /per night',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FinishedCardRight extends StatelessWidget {
  String imageURL;
  String hotelName;
  String location;
  String distance;
  String date;
  String price;
  double rate;

  FinishedCardRight({
    required this.imageURL,
    required this.hotelName,
    required this.location,
    required this.distance,
    required this.price,
    required this.date,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 140,
                child: Text(
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  hotelName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 130,
                child: Text(
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  location,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Text(
                date.split(',')[0],
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                date.split(',')[1],
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 18,
                    color: ColorManager.primary,
                  ),
                  Container(
                    width: 110,
                    child: Text(
                      maxLines: 1,
                      distance,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
              RatingBarIndicator(
                direction: Axis.horizontal,
                rating: rate,
                itemSize: 22,
                itemCount: 5,
                itemPadding: const EdgeInsets.only(right: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: ColorManager.primary,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$$price',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    ' /per night',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              imageURL,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingCard extends StatelessWidget {
  bool like;
  String imageURL;
  String hotelName;
  String location;
  String distance;
  String price;
  String offerdate;
  String reviews;
  double rate;
  Color? backgrowndColor;

  UpcomingCard(
      {required this.imageURL,
      required this.hotelName,
      required this.location,
      required this.distance,
      required this.price,
      required this.rate,
      required this.offerdate,
      required this.reviews,
      this.backgrowndColor = Colors.white70,required this.like});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            offerdate,
            textAlign: TextAlign.center,
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 255,
            width: double.infinity,
            alignment: AlignmentDirectional.topStart,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),

                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    image: DecorationImage(
                      image: AssetImage(imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          CircleAvatar(
                              backgroundColor: ColorManager.white,
                              child: !like ? Icon(
                                Icons.favorite_border,
                                color: ColorManager.primary,
                              ):Icon(
                                Icons.favorite,
                                color: ColorManager.primary,
                              ),)
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 232,
                            child: Text(
                              maxLines: 1,
                              hotelName,
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '\$$price',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Hurghada, Egypt',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.location_pin,
                                      size: 16,
                                      color: ColorManager.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: distance,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              '/per night',
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            direction: Axis.horizontal,
                            rating: rate,
                            itemSize: 18,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.only(right: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: ColorManager.primary,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              reviews,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class ExplorPageTitle extends StatelessWidget {
  ExplorPageTitle(
      {Key? key, required this.title, this.textColor = ColorManager.black})
      : super(key: key);
  String title;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 32,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              wordSpacing: 2,
              color: textColor!),
        ),
      ],
    );
  }
}

class PopularCitiesCard extends StatelessWidget {
  String imageURL;
  String? cityName;

  PopularCitiesCard({
    required this.imageURL,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 150,
        transform: Matrix4.translationValues(0.0, 0.0, 0),
        padding: EdgeInsets.only(top: 40, left: 16, right: 16),
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imageURL), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              // padding: EdgeInsets.all(16),
              transform: Matrix4.translationValues(0.0, -20.0, 0),
              child: Text(
                cityName!,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                    color: ColorManager.white),
              ),
            ),
          ],
        ));
  }
}

//-------------------------------------------------------

class DefaultBottom extends StatelessWidget {
  final double width;
  final Color background;
  final Color textcolor;
  final Function onpresse;
  final String text;

  const DefaultBottom(
      {Key? key,
      required this.width,
      required this.background,
      required this.textcolor,
      required this.onpresse,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: background,
      ),
      width: width,
      child: MaterialButton(
        onPressed: () {
          onpresse();
        },
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
    );
  }
}

class DefaultTextFormField extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderSidecolor;
  final TextInputType type;
  final TextEditingController controle;
  final String? Function(String?) valaditor;
  Function(String?)? onchange;
  Function(String?)? onsubmitted;
  Function? suficepress;
  IconData? sufex;
  bool textScure = false;

  DefaultTextFormField({
    super.key,
    required this.text,
    required this.color,
    required this.borderSidecolor,
    required this.type,
    required this.controle,
    required this.valaditor,
    this.onsubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Card(
        margin: const EdgeInsets.all(1),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextFormField(
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 15, color: Colors.black),
            decoration: InputDecoration(
                filled: true,
                fillColor: color,
                hintText: text,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderSidecolor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2))),
            keyboardType: type,
            controller: controle,
            validator: valaditor,
            obscureText: textScure,
            onChanged: onchange,
            onFieldSubmitted: onsubmitted,
          ),
        ),
      ),
    );
  }
}

class DefaultTextButtom extends StatelessWidget {
  final Function function;
  final String text;
  final Color color;

  const DefaultTextButtom(
      {Key? key,
      required this.function,
      required this.text,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 15),
        ));
  }
}

class DefaultText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const DefaultText(
      {Key? key,
      required this.text,
      required this.color,
      required this.size,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight));
  }
}

class DefaultButtomIcon extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final Color coloricon;
  final IconData icon;
  final Color colortext;

  const DefaultButtomIcon({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
    required this.colortext,
    required this.coloricon,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
      child: MaterialButton(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: coloricon, size: 28),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: colortext, fontSize: size),
          )
        ]),
        onPressed: () {},
        elevation: 8,
      ),
    );
  }
}

class DefaultButtom extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final Color coloricon;
  final IconData icon;
  final Color colortext;

  const DefaultButtom({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
    required this.colortext,
    required this.coloricon,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
      child: MaterialButton(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text,
            style: TextStyle(color: colortext, fontSize: size),
          ),
          Icon(icon, color: coloricon, size: 28),
        ]),
        onPressed: () {},
        elevation: 8,
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  MainButton({
    Key? key,
    required this.text,
    this.backgroundColor = ColorManager.primary,
    this.foregroundColor = ColorManager.white,
    this.horizontalPadding = 0,
    this.width = double.infinity,
    required this.function,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double horizontalPadding;
  final double? width;
  VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SizedBox(
        width: width,
        height: 50,
        child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}


void toastMsg({required String msg, required Color color}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
