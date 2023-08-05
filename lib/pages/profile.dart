import 'package:flutter/material.dart';
import 'package:layop2/util/app_constant.dart';
import 'package:layop2/widget/k_height.dart';
import 'package:layop2/widget/k_text.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  void initState() {
    super.initState();
    // initService();
  }

  String name = "Your Name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, elevation: 0, title: const KText(text: "Profile")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 25),
          child: SingleChildScrollView(
            child: Column(children: [
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: const CircleAvatar(
                            radius: 50,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: -1,
                            child: Container(
                              padding: const EdgeInsets.all(.2),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: AppConstant.titleTextColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const KHeight(height: AppConstant.largeSpace),
                  const KText(
                    text: 'Your Name',
                    color: AppConstant.tinyTextColor,
                    weight: FontWeight.bold,
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              const Divider(
                endIndent: 50,
                indent: 50,
                thickness: 1,
                color: AppConstant.secondaryColor,
              ),
              const KHeight(height: AppConstant.largeSpace),
              const ListTile(
                title: KText(text: "My account"),
                leading: Icon(Icons.person),
              ),
              const ListTile(
                title: KText(text: "Change password"),
                leading: Icon(Icons.lock),
              ),
              const ListTile(
                title: KText(text: "My assesment "),
                leading: Icon(Icons.person),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
