import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/home/teacher_home_screen.dart';
import 'package:inspflutterfrontend/pages/common/courses/my_courses_redux.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<MyCoursesAppState, MyCoursesAppState>(
            converter: (store) => store.state,
            builder: (context, MyCoursesAppState state) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: TeacherHomeScreen())));
  }

  static getScreen(INSPCardModel selectedItem) {
    return getBaseScreen<MyCoursesAppState, HomeScreen>(myCoursesStateReducer,
        MyCoursesAppState(selectedItem: selectedItem), const HomeScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<MyCoursesAppState>(context, action);
  }
}
