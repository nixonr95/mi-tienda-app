import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

Soundpool pool = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
int? beep;

Future<int> loadTrack() async {
  beep ??= await rootBundle
      .load('assets/scanner-beep.wav')
      .then((ByteData soundData) {
    return pool.load(soundData);
  });

  return beep!;
}

Future<void> playBeep() async {
  await pool.play(await loadTrack());
}
