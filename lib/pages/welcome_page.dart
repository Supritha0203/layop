import 'package:flutter/material.dart';
import 'package:layop2/pages/auth/login_page.dart';
import 'package:layop2/util/app_constant.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController? _pageController;
  int current = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    )),
                child: const Text(
                  "skip",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView(
              physics: BouncingScrollPhysics(),
              onPageChanged: (int page) {
                setState(() {
                  current = page;
                });
              },
              controller: _pageController,
              children: <Widget>[
                Container(
                  child: makePage(
                      text: "Support",
                      description:
                          "Supporting education of children"),
                ),
                Container(
                  child: makePage(
                      text: "Motivation",
                      description:
                          "Motivate them through assignments"),
                ),
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    makePage(
                        text: "Fun",
                        description:
                            "Make learning fun"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    )
                  ],
                )),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildIndicator(),
                ))
          ],
        ));
  }

  Widget makePage({icon, text, description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Image.asset(
        //   image,
        //   width: MediaQuery.of(context).size.width * 0.7,
        // ),
        const Icon(Icons.person),
        Text(
          text,
          style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
        )
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: isActive ? 30 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppConstant.primaryColor),
    );
  }

  List<Widget> buildIndicator() {
    List<Widget> indicator = [];
    for (int i = 0; i < 3; i++) {
      if (current == i) {
        indicator.add(_indicator(true));
      } else {
        indicator.add(_indicator(false));
      }
    }
    return indicator;
  }
}
