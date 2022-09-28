import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/changePassword/chanage_password_screen.dart';
import 'package:motel/features/settingScreen/setting_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object>? imageSwitch;
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        if(state is SuccessProfileData){
          if(BookingAppBloc.get(context).networkImage){
            imageSwitch = NetworkImage(BookingAppBloc.get(context).profileModel!.data!.image!);
          }else{
            imageSwitch = AssetImage(BookingAppBloc.get(context).profileModel!.data!.image!);
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition:  BookingAppBloc.get(context).profileModel == null,
          builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: Colors.greenAccent,
            ),
          ),
          fallback: (context) => Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            BookingAppBloc.get(context)
                                .profileModel!
                                .data!
                                .name!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('View and Edit profile',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.black54,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/dp1.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Change Password',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            navigateTo(context, ChanagePassword());
                          },
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                            size: 27,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invite Friend',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.people_rounded,
                            color: Colors.grey,
                            size: 27,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Credit & Coupons',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.gift,
                            color: Colors.grey,
                            size: 27,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Help Center',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.circleInfo,
                            color: Colors.grey,
                            size: 27,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.solidCreditCard,
                            color: Colors.grey,
                            size: 27,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Setting',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            navigateTo(context, SettingScreen());
                          },
                          icon: const Icon(
                            FontAwesomeIcons.gear,
                            color: Colors.grey,
                            size: 27,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
