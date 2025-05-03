import 'package:frontend/modules/tasks_list/view/cubit/task_cubit.dart';

import '../../../app_imports.dart';

class ServiceLocator {
  ServiceLocator._();

  static GetIt get locator => GetIt.instance;
  static Future<void> setupServiceLocator() async {
    await _registerDio();
    await _registerInfra();
    await _registerExternal();
    await _registerPresenter();
  }

  static Future<void> _registerDio() async {
    GetIt.I.registerLazySingleton<Dio>(() {
      return DioFactory.create();
    });

    GetIt.I.registerSingleton<IDioService>(
      DioServiceImp(locator()),
    );
  }

  static Future<void> _registerInfra() async {
    GetIt.I.registerLazySingleton<ITaskRepository>(
      () => TaskRepositoryImpl(locator()),
    );
  }

  static Future<void> _registerExternal() async {
    GetIt.I.registerLazySingleton<ITaskDatasource>(
      () => TaskDatasourceImpl(locator()),
    );
  }

  static Future<void> _registerPresenter() async {
    GetIt.I.registerLazySingleton<TaskCubit>(
      () => TaskCubit(locator()),
    );
  }

  static Future<void> resetAllInstances() async {
    await locator.reset();
    await setupServiceLocator();
  }
}
