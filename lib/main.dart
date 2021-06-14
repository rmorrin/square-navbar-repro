import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_repro/payment_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.blue,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _setSystemChrome();
    _initSquarePayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              child: Text('Page with AppBar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(true),
                  ),
                );
              },
            ),
            TextButton(
              child: Text('Page without AppBar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(false),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _initSquarePayment() async {
    await InAppPayments.setSquareApplicationId('REPLACE_ME');
  }

  void _setSystemChrome() {
    // Setup the status bar colors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
