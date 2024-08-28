// image_selection.dart
import 'package:flutter/material.dart';

class ImageSelection extends StatefulWidget {
  final List<int> correctAnswers;
  final int imageLength;
  final List<String> images;
  final bool isAnswerSubmitted;
  final List<int> selectedPictureIndices;
  final Function(int) onPictureSelected;

  ImageSelection({
    required this.correctAnswers,
    required this.imageLength,
    required this.images,
    required this.isAnswerSubmitted,
    required this.selectedPictureIndices,
    required this.onPictureSelected,
  });

  @override
  _ImageSelectionState createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3,
        ),
        itemCount: widget.imageLength,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => widget.onPictureSelected(index),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: widget.isAnswerSubmitted
                    ? (widget.correctAnswers.contains(index)
                        ? Colors.green
                        : widget.selectedPictureIndices.contains(index)
                            ? Colors.red
                            : Colors.grey)
                    : widget.selectedPictureIndices.contains(index)
                        ? Colors.blue
                        : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                widget.images[index],
                width: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
