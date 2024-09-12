import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/main.dart';
import 'package:inspflutterfrontend/pages/teacher/dashboard/soloclasses/soloclasses_widget_redux.dart';
import 'package:inspflutterfrontend/pages/teacher/soloclasses/soloclass_topic_detail_screen.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/latest_solo_class_card.dart';

class Soloclasses extends StatelessWidget {
  const Soloclasses({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, getSoloClass(context));
    final ScrollController scrollController = ScrollController();
    void handleSeeAll() {
      INSPCardModel selectedTopic = const INSPCardModel("", "", "", "");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScaffold(
                content: SoloclassTopicDetailScreen.getScreen(selectedTopic))),
      );
    }

    return StoreConnector<SoloClassesWidgetAppState, SoloClassesWidgetAppState>(
        converter: (store) => store.state,
        builder: (context, SoloClassesWidgetAppState state) => Container(
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
                      onPressed: handleSeeAll,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        overlayColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: const Text(
                        "See All",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                    height: 200.0,
                    child: state.latestSoloClassesData.isNotEmpty
                        ? Scrollbar(
                            controller: scrollController,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              controller: scrollController,
                              itemCount: state.latestSoloClassesData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return LatestSoloClassCard(
                                    soloCardModel:
                                        state.latestSoloClassesData[index],
                                    context: context);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 16,
                                );
                              },
                            ),
                          )
                        : const Center(child: Text('No item')))
              ]),
            ));
  }

  static getScreen() {
    return getBaseScreen<SoloClassesWidgetAppState, Soloclasses>(
        soloClassWidgetReducer,
        const SoloClassesWidgetAppState(),
        const Soloclasses());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<SoloClassesWidgetAppState>(context, action);
  }
}
