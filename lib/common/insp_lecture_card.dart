import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';
import 'package:intl/intl.dart';

Widget INSPLectureCard(
    {required LectureCardModel lectureCardModel,
    required BuildContext context,
    required Function(INSPCardModel) onPressedViewDetails}) {

  return Card(
    elevation: 0,
    color: Colors.white,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Container(
      width: context.isWebOrLandScape()
          ? MediaQuery.of(context).size.width / 3
          : MediaQuery.of(context).size.width * 0.6,
      height: 230,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                lectureCardModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2C3329)),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                lectureCardModel.scheduledDate,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(44, 51, 41, 0.47),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Text(
            lectureCardModel.topicName,
            style: const TextStyle(color: Color(0x782C3329), fontSize: 12),
          ),
          Text(
            lectureCardModel.classLevel,
            style: const TextStyle(color: Color(0x782C3329), fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFF2C3329),
                fontWeight: FontWeight.w400),
          ),
          Text(
            lectureCardModel.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 11,
                color: Color.fromRGBO(44, 51, 41, 0.47),
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    onPressedViewDetails(lectureCardModel);
                  },
                  child: const Text(
                    'View Details',
                    style: TextStyle(
                        color: Color(0xFF3C8DBC),
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  )))
        ],
      ),
    ),
  );
}
