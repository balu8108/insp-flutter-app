import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/utils/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/latest_solo_class_card.dart';
import 'package:inspflutterfrontend/widget/card/model/latest_solo_class_card_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/pages/teacher/dashboard/soloclasses/soloclasses_widget_redux.dart';

import '../../../../utils/capitalize.dart';

class Soloclasses extends StatefulWidget {
  const Soloclasses({super.key});
  @override
  State<StatefulWidget> createState() {
    return SoloClassesWidget();
  }
}

class SoloClassesWidget extends State {
  SoloClassesWidgetAppState soloClassesWidgetAppState =
      const SoloClassesWidgetAppState(latestSoloClassesData: []);

  SoloClassesWidget();

  final ScrollController _scrollController = ScrollController();

  void updateState(SoloClassesWidgetAppState soloClassesWidgetAppState) {
    setState(() {
      this.soloClassesWidgetAppState = soloClassesWidgetAppState;
    });
  }

  // call an API of get all subjects
  void getAllLatestSoloClasses() async {
    final remoteDataSource = RemoteDataSource();
    String userToken = await getUserToken();
    final latestSoloClass =
        await remoteDataSource.getLatestSoloClasses(userToken);
    if (latestSoloClass.data.data.isNotEmpty) {
      var allSubjectsResults = latestSoloClass.data.data;

      final latestSoloCardModels = allSubjectsResults
          .map((latestSoloClassResult) => LatestSoloClassCardModel(
              latestSoloClassResult.id.toString(),
              latestSoloClassResult.topic == ""
                  ? "General"
                  : capitalizeFirstLetter(latestSoloClassResult.topic),
              latestSoloClassResult.mentorName,
              latestSoloClassResult.description))
          .toList();

      updateState(soloClassesWidgetAppState.copyWith(
          latestSoloClassesData: latestSoloCardModels));
    }
  }

  @override
  void initState() {
    super.initState();
    getAllLatestSoloClasses();
  }

  void _handleSeeAll() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            INSPHeading('Solo Classes'),
            TextButton(onPressed: _handleSeeAll, child: Text("See All"))
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        SizedBox(
            height: 200.0,
            child: soloClassesWidgetAppState.latestSoloClassesData.isNotEmpty
                ? Scrollbar(
                    controller: _scrollController,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: soloClassesWidgetAppState
                          .latestSoloClassesData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LatestSoloClassCard(
                            soloCardModel: soloClassesWidgetAppState
                                .latestSoloClassesData[index],
                            context: context);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                    ),
                  )
                : const Center(child: Text('No item')))
      ]),
    );
  }
}
