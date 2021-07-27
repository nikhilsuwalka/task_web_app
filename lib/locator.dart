import 'package:get_it/get_it.dart';
import 'package:task_web_app/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton(() => NavigationService());

}