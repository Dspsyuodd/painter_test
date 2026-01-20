enum AppRoutes {
  splash(path: '/splash'),
  auth(path: '/auth'),
  registration(path: '/registration'),
  main(path: '/main', authRequired: true),
  gallery(path: '/gallery', authRequired: true),
  painter(path: '/painter', authRequired: true)
  ;

  final String path;
  final bool authRequired;

  const AppRoutes({required this.path, this.authRequired = false});

  static const defaultRoute = splash;

  static final pathMap = Map.fromEntries(
    values.map((e) => MapEntry(e.path, e)),
  );
}
