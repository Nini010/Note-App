import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:note_taking_app/viewmodels/auth_viewmodel.dart';
import 'package:note_taking_app/views/home_screen.dart';
import 'package:note_taking_app/views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, child) {
            return authViewModel.user != null
                ? const HomeScreen()
                : const LoginScreen();
          },
        ),
      ),
    );
  }
}
