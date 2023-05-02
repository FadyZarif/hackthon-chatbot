import 'package:competition/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../const/const.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../sign_up/signUpScreen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignInScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastState.ERROR);
          }
          if (state is LoginSuccessState) {
            // CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            //   Navigator.pushReplacementNamed(context, Layout.RouteName);
            // });
            navigateToReplacement(context, HomePage());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.blueGrey
            //Color(0xff192028),
            ,
            body: SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * .1),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 200,
                              child: Image(
                                image:
                                    AssetImage('assets/images/image (1).png'),
                              ),
                            )),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              EditTextField(
                                  ontab: () {},
                                  context: context,
                                  icon: Icons.email_outlined,
                                  hintText: '...Email',
                                  isPassword: false,
                                  isEmail: true,
                                  controller: emailController),
                              SizedBox(
                                height: 1.5,
                              ),
                              EditTextField(
                                  ontab: () {},
                                  context: context,
                                  icon: Icons.lock_outline,
                                  hintText: '...Password',
                                  isPassword: true,
                                  isEmail: false,
                                  controller: passwordController),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Button(
                                    context: context,
                                    string: 'SIGN IN',
                                    width: 2.58,
                                    voidCallback: () {
                                      HapticFeedback.lightImpact();

                                      SignInCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                      navigateToReplacement(
                                          context, HomePage());
                                    },
                                  ),
                                  SizedBox(width: size.width / 20),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Button(
                                context: context,
                                string: 'SIGN UP',
                                width: 2,
                                voidCallback: () {
                                  HapticFeedback.lightImpact();
                                  Fluttertoast.showToast(
                                      msg: 'SIGN UP button pressed');
                                  navigateToReplacement(context, SignUpScreen());
                                },
                              ),
                              SizedBox(height: size.height * .05),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void showToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;

    case ToastState.ERROR:
      color = Colors.red;
      break;

    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
