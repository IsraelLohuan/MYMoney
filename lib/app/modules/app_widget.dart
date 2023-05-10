import 'package:flutter/material.dart';
import 'package:mymoney/app/pages/config_expense_page.dart';
import 'package:provider/provider.dart';
import 'controllers/home_controller.dart';
import 'pages/home_page.dart';
import 'pages/splash_page.dart';
import 'shared/services/storage/storage_impl.dart';
import 'shared/ui/theme_ui.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StorageImpl>(
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
          '/home': (_) => const HomePage(),
          '/config-expense': (_) => const ConfigExpensePage()
        },
      ),
    );
  }
}
