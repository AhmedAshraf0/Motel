import 'package:flutter/material.dart';
import 'package:motel/core/color_manager.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('There is no upcoming bookings',style: TextStyle(
            color: ColorManager.primaryButtonColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),
          const SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/nodata.png',width: 250,height: 250,),
        ],
      ),
    );
  }
}
