import 'package:flutter/material.dart';
import 'package:motel/core/color_manager.dart';
import 'package:motel/core/cubit/bloc.dart';

class CustomInputField extends StatelessWidget {
  // final TextEditingController inputController;
  CustomInputField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.function,
  });
  final String? hintText;
  final Widget? prefixIcon;
  dynamic function =(){};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: ColorManager.grey.withOpacity(.1)),
            ]),
            child: TextField(
              controller: BookingAppBloc.get(context).textEditingController,
              onSubmitted: function,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                // label: const Text("Email"),
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: ColorManager.white,
                hintText: hintText,
                hintStyle:
                    TextStyle(color: ColorManager.lightGrey.withOpacity(0.75)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorManager.secondry, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorManager.secondry, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.error, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorManager.secondry, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
