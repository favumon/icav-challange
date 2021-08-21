import 'package:data/di/data_injection.config.dart';
import 'package:domain/di/domain_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
configureDependencies({String? environment}) async {
  await $initDataGetIt(getIt, environment: environment);
  $initDomainGetIt(getIt, environment: environment);
  $initGetIt(getIt, environment: environment);
}
