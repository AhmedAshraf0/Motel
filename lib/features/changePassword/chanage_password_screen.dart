import 'package:flutter/material.dart';
import 'package:motel/core/componant.dart';

class ChanagePassword extends StatelessWidget {
  var emailControle = TextEditingController();
  var passwordControle = TextEditingController();
  var valdiatorKey = GlobalKey<FormState>();

  ChanagePassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Chanage passwored',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Enter your new password and confirm your passwored',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 16)),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: DefaultText(
                    text: 'New password',
                    color: Colors.grey,
                    size: 15,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 3,
              ),
              DefaultTextFormField(
                  text: 'enter new password',
                  color: Colors.white30,
                  borderSidecolor: Colors.white30,
                  type: TextInputType.emailAddress,
                  controle: emailControle,
                  valaditor: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter new password!';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: DefaultText(
                    text: 'Confirm Password',
                    color: Colors.grey,
                    size: 15,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 3,
              ),
              DefaultTextFormField(
                  text: 'enter confirm Password',
                  color: Colors.white30,
                  borderSidecolor: Colors.white30,
                  type: TextInputType.emailAddress,
                  controle: passwordControle,
                  valaditor: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter confirm Password !';
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              DefaultBottom(
                  width: double.infinity,
                  background: Colors.greenAccent,
                  textcolor: Colors.white,
                  onpresse: () {
                    if (valdiatorKey.currentState!.validate()) {
                      passwordControle.text;
                      emailControle.text;
                    }
                  },
                  text: 'Apply'),
            ]),
          ),
        ),
      ),
    );
  }
}
