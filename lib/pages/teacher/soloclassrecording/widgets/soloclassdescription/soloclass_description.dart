import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/teacher/soloclassrecording/redux/soloclass_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/capitalize.dart';
import 'package:insp/utils/file_box_component.dart';
import 'package:insp/utils/toaster.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:toastification/toastification.dart';

class SoloclassDescription extends StatelessWidget {
  final String soloClassId;

  const SoloclassDescription({super.key, required this.soloClassId});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    final store = StoreProvider.of<AppState>(context);
    store.dispatch(getPreviewSoloClassData(context, soloClassId));

    void refreshDetail() {
      store.dispatch(getPreviewSoloClassData(context, soloClassId));
    }

    return Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: StoreConnector<AppState, SoloClassDetailDataAppState>(
            converter: (store) => store.state.soloClassDetailDataAppState,
            builder: (context, state) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(232, 242, 249, 1),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(92, 92, 92, 0.12),
                    offset: Offset(2, 2),
                    blurRadius: 13,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: INSPHeading("Solo Recording")),
                      ],
                    ),
                    const SizedBox(height: 25),
                    _buildTopicText(state),
                    const SizedBox(height: 25),
                    _buildDescriptionText(state),
                    const SizedBox(height: 25),
                    _buildAgendaText(state),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        const Expanded(
                            flex: 8,
                            child: Text(
                              "TPStream Credentials",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(44, 51, 41, 1),
                                decoration: TextDecoration.none,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )),
                        if (state.soloData.soloClassRoomRecordings.isNotEmpty)
                          state.soloData.soloClassRoomRecordings[0].rtmpUrl
                                  .isEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.replay_outlined),
                                  iconSize: 16.0,
                                  onPressed: () => {refreshDetail()})
                              : const Text("")
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (state.soloData.soloClassRoomRecordings.isNotEmpty)
                      state.soloData.soloClassRoomRecordings[0].rtmpUrl.isEmpty
                          ? const Text(
                              "As it takes 1-2 mins to get credentials, you can refresh it",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(44, 51, 41, 0.47),
                                decoration: TextDecoration.none,
                              ),
                            )
                          : _credential(context, state),
                    const SizedBox(height: 25),
                    _buildFileComponent(state),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _credential(BuildContext context, SoloClassDetailDataAppState state) {
    void copyTextToClipboard(String textToCopy) {
      Clipboard.setData(ClipboardData(text: textToCopy));
      showToast(
          context, 'Text copied to clipboard!', ToastificationType.success);
    }

    return Column(
      children: [
        _buildLinkRow(state, copyTextToClipboard),
        const SizedBox(height: 5),
        _buildKeyRow(state, copyTextToClipboard),
      ],
    );
  }

  Widget _buildTopicText(SoloClassDetailDataAppState state) {
    return Text(
      capitalizeFirstLetter(state.soloData.soloClassroomDetails.topic),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(44, 51, 41, 1),
        decoration: TextDecoration.none,
      ),
    );
  }

  Widget _buildDescriptionText(SoloClassDetailDataAppState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(44, 51, 41, 1),
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          state.soloData.soloClassroomDetails.description,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(44, 51, 41, 0.47),
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }

  Widget _buildAgendaText(SoloClassDetailDataAppState state) {
    final agendaItems =
        state.soloData.soloClassroomDetails.agenda.split("\r\n");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Agenda",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(44, 51, 41, 1),
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 16),
        agendaItems.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: agendaItems.take(4).map<Widget>(
                  (agenda) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              agenda,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(44, 51, 41, 0.47),
                                height: 1.75,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              )
            : const Text(
                'No Data',
                style: TextStyle(
                  color: Color.fromRGBO(44, 51, 41, 0.47),
                  fontSize: 12,
                ),
              ),
      ],
    );
  }

  Widget _buildLinkRow(
      SoloClassDetailDataAppState state, Function(String) copyTextToClipboard) {
    final rtmpUrl = state.soloData.soloClassRoomRecordings.isNotEmpty
        ? state.soloData.soloClassRoomRecordings[0].rtmpUrl
        : '';

    return Row(
      children: [
        const Icon(Icons.link, size: 20),
        const SizedBox(width: 5),
        Flexible(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => copyTextToClipboard(rtmpUrl),
              child: Tooltip(
                message: rtmpUrl,
                child: Text(
                  rtmpUrl,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(44, 51, 41, 0.47),
                    height: 1.25,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKeyRow(
      SoloClassDetailDataAppState state, Function(String) copyTextToClipboard) {
    final streamKey = state.soloData.soloClassRoomRecordings.isNotEmpty
        ? state.soloData.soloClassRoomRecordings[0].streamKey
        : '';

    return Row(
      children: [
        const Icon(Icons.key, size: 20),
        const SizedBox(width: 5),
        Flexible(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => copyTextToClipboard(streamKey),
              child: Tooltip(
                message: streamKey,
                child: Text(
                  streamKey,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(44, 51, 41, 0.47),
                    height: 1.25,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileComponent(SoloClassDetailDataAppState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "File",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(44, 51, 41, 1),
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 40),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: state.soloData.soloClassRoomFile.isNotEmpty
              ? FileBoxComponent(
                  data: state.soloData.soloClassRoomFile,
                  type: "solo",
                  scrollDirection: "vertical",
                  isTeacher: true,
                )
              : const Text(
                  'No Files',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(44, 51, 41, 0.47)),
                ),
        ),
      ],
    );
  }
}
