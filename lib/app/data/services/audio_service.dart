import 'package:assets_audio_player/assets_audio_player.dart';

class AudioService {
  static final _player = AssetsAudioPlayer();

  static void playAudio() async {
    await _player.open(
      Audio('assets/audio/alarm.mp3'),
    );
    _player.play();
  }

  static void stopAudio() async {
    if (_player.isPlaying.value) _player.stop();
  }
}
