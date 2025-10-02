// part of 'main.dart';

// class Service {
//   static Future<void> initFlutter() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.landscapeLeft]);
//   }

//   static Future<void> initEnv() async {
//     await dotenv.load(fileName: '.env');
//   }

//   static ProviderContainer registerServices() {
//     final container = ProviderContainer();
//     GetIt.I.registerSingleton(ApiService());
//     GetIt.I.registerSingleton(RouterService()..init());
//     return container;
//   }
// }
