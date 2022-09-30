import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/core/strings_manager.dart';
import 'package:motel/features/loginScreen/login_screen.dart';

class SignupScreen extends StatelessWidget {
  var firstNameControle = TextEditingController();
  var lastNameControle = TextEditingController();
  var emailControle = TextEditingController();
  var passwordControle = TextEditingController();
  var valdiatorKey = GlobalKey<FormState>();

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        if (state is SuccessRegisterState && SuccessRegisterState.apiStatus == '1') {
          toastMsg(
              msg: BookingAppBloc.get(context).registerModel!.status!.enMsg!,
              color: Colors.green);
        }else if (state is SuccessRegisterState && SuccessRegisterState.apiStatus == '0') {
          toastMsg(
              msg: BookingAppBloc.get(context).registerModel!.status!.enMsg!,
              color: Colors.red);
        } else if (state is ErrorRegisterState) {
          toastMsg(
              msg: 'Sign up failed',
              color: Colors.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: valdiatorKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: const [
                          DefaultButtomIcon(
                              text: 'Facebook',
                              color: Colors.blue,
                              size: 15,
                              colortext: Colors.white,
                              coloricon: Colors.white,
                              icon: FontAwesomeIcons.facebook),
                          SizedBox(
                            width: 5,
                          ),
                          DefaultButtomIcon(
                              text: 'Twitter',
                              color: Colors.lightBlueAccent,
                              size: 15,
                              colortext: Colors.white,
                              coloricon: Colors.white,
                              icon: FontAwesomeIcons.twitter),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('or log in  with email',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 16)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: DefaultText(
                            text: 'First name',
                            color: Colors.grey,
                            size: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      DefaultTextFormField(
                          text: 'Enter first name',
                          color: Colors.white30,
                          borderSidecolor: Colors.white30,
                          type: TextInputType.text,
                          controle: firstNameControle,
                          onsubmitted: (text){
                            if (valdiatorKey.currentState!.validate()) {
                              passwordControle.text;
                              emailControle.text;
                              lastNameControle.text;
                              firstNameControle.text;
                              BookingAppBloc.get(context).registerFunction(
                                firstName: firstNameControle.text,
                                lastName: lastNameControle.text,
                                email: emailControle.text,
                                password: passwordControle.text,
                              );
                            }
                          },
                          valaditor: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Name !';
                            }
                            return null;
                          }),
                      //////////////////////
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: DefaultText(
                            text: 'Last name',
                            color: Colors.grey,
                            size: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      DefaultTextFormField(
                          text: 'Enter last name',
                          color: Colors.white30,
                          borderSidecolor: Colors.white30,
                          type: TextInputType.text,
                          controle: lastNameControle,
                          onsubmitted: (text){
                            if (valdiatorKey.currentState!.validate()) {
                              passwordControle.text;
                              emailControle.text;
                              lastNameControle.text;
                              firstNameControle.text;
                              BookingAppBloc.get(context).registerFunction(
                                firstName: firstNameControle.text,
                                lastName: lastNameControle.text,
                                email: emailControle.text,
                                password: passwordControle.text,
                              );
                            }
                          },
                          valaditor: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Name !';
                            }
                            return null;
                          }),
                      ///////////////////////////////////
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: DefaultText(
                            text: 'Your email',
                            color: Colors.grey,
                            size: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      DefaultTextFormField(
                          text: 'Enter your email',
                          color: Colors.white30,
                          borderSidecolor: Colors.white30,
                          type: TextInputType.emailAddress,
                          controle: emailControle,
                          onsubmitted: (text){
                            if (valdiatorKey.currentState!.validate()) {
                              passwordControle.text;
                              emailControle.text;
                              lastNameControle.text;
                              firstNameControle.text;
                              BookingAppBloc.get(context).registerFunction(
                                firstName: firstNameControle.text,
                                lastName: lastNameControle.text,
                                email: emailControle.text,
                                password: passwordControle.text,
                              );
                            }
                          },
                          valaditor: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email !';
                            }
                            return null;
                          }),
                      ////////////////////////////////////////
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: DefaultText(
                            text: 'Password',
                            color: Colors.grey,
                            size: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      DefaultTextFormField(
                          text: 'Enter Password',
                          color: Colors.white30,
                          borderSidecolor: Colors.white30,
                          type: TextInputType.emailAddress,
                          controle: passwordControle,
                          onsubmitted: (text){
                            if (valdiatorKey.currentState!.validate()) {
                              passwordControle.text;
                              emailControle.text;
                              lastNameControle.text;
                              firstNameControle.text;
                              BookingAppBloc.get(context).registerFunction(
                                firstName: firstNameControle.text,
                                lastName: lastNameControle.text,
                                email: emailControle.text,
                                password: passwordControle.text,
                              );
                            }
                          },
                          valaditor: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Password !';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is LoadingRegisterState,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(
                              color: Colors.greenAccent),
                        ),
                        fallback: (context) => DefaultBottom(
                          width: double.infinity,
                          background: Colors.greenAccent,
                          textcolor: Colors.white,
                          onpresse: () {
                            if (valdiatorKey.currentState!.validate()) {
                              passwordControle.text;
                              emailControle.text;
                              lastNameControle.text;
                              firstNameControle.text;
                              BookingAppBloc.get(context).registerFunction(
                                firstName: firstNameControle.text,
                                lastName: lastNameControle.text,
                                email: emailControle.text,
                                password: passwordControle.text,
                              );
                            }
                          },
                          text: 'Sign up',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.textSignup,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.textSignup2,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.textSignup3,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 15),
                          ),
                          DefaultTextButtom(
                              function: () {
                                navigateAndFinish(context, LoginScreen());
                              },
                              text: 'Login',
                              color: Colors.greenAccent)
                        ],
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
