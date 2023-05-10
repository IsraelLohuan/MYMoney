import 'package:flutter/material.dart';
import 'package:mymoney/app/shared/services/storage/storage.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      context.read<Storage>().init().then((_) {
        Navigator.of(context).pushReplacementNamed('/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'MY ',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 23,
                  color: Colors.grey
                )
              ),
              TextSpan(
                text: 'Money\$',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: Colors.green,
                  fontSize: 20
                )
              ),
            ]
          ),
        ),
      )
    );
  }
}