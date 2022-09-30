import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/features/loginScreen/login_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Setting',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
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
                      'Notifications',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.grey,
                      size: 25,
                    )),
              ],
            ),

            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme Mode',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      // SimpleDialog(
                      //   title: const Text('GeeksforGeeks'),
                      //   children: <Widget>[
                      //     SimpleDialogOption(
                      //       onPressed: () {},
                      //       child: const Text('Option 1'),
                      //     ),
                      //     SimpleDialogOption(
                      //       onPressed: () {},
                      //       child: const Text('Option 2'),
                      //     ),
                      //   ],
                      // );

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              elevation: 10,
                              actions: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.light_mode)),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text('Lighr',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.dark_mode_outlined)),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text('Dark',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      FontAwesomeIcons.circleHalfStroke,
                      color: Colors.grey,
                      size: 25,
                    )),
              ],
            ),

            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fonts',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.font,
                      color: Colors.grey,
                      size: 25,
                    )),
              ],
            ),

            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.palette,
                      color: Colors.grey,
                      size: 25,
                    )),
              ],
            ),

            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.language,
                      color: Colors.grey,
                      size: 25,
                    )),
              ],
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
                      'Country',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  'American Samoa',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w300),
                )
              ],
            ),
            const SizedBox(
              height: 10,
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
                      'Currency',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  '\$ AUD',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w300),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            ////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms of services',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text('namsald'),
                      //       );
                      //     });
                      //   PopupMenuItem<>()
                      // PopupMenuButton<MenuItem>(
                      //     elevation: 10,
                      //     itemBuilder: (context) =>
                      //         [..MenuItem.iteme.map(buildItem).toList()
                      //     ]);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    )),
              ],
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            ////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text('namsald'),
                      //       );
                      //     });
                      //   PopupMenuItem<>()
                      // PopupMenuButton<MenuItem>(
                      //     elevation: 10,
                      //     itemBuilder: (context) =>
                      //         [..MenuItem.iteme.map(buildItem).toList()
                      //     ]);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    )),
              ],
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text('namsald'),
                      //       );
                      //     });
                      //   PopupMenuItem<>()
                      // PopupMenuButton<MenuItem>(
                      //     elevation: 10,
                      //     itemBuilder: (context) =>
                      //         [..MenuItem.iteme.map(buildItem).toList()
                      //     ]);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    )),
              ],
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Give us Feedbacks',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text('namsald'),
                      //       );
                      //     });
                      //   PopupMenuItem<>()
                      // PopupMenuButton<MenuItem>(
                      //     elevation: 10,
                      //     itemBuilder: (context) =>
                      //         [..MenuItem.iteme.map(buildItem).toList()
                      //     ]);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    )),
              ],
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log out',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>AlertDialog(
                          title: Text('Are you Sure?'),
                          content: Text('You want to Sign Out.'),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: Text('NO',style: TextStyle(
                                    color: Colors.green,
                                  ),),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text('YES',style: TextStyle(
                                    color: Colors.red,
                                  ),),
                                  onPressed: (){
                                    navigateAndFinish(context, LoginScreen());
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

// class MenuItem {
//   final String text;
//   final IconData icon;
//
//   MenuItem({required this.text, required this.icon});
// }
