import 'package:flutter/material.dart';
import 'package:motel/core/color_manager.dart';

class NoDataScreen2 extends StatelessWidget {
  const NoDataScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Results Found',style: TextStyle(
            color: ColorManager.primaryButtonColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),
          const SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/search.png',width: 130,height: 130,),
        ],
      ),
    );
  }
}
