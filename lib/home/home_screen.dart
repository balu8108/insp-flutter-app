import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/home/student_home_screen.dart';
import 'package:inspflutterfrontend/home/teacher_home_screen.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_redux.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: StoreConnector<MyCoursesAppState, MyCoursesAppState>(
            converter: (store) => store.state,
            builder: (context, MyCoursesAppState state) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: StudentHomeScreen())));
  }

  static getScreen(INSPCardModel selectedItem) {
    return getBaseScreen<MyCoursesAppState, HomeScreen>(myCoursesStateReducer,
        MyCoursesAppState(selectedItem: selectedItem), const HomeScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<MyCoursesAppState>(context, action);
  }
}
