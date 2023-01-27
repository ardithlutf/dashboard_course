import 'package:drift/native.dart';
import 'package:simple_absen/injector/injector.dart';
import 'package:simple_absen/services/local_storage_service/drift_services.dart';

class DatabaseModule {
  DatabaseModule._();

  static void init() {
    final injector = Injector.instance;

    /* Floor package didn't support for Web platform
    If you run this repo on web, you must remove Local database module, or using
    another local database package, or check kIsWeb everywhere you use the local
    database module
    */

    injector.registerSingletonAsync<Database>(() async {
      final Database databaseManager = Database(NativeDatabase.memory());
      // await databaseManager.;
      return databaseManager;
    });
  }

  // static void initRepositories() {
  //   final injector = Injector.instance;
  //   injector.registerFactory<DogImageLocalRepository>(
  //     () => DogImageLocalRepositoryImpl(
  //       appDatabaseManager: injector(),
  //     ),
  //   );
  // }
}
