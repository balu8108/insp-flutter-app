import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/librarywidget/library_widget_screen.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_screen.dart';

import '../library/library_screen.dart';
import '../mycourses/my_courses_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Container(
        padding: const EdgeInsets.all(32.0),
        //color: const Color.fromRGBO(232, 242, 249, 1),
        color: Colors.white,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                MyCoursesWidget(onViewDetailsClicked:
                    (BuildContext context, INSPCardModel inspCardModel) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyCoursesScreen.getScreen(inspCardModel)));
                }),
                const SizedBox(
                  height: 16,
                ),
                LibraryWidget(onViewDetailsClicked:
                    (BuildContext context, INSPCardModel inspCardModel) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LibraryScreen.getScreen(inspCardModel)));
                }),
              ],
            )),
      ),
    ));
  }
}
