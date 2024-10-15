import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_management/constants/core/shared_keys.dart';
import 'package:gym_management/constants/ui/style_contstants.dart';
import 'package:gym_management/features/dashboard/business_logic/dashboard_cubit.dart';
import 'package:gym_management/features/login/business_logic/login_cubit.dart';
import 'package:gym_management/features/main/pages/main_page.dart';
import 'package:gym_management/features/side_menu/pages/side_menu_page.dart';
import 'package:gym_management/routing/router.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1100, 720),
      minimumSize: Size(1100, 720),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: StyleConstants.bgColor,
        canvasColor: StyleConstants.secondaryColor,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<RouterCubit>(
            create: (context) => RouterCubit(),
          ),
        ],
        child: Scaffold(
          key: SharedKeys.scaffoldKey,
          drawer: const SideMenuPage(),
          body: const SafeArea(
            child: MainPage(),
          ),
        ),
      ),
    );
  }
}
