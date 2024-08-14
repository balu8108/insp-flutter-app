import 'package:flutter/material.dart';

class PickedFile extends StatelessWidget {
  final VoidCallback? uploadFile;
  final ValueChanged<String>? removeFile;
  final List<String> pickedFilesName;

  const PickedFile(
      {Key? key,
      this.uploadFile,
      required this.pickedFilesName,
      this.removeFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Files to upload",
                  hintStyle: const TextStyle(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(58, 53, 65, 0.38),
                      width: 1.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: uploadFile,
              child: const Text("Select Files"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(60, 141, 188, 1),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        ListView.builder(
          shrinkWrap: true,
          itemCount: pickedFilesName.length,
          itemBuilder: (context, index) {
            final file = pickedFilesName[index];
            return Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE3E1E1),
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    file,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF718096),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed:
                        removeFile != null ? () => removeFile!(file) : null,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
