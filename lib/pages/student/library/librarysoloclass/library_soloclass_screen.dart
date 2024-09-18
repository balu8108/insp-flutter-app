import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/student/library/librarysoloclass/library_soloclass_redux.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/student/library/widget/library_lecture.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';
import '../../../../base/base.dart';

class LibrarySoloclassScreen extends StatelessWidget {
  const LibrarySoloclassScreen({super.key});
  @override
  Widget build(BuildContext context) {
    dispatch(context, initialFetchLibrarySoloClass(context));
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: StoreConnector<LibrarySoloClassReduxAppState,
                LibrarySoloClassReduxAppState>(
            converter: (store) => store.state,
            builder: (context, LibrarySoloClassReduxAppState state) => Padding(
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
                                      state.allLecturesOfSoloClass,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 17),
                          Expanded(
                            flex: 3,
                            child: const UpcomingClassesScreen(),
                          ),
                        ])))));
  }

  static getScreen(INSPCardModel selectedtopic) {
    return getBaseScreen<LibrarySoloClassReduxAppState, LibrarySoloclassScreen>(
        librarySoloClassTopicStateReducer,
        LibrarySoloClassReduxAppState(selectedtopic: selectedtopic),
        const LibrarySoloclassScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<LibrarySoloClassReduxAppState>(context, action);
  }
}
