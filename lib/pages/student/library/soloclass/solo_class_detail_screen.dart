import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/student/library/soloclass/solo_all_lecture.dart';
import 'package:insp/pages/student/library/soloclass/solo_detail_redux.dart';
import 'package:insp/pages/student/library/soloclass/solo_detail_widget.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/lecture_card_model.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../../base/base.dart';

class SoloClassDetailsScreen extends StatelessWidget {
  const SoloClassDetailsScreen({super.key, required this.isLibrary});

  final bool isLibrary;

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();

    dispatch(context, initialFetchSoloDetail(context));

    void onUpdate() {
      dispatch(context, initialFetchSoloDetail(context));
    }

    return Container(
      padding: isWebOrLandScape
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.all(0.0),
      color: Colors.white,
      child: StoreConnector<SoloDetailAppState, SoloDetailAppState>(
        converter: (store) => store.state,
        builder: (context, SoloDetailAppState state) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    SoloAlllectureWidget(
                        lectureDetailsForLibrary: state.allSoloLecture,
                        topicName: state.selectedItem.topicName,
                        isLibrary: isLibrary),
                    const SizedBox(height: 16),
                    SoloDetailWidget(
                        lectureData: state.sololectureData, onUpdate: onUpdate)
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
        ),
      ),
    );
  }

  static getScreen(LectureCardModel selectedItem, bool isLibrary,
      List<LectureCardModel> allSoloLecture) {
    return getBaseScreen<SoloDetailAppState, SoloClassDetailsScreen>(
        soloDetailReducer,
        SoloDetailAppState(
            selectedItem: selectedItem, allSoloLecture: allSoloLecture),
        SoloClassDetailsScreen(isLibrary: isLibrary));
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<SoloDetailAppState>(context, action);
  }
}
