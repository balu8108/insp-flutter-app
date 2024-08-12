import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/student/library/librarylecturepage/library_lecture_redux.dart';
import 'package:inspflutterfrontend/pages/student/library/widget/library_lecture.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';
import '../../../../base/base.dart';

class LibraryLectureScreen extends StatelessWidget {
  const LibraryLectureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    dispatch(context, initialFetchLibraryLecture(context));
    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<LibraryLectureReduxAppState,
                LibraryLectureReduxAppState>(
            converter: (store) => store.state,
            builder: (context, LibraryLectureReduxAppState state) => Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 9,
                                child: Column(
                                  children: [
                                    LibraryLectureWidget(
                                      heading:
                                          "Topic (${state.selectedtopic.name})",
                                      allLectureOfTopic:
                                          state.allLecturesOfTopic,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 17),
                              Expanded(
                                flex: 3,
                                child: UpcomingClassesScreen.getScreen(),
                              ),
                            ]))))));
  }

  static getScreen(INSPCardModel selectedtopic) {
    return getBaseScreen<LibraryLectureReduxAppState, LibraryLectureScreen>(
        LibraryLectureTopicStateReducer,
        LibraryLectureReduxAppState(selectedtopic: selectedtopic),
        const LibraryLectureScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<LibraryLectureReduxAppState>(context, action);
  }
}
