import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'core/utils/converters/date_input_converter.dart';
import 'features/data/repositories/space_media_repository_implementation.dart';
import 'features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'features/presenter/controllers/home_store.dart';
import 'features/presenter/pages/home_page.dart';
import 'features/presenter/pages/picture_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeStore(i())),
    Bind.lazySingleton((i) => GetSpaceMediaFromDateUsecase(i())),
    Bind.lazySingleton((i) => SpaceMediaRepositoryImplementation(i())),
    // Bind.lazySingleton((i) => SpaceMediaDatasouceImplementation(converter: i(), client: i())),
    Bind.lazySingleton((i) => http.Client()),
    Bind.lazySingleton((i) => DateInputConverter()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const HomePage()),
    ChildRoute('/picture', child: (_, args) => PicturePage.fromArgs(args.data)),
  ];
}

class SpaceMediaDatasouceImplementation {}
