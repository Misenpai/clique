import 'package:clique/constants/routes.dart';
import 'package:clique/firebase_options.dart';
import 'package:clique/group_chat/group_chat_screen.dart';
import 'package:clique/screens/home_screen.dart';
import 'package:clique/views/login_view.dart';
import 'package:clique/views/register_view.dart';
import 'package:clique/views/verify_email_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      verifyEmailRoute: (context) => const VerifyEmailView(),
      homeScreenRoute: (context) => const HomeScreen(),
      groupChatscreen: (context) => const GroupChatScreen(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return const LoginView();
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
