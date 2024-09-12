import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/main.dart';
import 'package:inspflutterfrontend/pages/common/alltopicswidget/all_topics_widget.dart';
import 'package:inspflutterfrontend/pages/student/library/librarylecturepage/library_lecture_screen.dart';
import 'package:inspflutterfrontend/pages/student/library/librarysoloclass/library_soloclass_screen.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/library_subjects.dart';
import 'package:inspflutterfrontend/pages/student/library/mainpage/library_redux.dart';
import 'package:inspflutterfrontend/pages/student/library/widget/library_subject.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';
import '../../../../base/base.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, UpdateLibrarySubjects(inspCardModels: librarySubjects));

    void onPressedLibrarySubject(
        BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, initialSelectedTopics(context, inspCardModel));
    }

    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScaffold(
                content: LibraryLectureScreen.getScreen(inspCardModel))),
      );
    }

    void onPressedSoloClass(BuildContext context, INSPCardModel inspCardModel) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScaffold(
                content: LibrarySoloclassScreen.getScreen(inspCardModel))),
      );
    }

    return Container(
      padding: isWebOrLandScape
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.all(0.0),
      color: Colors.white,
      child: StoreConnector<LibraryAppState, LibraryAppState>(
        converter: (store) => store.state,
        builder: (context, LibraryAppState state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LibrarySubject(
                        onViewDetailsClicked: onPressedLibrarySubject,
                      ),
                      const SizedBox(height: 24),
                      if (state.selectedItem.name == "Topic Based Recording")
                        AllTopicWidget.getScreen(
                            heading: 'Library (${state.selectedItem.name})',
                            onPressedViewDetails: onPressedSoloClass)
                      else
                        AllTopicWidget.getScreen(
                            heading: 'Library (${state.selectedItem.name})',
                            onPressedViewDetails: onPressedMyCourse)
                    ],
                  ),
                ),
                if (isWebOrLandScape) const SizedBox(width: 17),
                if (isWebOrLandScape)
                  const Expanded(
                    flex: 3,
                    child: UpcomingClassesScreen(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  static getScreen(INSPCardModel selectedItem) {
    return getBaseScreen<LibraryAppState, LibraryScreen>(
      libraryStateReducer,
      LibraryAppState(selectedItem: selectedItem),
      const LibraryScreen(),
    );
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<LibraryAppState>(context, action);
  }
}
