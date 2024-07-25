import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/assignmenttopic/assignment_topic_screen_redux.dart';
import 'package:inspflutterfrontend/assignmenttopic/assignment_topic_widget.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/libraryLecture/library_lecture_redux.dart';
import 'package:inspflutterfrontend/libraryLecture/library_lecture_widget.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';
import '../base/base.dart';

class LibraryLectureScreen extends StatelessWidget {
  const LibraryLectureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    dispatch(context, initialFetchLibraryLecture(context));
    return Scaffold(
        appBar: MyAppBar(),
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
                                          "Library (${state.selectedtopic.name})",
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
