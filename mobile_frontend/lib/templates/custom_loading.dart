import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        'asset/images/searching.json',
        fit: BoxFit.fill,
      ),
    );
  }
}
