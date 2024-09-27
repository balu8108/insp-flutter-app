import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/student/library/librarysoloclass/library_soloclass_redux.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/student/library/widget/library_lecture.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';
import '../../../../base/base.dart';

class LibrarySoloclassScreen extends StatelessWidget {
  const LibrarySoloclassScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchLibrarySoloClass(context));
    return Container(
        padding: isWebOrLandScape
            ? const EdgeInsets.all(10.0)
            : const EdgeInsets.all(0.0),
        color: Colors.white,
        child: StoreConnector<LibrarySoloClassReduxAppState,
                LibrarySoloClassReduxAppState>(
            converter: (store) => store.state,
            builder: (context, LibrarySoloClassReduxAppState state) =>
                SingleChildScrollView(
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
                          if (isWebOrLandScape) const SizedBox(width: 17),
                          if (isWebOrLandScape)
                            const Expanded(
                              flex: 3,
                              child: UpcomingClassesScreen(),
                            ),
                        ]))));
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
