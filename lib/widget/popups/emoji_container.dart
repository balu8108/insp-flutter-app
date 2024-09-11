import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

class EmojiContainer extends StatelessWidget {
  const EmojiContainer({super.key, required this.addEmoji});

  final Function(String emoji) addEmoji;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final scrollController = ScrollController();
    return AlertDialog(
      content: SizedBox(
        height: 300,
        width: 400, // Adjust the height to your preference
        child: EmojiPicker(
          textEditingController: controller,
          scrollController: scrollController,
          onEmojiSelected: (Category? category, Emoji emoji) {
            addEmoji(emoji.emoji);
            Navigator.of(context).pop();
          },
          config: Config(
            height: 256,
            checkPlatformCompatibility: true,
            emojiViewConfig: EmojiViewConfig(
              emojiSizeMax: 28 *
                  (foundation.defaultTargetPlatform == TargetPlatform.iOS
                      ? 1.2
                      : 1.0),
            ),
            swapCategoryAndBottomBar: false,
            skinToneConfig: const SkinToneConfig(),
            categoryViewConfig: const CategoryViewConfig(),
            bottomActionBarConfig: const BottomActionBarConfig(),
            searchViewConfig: const SearchViewConfig(),
          ),
        ),
      ),
    );
  }
}
