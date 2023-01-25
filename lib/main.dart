import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:subscription/screens/login_page_screens/loginpage.dart';

void main(){
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        backgroundColor: const Color(0xff181A1E)
      ),
      home: const LoginPage(),
    );
  }
}

//
// void main()
// {
//   runApp(MaterialApp(
//       theme: ThemeData(
//         backgroundColor: const Color(0xff181A1E)
//       ),
//     home: LoginPage(),
//   ));
// }
