import 'package:attatchments_downloader/controllers/home_screen/home_bloc_cubit.dart';
import 'package:attatchments_downloader/controllers/user/user_cubit.dart';
import 'package:attatchments_downloader/screens/home_page.dart';
import 'package:attatchments_downloader/ultils/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// ...

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final userCubit = UserCubit();
  
  runApp(
    MultiBlocProvider(
        providers: [BlocProvider(create: (_) => userCubit)],
        child: const GmailDownloader()),
  );
}

class GmailDownloader extends StatelessWidget {
  const GmailDownloader({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
