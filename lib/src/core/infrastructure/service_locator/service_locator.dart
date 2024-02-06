import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  generateForDir: ['lib', 'test'],
)
void configureDependencies(String environment) => locator.init(
      environment: environment,
    );
