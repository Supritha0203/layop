import 'dart:convert';
import 'dart:developer';
import 'dart:io' as Io;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layop2/pages/scribble/scribble_pad.dart';

class OcrPage extends StatefulWidget {
  const OcrPage({super.key});

  @override
  State<OcrPage> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
//

  @override
  void dispose() {
    flutterTts.stop();

    super.dispose();
  }

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  late FlutterTts flutterTts;
  double volume = 1;
  double pitch = 1.0;
  double rate = 0.5;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    // if (true) {
    _getDefaultEngine();
    _getDefaultVoice();
    // }

    flutterTts.setStartHandler(() {
      setState(() {
        log("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (true) {
      flutterTts.setInitHandler(() {
        setState(() {
          log("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() {
      setState(() {
        log("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        log("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        log("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        log("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        log("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;

  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      log(engine.toString());
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      log(voice.toString());
    }
  }

  String? _newVoiceText;

  Future speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    log("Hey speak");
    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

//

  String parsedtext = '';
  bool loading = false;
  parsethetext() async {
    setState(() {
      loading = true;
    });
    final imagefile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 670, maxHeight: 970);
    var bytes = Io.File(imagefile!.path.toString()).readAsBytesSync();
    // var bytes = File(imagefile.readAsBytes())
    String img64 = base64Encode(bytes);
    // var img64 = base64.encode(imagefile.);
    var url = 'https://api.ocr.space/parse/image';
    var payload = {"base64Image": "data:image/jpg;base64,${img64.toString()}"};
    var header = {"apikey": "K86213968588957"};
    var post = await http.post(Uri.parse(url), body: payload, headers: header);

    var result = jsonDecode(post.body);
    setState(() {
      parsedtext = result['ParsedResults'][0]['ParsedText'];
      loading = false;
      _newVoiceText = parsedtext;
    });
    await speak();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('OCR - Text to Audio'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    onPressed: () => parsethetext(),
                    child: Text(
                      'Upload a image',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "ParsedText is:",
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        parsedtext,
                      )
                    ],
                  ),
                ),
                if (loading) const CircularProgressIndicator(),
              ],
            ),
          )),
    );
  }
}
