import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/teacher/suggestion/suggestion_page.dart';
import 'package:insp/pages/teacher/suggestion/suggestion_redux.dart';
import 'package:insp/base/base.dart';

class MainSuggestionPage extends StatelessWidget {
  const MainSuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, getAllFeedback(context, 1));

    void getpreviousornextFeedback(BuildContext context, int page) {
      dispatch(context, getAllFeedback(context, page));
    }

    void deleteFeedback(BuildContext context, int feedbackId) {
      dispatch(context, deleteAssignment(context, feedbackId));
    }

    return Container(
        padding: const EdgeInsets.all(32.0),
        color: Colors.white,
        child: StoreConnector<SuggestionAppState, SuggestionAppState>(
            converter: (store) => store.state,
            builder: (context, SuggestionAppState state) =>
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTableExampleApp(
                      data: state.data,
                      totalpage: state.totalPages,
                      page: state.page,
                      getpreviousornextFeedback: getpreviousornextFeedback,
                      deleteFeedback: deleteFeedback),
                )));
  }

  static getScreen() {
    return getBaseScreen<SuggestionAppState, MainSuggestionPage>(
        suggestionStateReducer,
        const SuggestionAppState(),
        const MainSuggestionPage());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<SuggestionAppState>(context, action);
  }
}
