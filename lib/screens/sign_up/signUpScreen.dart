import 'package:competition/home/home_screen.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const/const.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../sign_in/signInScreen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignUpScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var NIDcontroller = TextEditingController();
  late DateTime DOB;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            {
              navigateToReplacement(context, HomeScreen());
            }
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
                          Padding(
                            padding: EdgeInsets.only(top: 60, bottom: 10),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            child: Image(
                              image: AssetImage('assets/images/image (1).png'),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              EditTextField(
                                context: context,
                                icon: Icons.person,
                                hintText: '...Name',
                                isPassword: false,
                                isEmail: true,
                                controller: nameController,
                                ontab: () {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 54,
                                width: size.width / 1.2,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: DateTimeFormField(
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.date_range,
                                        color: Colors.white70,
                                        //  color:,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 15,
                                      ),
                                      hintText: 'Birth day',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      labelStyle: TextStyle(
                                          color: Colors.white38, fontSize: 15),
                                      errorStyle:
                                          TextStyle(color: Colors.redAccent),
                                    ),
                                    mode: DateTimeFieldPickerMode.date,
                                    dateTextStyle:
                                        TextStyle(color: Colors.white38),
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (e) => (e?.day ?? 0) == 1
                                        ? 'Please not the first day'
                                        : null,
                                    onDateSelected: (DateTime value) {
                                      print(value);
                                      DOB = value;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              EditTextField(
                                context: context,
                                icon: Icons.phone,
                                hintText: '...Phone',
                                isPassword: false,
                                isEmail: true,
                                controller: phoneController,
                                ontab: () {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              EditTextField(
                                context: context,
                                icon: Icons.account_box,
                                hintText: '...National ID',
                                isPassword: false,
                                isEmail: true,
                                controller: NIDcontroller,
                                ontab: () {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              EditTextField(
                                context: context,
                                icon: Icons.email_outlined,
                                hintText: '...Email',
                                isPassword: false,
                                isEmail: true,
                                controller: emailController,
                                ontab: () {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              EditTextField(
                                context: context,
                                icon: Icons.lock_outline,
                                hintText: '...Password',
                                isPassword: true,
                                isEmail: false,
                                controller: passwordController,
                                ontab: () {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Button(
                                    context: context,
                                    string: 'SIGN UP',
                                    width: 2.58,
                                    voidCallback: () {
                                      RegisterCubit.get(context).userRegister(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text,
                                          NId: NIDcontroller.text,
                                          DOB: DOB);
                                      HapticFeedback.lightImpact();
                                      navigateToReplacement(
                                          context, SignInScreen());
                                    },
                                  ),
                                  SizedBox(width: size.width / 20),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Button(
                                    context: context,
                                    string: 'SIGN IN',
                                    width: 2,
                                    voidCallback: () {
                                      HapticFeedback.lightImpact();

                                      navigateToReplacement(
                                          context, SignInScreen());
                                    },
                                  ),
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
              ));
        },
      ),
    );
  }
}
