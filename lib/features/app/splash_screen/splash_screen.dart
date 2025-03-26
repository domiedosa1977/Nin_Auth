import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key,this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),(){
        Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(width:70,
                "images/Screenshot_2025-03-13_165831-removebg-preview (1).png"
            ),
            Column(
              children: [
                Text("National Identification Management Comission",
                  style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w900,
                  color: Colors.green[900],
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Text("-providing assured identity ",
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.green[900],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Image.asset("images/cropped-logo-DKaCK1OE.png"),
    );
  }
}
