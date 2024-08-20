import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/teacher/soloclasses/soloclass_topic_detail_screen.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/latest_solo_class_card.dart';
import 'package:inspflutterfrontend/widget/card/model/latest_solo_class_card_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/pages/teacher/dashboard/soloclasses/soloclasses_widget_redux.dart';
import 'package:inspflutterfrontend/widget/loader/data_loader.dart';

import '../../../../utils/capitalize.dart';

class Soloclasses extends StatefulWidget {
  const Soloclasses({super.key});

  @override
  State<StatefulWidget> createState() {
    return SoloClassesWidget();
  }
}

class SoloClassesWidget extends State<Soloclasses> {
  SoloClassesWidgetAppState soloClassesWidgetAppState =
      const SoloClassesWidgetAppState(latestSoloClassesData: []);

  SoloClassesWidget();

  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true; // Loading state variable

  void updateState(SoloClassesWidgetAppState soloClassesWidgetAppState) {
    setState(() {
      this.soloClassesWidgetAppState = soloClassesWidgetAppState;
      _isLoading = false; // Stop loading when data is fetched
    });
  }

  // Call an API to get all latest solo classes
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
    } else {
      setState(() {
        _isLoading = false; // Stop loading even if no data is found
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllLatestSoloClasses();
  }

  void _handleSeeAll() {
    INSPCardModel selectedTopic = INSPCardModel("", "", "", "");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SoloclassTopicDetailScreen.getScreen(selectedTopic)),
    );
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
            Expanded(flex: 5, child: INSPHeading('Solo Classes')),
            TextButton(
              child: Text(
                "See All",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              onPressed: _handleSeeAll,
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                overlayColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        _isLoading
            ? DataLoader()
            : SizedBox(
                height: 200.0,
                child: soloClassesWidgetAppState
                        .latestSoloClassesData.isNotEmpty
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
