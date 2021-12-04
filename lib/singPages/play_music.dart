import 'package:audioplayers/audioplayers.dart';

class PlayMusic {
  String audioName;
  Map<Duration, String> lyrics;
  bool playButton = true;
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache player = new AudioCache(fixedPlayer: audioPlayer);
  late Duration duration;
  late Duration position;
  late String? showLyrics = lyrics[lyrics.keys.first];
  int i = 0;

  PlayMusic({required this.audioName, required this.lyrics});

  void playAudio() {
    player.play(audioName);
  }

  void pauseAudio() {
    audioPlayer.pause();
  }

  void stopAudio() {
    audioPlayer.stop();
  }

  void updateLyrics() {
    if (i != lyrics.length) {
      if (position.inSeconds > lyrics.keys.elementAt(i).inSeconds) {
        showLyrics = lyrics[lyrics.keys.elementAt(i)];
        i++;
      }
    }
  }

  void reset() {
    showLyrics = lyrics[lyrics.keys.first];
    playButton = true;
    position = Duration(seconds: 0);
  }
}
