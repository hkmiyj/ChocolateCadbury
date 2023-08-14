import 'package:flutter/material.dart';
import 'package:mobile_frontend/pages/ReportPage/report.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'configs/colors.dart';
import 'services/chocolate_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChocolateService()),
      ],
      builder: (context, child) {
        return ResponsiveSizer(builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'CadburyReport',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const ReportPage(),
            },
          );
        });
      },
    );
  }
}
