import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/alltopicswidget/all_topics_widget.dart';
import 'package:inspflutterfrontend/pages/student/library/librarylecturepage/library_lecture_screen.dart';
import 'package:inspflutterfrontend/pages/student/library/librarysoloclass/library_soloclass_screen.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/library_subjects.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/student/library/mainpage/library_redux.dart';
import 'package:inspflutterfrontend/pages/student/library/widget/library_subject.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';
import '../../../../base/base.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, UpdateLibrarySubjects(inspCardModels: librarySubjects));

    void onPressedLibrarySubject(
        BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, initialSelectedTopics(context, inspCardModel));
    }

    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LibraryLectureScreen.getScreen(inspCardModel)),
      );
    }

    void onPressedSoloClass(BuildContext context, INSPCardModel inspCardModel) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LibrarySoloclassScreen.getScreen(inspCardModel)),
      );
    }

    return Scaffold(
      appBar: Navbar(),
      body: StoreConnector<LibraryAppState, LibraryAppState>(
        converter: (store) => store.state,
        builder: (context, LibraryAppState state) {
          return Container(
            padding: const EdgeInsets.all(32.0),
            color: Colors.white,
            child: SingleChildScrollView(
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
                  const SizedBox(width: 17),
                  Expanded(
                    flex: 3,
                    child: UpcomingClassesScreen.getScreen(),
                  ),
                ],
              ),
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
