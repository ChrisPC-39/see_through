import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:see_through/screens/webview.dart';
import 'package:window_manager/window_manager.dart' as wm;

import 'screens/image.dart';
import 'screens/phi.dart';
import 'screens/rule_of_thirds.dart';
import 'screens/symmetry.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await wm.windowManager.ensureInitialized();

  if (Platform.isWindows) {
    await Window.hideWindowControls();
  }

  DartVLC.initialize();

  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));

  doWhenWindowReady(() {
    appWindow
      // ..minSize = const Size(640, 360)
      ..size = const Size(720, 540)
      ..alignment = Alignment.center
      ..show();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with wm.WindowListener {
  WindowEffect effect = WindowEffect.transparent;

  bool isRuleOfThirds = false;
  bool isSymmetry = false;
  bool isPhi = false;
  bool isFile = false;
  bool isWebView = false;

  bool isOnTop = false;

  Color color = Colors.grey;
  Color pickerColor = Colors.grey;

  File? imageFile;

  @override
  void initState() {
    wm.windowManager.addListener(this);
    super.initState();

    setWindowEffect(effect);
  }

  @override
  void dispose() {
    wm.windowManager.removeListener(this);
    super.dispose();
  }

  void setWindowEffect(WindowEffect? value) {
    Window.setEffect(
      effect: value!,
      color: Colors.transparent.withOpacity(0.2),
    );

    setState(() => effect = value);
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  bool isVideo(File? file) =>
      file.toString().contains(".mp4") || file.toString().contains(".webm");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapUp: (TapUpDetails tapUpDetails) {
        _showPopupMenu(context, tapUpDetails);
      },
      onSecondaryLongPress: () {
        _showColorPicker();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: MoveWindow(
          child: Stack(
            children: [
              // This container is required.
              // If the screen is empty it can't be dragged if no widget
              // is rendered.
              Container(),

              Visibility(
                visible: isWebView,
                child: const BrowserWebView(),
              ),

              Visibility(
                visible: isFile,
                child: CustomFileImage(
                  file: imageFile,
                  isVideo: isVideo(imageFile),
                ),
              ),

              Visibility(
                visible: isRuleOfThirds,
                child: RuleOfThirds(color: color),
              ),

              Visibility(
                visible: isSymmetry,
                child: Symmetry(color: color),
              ),

              Visibility(
                visible: isPhi,
                child: Phi(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context, TapUpDetails tapUpDetails) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        tapUpDetails.globalPosition & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[800],
      elevation: 8.0,
      items: [
        PopupMenuItem(
          child: Text(
            "${!isRuleOfThirds ? "Enable" : "Disable"} Rule of Thirds",
            style:
                TextStyle(color: isRuleOfThirds ? Colors.green : Colors.white),
          ),
          value: "ruleOfThirds",
          onTap: () => setState(() => isRuleOfThirds = !isRuleOfThirds),
        ),
        PopupMenuItem(
          child: Text(
            "${!isSymmetry ? "Enable" : "Disable"} Symmetry",
            style: TextStyle(color: isSymmetry ? Colors.green : Colors.white),
          ),
          value: "symmetry",
          onTap: () => setState(() => isSymmetry = !isSymmetry),
        ),
        PopupMenuItem(
          child: Text(
            "${!isPhi ? "Enable" : "Disable"} Phi",
            style: TextStyle(color: isPhi ? Colors.green : Colors.white),
          ),
          value: "phi",
          onTap: () => setState(() => isPhi = !isPhi),
        ),
        PopupMenuItem(
          child: Text(
            "${!isFile ? "Pick" : "Remove"} file",
            style: TextStyle(color: isFile ? Colors.green : Colors.white),
          ),
          value: "image",
          onTap: () async {
            if (!isFile) await _pickFile();
            setState(() => isFile = !isFile);
          },
        ),
        PopupMenuItem(
          child: Text(
            "${!isWebView ? "Enable" : "Disable"} web view",
            style: TextStyle(color: isWebView ? Colors.green : Colors.white),
          ),
          value: "image",
          onTap: () {
            setState(() => isWebView = !isWebView);
          },
        ),
        PopupMenuItem(
          child: Text(
            "Always on top",
            style: TextStyle(color: isOnTop ? Colors.green : Colors.white),
          ),
          value: "setOnTop",
          onTap: () async {
            setState(() => isOnTop = !isOnTop);
            wm.windowManager.setAlwaysOnTop(isOnTop);
          },
        ),
        PopupMenuItem(
          child: const Text(
            "Close app",
            style: TextStyle(color: Colors.white),
          ),
          value: 'exit',
          onTap: () => exit(0),
        ),
      ],
    );
  }

  void _showColorPicker() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pick a color"),
          content: SingleChildScrollView(
            child: ColorPicker(
              portraitOnly: true,
              pickerAreaHeightPercent: 0.5,
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text("Got it"),
              onPressed: () {
                setState(() => color = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      imageFile = File(result.files.single.path!);
    } else {
      // User cancelled the picker
    }
  }
}
