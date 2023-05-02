import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:competition/screens/sign_up/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user_model.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit()
      : super(RegisterIntialState()); // need intial state in the super

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool securedPassword = true;
  IconData Suffix = Icons.visibility;

  void ChangePasswordVisibility() {
    securedPassword = !securedPassword;

    Suffix = securedPassword ? Icons.visibility_off : Icons.visibility;
    emit(RegChangePasswordVisibilityState());
  }

  // Authentication
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String NId,
    required DateTime DOB,
  }) {
    emit(RegisterLoadinState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      UserCreate(
        name: name,
        email: email,
        uId: value.user!.uid,
        phone: phone,
        NId: NId,
        DOB: DOB,


      ); // save data in firestore
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

// save data in firestore
  void UserCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required String NId,
    required DateTime DOB
  }) {
    UserModel model = UserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        NId: NId,
        DOB: DOB
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  static showLoading(context, String loadingMessage,
      {bool isCancelabele = true}) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(loadingMessage),
              ],
            ),
          );
        },
        barrierDismissible: isCancelabele);
  }
}
