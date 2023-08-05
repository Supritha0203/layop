import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:layop2/pages/exams.dart';
import 'package:layop2/pages/history/history_page.dart';
import 'package:layop2/pages/message.dart';
import 'package:layop2/pages/my_teacher.dart';
import 'package:layop2/pages/ocr/ocr_page.dart';
import 'package:layop2/pages/profile.dart';
import 'package:layop2/pages/progress_page.dart';
import 'package:layop2/pages/scribble/scribble_pad.dart';
import 'package:layop2/service/auth_service.dart';
import 'package:layop2/util/app_constant.dart';
import 'package:layop2/widget/k_height.dart';
import 'package:layop2/widget/k_text.dart';

import 'puzzle/puzzle_page.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  _StudentHomeState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "3604cbfc4d26a19c4036ffbe5b77e1d72e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _openProfilPage(command.data));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _openProfilPage(Map<String, dynamic> command) {
    switch (command['command']) {
      case 'profile':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profil(),
            ));
        break;
      case 'exam':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Exams(),
            ));
        break;
      case 'home':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentHome(),
            ));
        break;
      // case 'syllabus':
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => SyllabusPage(),
      //       ));
      //   break;
      case 'teacher':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyTeacher(),
            ));
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const KText(text: "layop2", weight: FontWeight.w700),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageOfStudent(),
                  )),
              icon: const Icon(
                Icons.notifications,
                color: AppConstant.whiteTextColor,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profil(),
                  )),
              child: const CircleAvatar(
                backgroundColor: AppConstant.whiteTextColor,
                child: Icon(Icons.person),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const KHeight(height: AppConstant.largeSpace),
                  const KText(
                      text: "Habib folly Messan",
                      size: AppConstant.leadingText,
                      weight: FontWeight.w500),
                  const KHeight(height: AppConstant.largeSpace),
                  const KText(
                    text: "Welcome and learn at your own pace",
                    size: AppConstant.leadingText,
                  ),
                  const KHeight(height: AppConstant.largeSpace),
                  const Divider(
                    thickness: 1,
                    endIndent: 100,
                  ),
                  const KText(
                      color: AppConstant.bodyTextColor,
                      text: "what do you want to do today ?",
                      size: AppConstant.normalText,
                      weight: FontWeight.w500),
                  const KHeight(height: AppConstant.largeSpace),
                  // MenuStudent(
                  //     imagePath: 'assets/images/lesson.png',
                  //     titre: "Syllabus",
                  //     function: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const SyllabusPage(),
                  //           ));
                  //     },
                  //     description: "learn your lessons"),
                  // KHeight(height: AppConstant.largeSpace),
                  MenuStudent(
                      function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Exams(),
                          )),
                      imagePath: 'assets/images/exams.png',
                      titre: "Exams",
                      description: "to test your performance"),
                  const KHeight(height: AppConstant.largeSpace),
                  MenuStudent(
                      function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProgressPage(),
                          )),
                      imagePath: 'assets/images/progress.png',
                      titre: "Progress",
                      description: "to see your improuvement"),
                  const KHeight(height: AppConstant.largeSpace),
                  MenuStudent(
                      function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DigitalInkView(),
                          )),
                      imagePath: 'assets/images/exams.png',
                      titre: "Scribble pad",
                      description: "have fun"),
                  const KHeight(height: AppConstant.largeSpace),
                  MenuStudent(
                      function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OcrPage(),
                          )),
                      imagePath: 'assets/images/exams.png',
                      titre: "Image to Text",
                      description: "play with images"),
                ],
              ),
            ],
          ),
        ),
      )),
      drawer: Drawer(
        semanticLabel: "ohooo",
        child: ListView(children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: AppConstant.primaryColor,
              ),
              child: Column(
                children: const <Widget>[
                  CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 45),
                  ),
                  KHeight(height: AppConstant.largeSpace),
                  KText(
                    size: AppConstant.titleText,
                    text: "Folly Habib MESSAN",
                    color: AppConstant.whiteTextColor,
                  )
                ],
              )),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profil(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.man),
            title: const Text('My Teacher'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyTeacher()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Puzzle'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PuzzlePage()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.power_settings_new_outlined),
            title: const Text('Logout'),
            onTap: () async {
              await AuthService.signOut();
              // Update the state of the app.
              // ...
            },
          ),
        ]),
      ),
    );
  }
}

class MenuStudent extends StatelessWidget {
  final String titre;
  final String imagePath;
  final String description;
  final VoidCallback? function;
  const MenuStudent({
    required this.titre,
    required this.imagePath,
    required this.description,
    this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: function,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        height: 120,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    KText(
                      weight: FontWeight.w600,
                      size: AppConstant.leadingText,
                      text: titre,
                      color: AppConstant.titleTextColor,
                    ),
                  ]),
                  Row(
                    children: [
                      FittedBox(
                        child: KText(
                            size: AppConstant.titleText,
                            text: description,
                            color: AppConstant.bodyTextColor),
                      ),
                    ],
                  )
                ],
              ),
              GestureDetector(
                  onTap: () => function, child: Image.asset(imagePath))
            ],
          ),
        ),
      ),
    );
  }
}
