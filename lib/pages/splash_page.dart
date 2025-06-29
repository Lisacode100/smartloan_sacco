import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();

  bool _speechEnabled = false;
  bool _isListening = false;
  bool _showVisualOptions = false;
  bool _prefsLoaded = false;
  String _lastWords = '';
  late SharedPreferences _prefs;


  @override
  void initState() {
    super.initState();
    _initializeSplash();
  }

  Future<void> _initializeSplash() async {
    _prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = _prefs.getBool('first_launch') ?? true;
    final isVisuallyImpaired = _prefs.getBool('is_visually_impaired') ?? false;




