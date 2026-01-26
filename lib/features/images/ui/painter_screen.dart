import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neo_canvas/core/di/di.dart';
import 'package:neo_canvas/core/ui/widgets/neo_appbar.dart';
import 'package:neo_canvas/features/app/app_scaffold.dart';
import 'package:neo_canvas/features/images/domain/view_models/painter_view_model.dart';
import 'package:neo_canvas/features/images/ui/widgets/neo_painter_board.dart';

class PainterScreen extends StatelessWidget {
  final File? initialImage;

  const PainterScreen({super.key, this.initialImage});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<PainterViewModel>();

    return AppScaffold(
      extendBodyBehindAppBar: true,
      appBar: NeoAppbar(
        title: initialImage == null ? 'Новое изображение' : 'Редактирование',
        leading: InkWell(
          onTap: viewModel.onBackTap,
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
        trailing: InkWell(
          onTap: viewModel.onImageSave,
          child: SvgPicture.asset('assets/svg/fi-rr-check.svg'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 140,
            top: 24,
          ),
          child: NeoPainterBoard(
            initialImage: initialImage,
            controller: viewModel.controller,
          ),
        ),
      ),
    );
  }
}
