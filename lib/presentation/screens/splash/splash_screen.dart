import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:testflutterclean/presentation/screens/dashboard/dashboard_screen.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          "News app",
          style: TextStyle(
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  gotoDashboard() async {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()));
    });
  }
}
