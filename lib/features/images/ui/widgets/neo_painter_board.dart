import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neo_canvas/features/images/ui/widgets/neo_painter.dart';
import 'package:neo_canvas/features/images/ui/widgets/tool_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class NeoPainterBoard extends StatefulWidget {
  final NeoPainterController? controller;
  final File? initialImage;

  const NeoPainterBoard({super.key, this.controller, this.initialImage});

  @override
  State<NeoPainterBoard> createState() => _NeoPainterBoardState();
}

class _NeoPainterBoardState extends State<NeoPainterBoard> {
  List<PainterNode> nodes = [];
  var _selectedColor = Colors.black;
  var _strokeWidth = 4.0;
  File? _backgroundImage;
  final _repaintKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.controller?._bind(this);
    _backgroundImage = widget.initialImage;
  }

  @override
  Widget build(BuildContext context) {
    final image = _backgroundImage;
    return Column(
      spacing: 24,
      children: [
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Builder(
              builder: (shareContext) {
                return ToolButton(
                  iconPath: 'assets/svg/Download.svg',
                  onTap: () {
                    final box = shareContext.findRenderObject() as RenderBox?;
                    Rect? origin;
                    if (box != null) {
                      origin = box.localToGlobal(Offset.zero) & box.size;
                    }
                    _shareImage(origin);
                  },
                );
              },
            ),
            ToolButton(
              iconPath: 'assets/svg/Gallery Round.svg',
              onTap: _pickImage,
            ),
            ToolButton(
              iconPath: 'assets/svg/pencil-alt.svg',
              onTap: _showSlider,
            ),
            ToolButton(
              iconPath: 'assets/svg/eraser.svg',
              onTap: () {
                _selectedColor = Colors.white;
              },
            ),
            ToolButton(
              iconPath: 'assets/svg/palette.svg',
              onTap: _showPalette,
            ),
          ],
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: RepaintBoundary(
              key: _repaintKey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: image == null
                      ? null
                      : DecorationImage(
                          image: FileImage(image),
                          fit: BoxFit.cover,
                        ),
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanStart: (details) {
                    setState(() {
                      nodes.add(
                        PainterNode(
                          [details.localPosition],
                          _selectedColor,
                          _strokeWidth,
                        ),
                      );
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      nodes.last.path.add(details.localPosition);
                    });
                  },
                  child: CustomPaint(
                    size: Size.infinite,
                    painter: NeoPainter(
                      nodes,
                    ), // Pass the list of PainterNode here
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSlider() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          content: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, setStateDialog) {
                return Slider(
                  value: _strokeWidth,
                  min: 1,
                  max: 20,
                  divisions: 19,
                  label: _strokeWidth.round().toString(),
                  onChanged: (value) {
                    setStateDialog(() {
                      _strokeWidth = value;
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showPalette() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ColorPicker(
                pickerColor: _selectedColor,
                onColorChanged: (color) {
                  _selectedColor = color;
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _backgroundImage = File(image.path);
      });
    }
  }

  Future<File?> _getPainterFile() async {
    try {
      final boundary =
          _repaintKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      final image = await boundary?.toImage(pixelRatio: 3);
      final bytes = (await image?.toByteData(
        format: ImageByteFormat.png,
      ))?.buffer.asUint8List();
      if (bytes == null) return null;

      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/drawing.png').create();
      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      showScaffoldMessage('Ошибка: $e');
    }
    return null;
  }

  Future<File?> _saveImage() async {
    try {
      final file = await _getPainterFile();
      if (file == null) return null;
      await Gal.putImage(file.path);
      showScaffoldMessage('Изображение сохранено в галерею');
      return file;
    } on GalException catch (e) {
      showScaffoldMessage('Ошибка: ${e.type.message}');
    }
    return null;
  }

  Future<void> _shareImage(Rect? sharePositionOrigin) async {
    final file = await _getPainterFile();
    if (file == null) return;

    final params = ShareParams(
      previewThumbnail: XFile(file.path),
      files: [XFile(file.path)],
      sharePositionOrigin: sharePositionOrigin,
    );
    await SharePlus.instance.share(params);
  }

  void showScaffoldMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class NeoPainterController {
  _NeoPainterBoardState? _state;

  // ignore: use_setters_to_change_properties
  void _bind(_NeoPainterBoardState state) {
    _state = state;
  }

  Future<File?> saveImage() async {
    return await _state?._saveImage();
  }
}
