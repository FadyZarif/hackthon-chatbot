import 'package:competition/screens/chat_screen/cubit/chat_cubit.dart';
import 'package:competition/screens/sign_in/cubit/cubit.dart';
import 'package:competition/screens/sign_in/signInScreen.dart';
import 'package:competition/shared/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc_observer.dart';
import 'const/const.dart';
import 'drawer.dart';
import 'firebase_options.dart';
import 'homeScreenpet.dart';
bool? isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DioHelper.init();
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    uId = user.uid;
    isLogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SignInCubit()),
        BlocProvider(create: (BuildContext context) => ChatCubit()),
      ],
      child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('ar'),
          ],
          locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
          title: 'Smart services',

          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: isLogin!? HomePage():  SignInScreen() //HomeScreen(),
          // home: MessagesScreen(),
          ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), HomeScreenpet()],
      ),
    );
  }
}
