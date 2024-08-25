import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kids_app/src/core/utils/assets_manager.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioPath;
  final Function onAudioComplete;

  const AudioPlayerWidget({
    Key? key,
    required this.audioPath,
    required this.onAudioComplete,
  }) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer audioPlayer;
  bool isAudioPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.setSourceAsset(widget.audioPath);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio() async {
    setState(() {
      isAudioPlaying = true;
    });

    try {
      await audioPlayer.play(AssetSource(widget.audioPath));

      audioPlayer.onPlayerComplete.listen((_) {
        if (mounted) {
          setState(() {
            isAudioPlaying = false;
          });
          widget.onAudioComplete();
        }
      });
    } catch (e) {
      setState(() {
        isAudioPlaying = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error playing audio: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isAudioPlaying) ...[
          Image.asset(
            ImgAssets.play, // Update with your play image asset
            width: 100,
          ),
          const SizedBox(height: 20),
          const Text("Click play audio to begin"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: playAudio,
            child: const Text("Play Audio"),
          ),
        ] else ...[
          Image.asset(
            ImgAssets.listen, // Update with your listen image asset
            width: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            "Audio is playing, listen carefully...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ],
    );
  }
}
