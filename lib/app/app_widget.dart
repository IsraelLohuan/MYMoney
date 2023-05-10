import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/home/home_controller.dart';
import 'modules/home/home_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/services/storage/storage.dart';
import 'shared/services/storage/storage_impl.dart';
import 'shared/ui/theme_ui.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Storage>(
          create: (_) => StorageImpl(),
        ),
        ListenableProvider<HomeController>(
          create: (ctx) => HomeController(ctx.read()),
        )
      ],
      child: MaterialApp(
        theme: ThemeUi.lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'MY Money\$',
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/home': (_) => const HomePage()
        },
      ),
    );
  }
}
