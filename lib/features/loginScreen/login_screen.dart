import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motel/core/componant.dart';
import 'package:motel/core/cubit/bloc.dart';
import 'package:motel/core/cubit/states.dart';
import 'package:motel/features/signUpScreen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  var emailControle = TextEditingController();
  var passwordControle = TextEditingController();
  var valdiatorKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingAppBloc, BookingAppState>(
      listener: (context, state) {
        if (state is SuccessLoginState && SuccessLoginState.apiStatus == '1') {
          toastMsg(
              msg: BookingAppBloc.get(context).loginModel!.status!.enMsg!,
              color: Colors.green);
        } else if (state is SuccessLoginState &&
            SuccessLoginState.apiStatus == '0') {
          toastMsg(
              msg: BookingAppBloc.get(context).loginModel!.status!.enMsg!,
              color: Colors.red);
        } else if (state is ErrorLoginState) {
          toastMsg(msg: 'Login failed', color: Colors.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: valdiatorKey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        // style: Theme.of(context).textTheme.bodyText2,
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
                        height: 14,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'or log in with email',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
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
                              BookingAppBloc.get(context).loginFunction(
                                email: emailControle.text,
                                password: passwordControle.text,
                                context: context,
                              );
                            }
                          },
                          valaditor: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email !';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 19,
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
                              BookingAppBloc.get(context).loginFunction(
                                email: emailControle.text,
                                password: passwordControle.text,
                                context: context,
                              );
                            }
                          },
                          valaditor: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Password !';
                            }
                            return null;
                          }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DefaultTextButtom(
                            function: () {
                              // forgot(context);
                            },
                            text: 'Forgot your password?',
                            color: Colors.grey),
                      ),
                      ConditionalBuilder(
                        condition: state is LoadingLoginState,
                        builder: (context) => Center(
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
                                BookingAppBloc.get(context).loginFunction(
                                  email: emailControle.text,
                                  password: passwordControle.text,
                                  context: context,
                                );
                              }
                            },
                            text: 'Login'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Don't have an account!",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.greenAccent,
                              ),
                            ),
                            onPressed: () {
                              navigateTo(context, SignupScreen());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
