import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/library_subjects.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/library/library_details.dart';
import 'package:inspflutterfrontend/library/library_redux.dart';
import 'package:inspflutterfrontend/librarywidget/library_widget_screen.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';
import '../base/base.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, UpdateLibrarySubjects(inspCardModels: librarySubjects));

    void onPressedLibrarySubject(
        BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showTopicsForSubject(context, inspCardModel));
    }

    void onSearchQueryEntered(String text) {
      dispatch(context, filterWithQueryText(context, text));
    }

    dispatch(context, initialFetchTopics(context));

    return Scaffold(
      appBar: MyAppBar(),
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
                        LibraryWidget(
                          onViewDetailsClicked: onPressedLibrarySubject,
                        ),
                        const SizedBox(height: 24),
                        LibraryDetails(
                          selectedItem: state.selectedItem,
                          allTopicsForSelectedSubject:
                              state.allTopicsForSelectedSubject,
                        ),
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
