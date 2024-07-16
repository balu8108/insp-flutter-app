import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/latest_solo_class_card.dart';
import 'package:inspflutterfrontend/common/model/latest_solo_class_card_model.dart';
import 'package:inspflutterfrontend/data/remote/remote_data_source.dart';
import 'package:inspflutterfrontend/soloclasses/soloclasses_widget_redux.dart';

class SoloclassesScreen extends StatefulWidget {
  const SoloclassesScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return SoloClassesWidget();
  }
}

class SoloClassesWidget extends State {
  SoloClassesWidgetAppState soloClassesWidgetAppState =
      const SoloClassesWidgetAppState(latestSoloClassesData: []);

  SoloClassesWidget();

  ScrollController _scrollController = ScrollController();

  void updateState(SoloClassesWidgetAppState soloClassesWidgetAppState) {
    setState(() {
      this.soloClassesWidgetAppState = soloClassesWidgetAppState;
    });
  }

  // call an API of get all subjects
  void getAllLatestSoloClasses() async {
    final remoteDataSource = RemoteDataSource();
    const token = 'Token 5974570aeed03bea4665fc2fd91829f2';
    final latestSoloClass = await remoteDataSource.getLatestSoloClasses(token);
    if (latestSoloClass.data.data.isNotEmpty) {
      var allSubjectsResults = latestSoloClass.data.data;

      final latestSoloCardModels = allSubjectsResults
          .map((latestSoloClassResult) => LatestSoloClassCardModel(
              latestSoloClassResult.id.toString(),
              latestSoloClassResult.topic,
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
            const Text("See All",
                style:
                    TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis)),
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
