import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neo_canvas/core/di/di.dart';
import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/core/ui/widgets/app_background.dart';
import 'package:neo_canvas/core/ui/widgets/neo_appbar.dart';
import 'package:neo_canvas/core/ui/widgets/neo_buttons.dart';
import 'package:neo_canvas/features/images/domain/view_models/gallery_view_model.dart';
import 'package:neo_canvas/features/images/models/gallery_state.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<GalleryViewModel>();
    return StreamBuilder(
      stream: viewModel.stream,
      initialData: viewModel.state,
      builder: (context, snapshot) {
        return _GalleryScreen(
          snapshot.requireData,
          viewModel,
        );
      },
    );
  }
}

class _GalleryScreen extends StatelessWidget {
  final GalleryViewModel viewModel;
  final GalleryState state;

  const _GalleryScreen(this.state, this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NeoAppbar(
        title: 'Галерея',
        leading: InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.grey.shade800,
                  title: const Text('Выйти из аккаунта?'),
                  actions: [
                    ElevatedButton(
                      onPressed: viewModel.onLogout,
                      child: const Text('Выход'),
                    ),
                  ],
                );
              },
            );
          },
          child: SvgPicture.asset('assets/svg/Login 2.svg'),
        ),
      ),
      body: Stack(
        children: [
          const AppBackground(),
          Padding(
            padding: const EdgeInsets.only(
              top: 46,
              left: 24,
              right: 24,
            ),
            child: switch (state) {
              GalleryStateLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              GalleryStateData(:final images) => GridView.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                children: images
                    .map(
                      (image) => GestureDetector(
                        onTap: () => viewModel.onImageTap(image),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ColoredBox(
                            color: Colors.white,
                            child: Image.memory(
                              fit: BoxFit.fill,
                              Uint8List.fromList(base64Decode(image.bytes)),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              GalleryStateError(:final message) => Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                vertical: 40,
                horizontal: 20,
              ),
              child: NeoElevatedButton(
                text: 'Создать',
                onPressed: () {
                  final navi = getIt<NavigationModule>();
                  navi.painter();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
