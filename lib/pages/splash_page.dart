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

     if (!isFirstLaunch) {
      _navigateToHome(isVisuallyImpaired);
    } else {
      await _flutterTts.setLanguage('en');
      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.setPitch(1.0);

      await _initSpeech();

       // Speak immediately
      await _flutterTts.speak(
        'Welcome to SACCO Shield. If you are visually impaired, say yes or tap the screen. '
        'If you are not visually impaired, wait and tap the continue button below.',
      );

       // Begin listening immediately
      await Future.delayed(const Duration(seconds: 1));
      _startListening();

      // Show button for sighted users after 10 seconds
      Future.delayed(const Duration(seconds: 10), () {
        if (!_showVisualOptions) {
          setState(() {
            _showVisualOptions = true;
          });
        }
      });

       setState(() {
        _prefsLoaded = true;
      });
    }
  }

  Future<void> _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  Future<void> _startListening() async {
    if (!_speechEnabled || _isListening) return;
    setState(() => _isListening = true);

    await _speechToText.listen(
      onResult: (result) {
        _lastWords = result.recognizedWords.toLowerCase();
        _processVoiceCommand();
      },
      listenFor: const Duration(seconds: 8),
    );
  }

  void _processVoiceCommand() {
    if (_lastWords.contains('yes')) {
      _handleVisuallyImpaired(true);
    }
  }

  void _navigateToHome(bool isVisuallyImpaired) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => isVisuallyImpaired
            ? const VoiceAssistedHomeScreen()
            : const HomePage(),
      ),
    );
  }

   Future<void> _handleVisuallyImpaired(bool isImpaired) async {
    await _prefs.setBool('first_launch', false);
    await _prefs.setBool('is_visually_impaired', isImpaired);

    if (isImpaired) {
      await _flutterTts.speak(
        'Voice assistance enabled. You can now use this app by tapping once to hear options, '
        'and swiping left or right to navigate.',
      );
    }

    _navigateToHome(isImpaired);
  }

   @override
  Widget build(BuildContext context) {
    if (!_prefsLoaded) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

     return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _handleVisuallyImpaired(true),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),













