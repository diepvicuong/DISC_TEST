import 'package:disc_test/app/data/models/config/configuration.dart';
import 'package:disc_test/app/data/services/database_service.dart';

class ManagerService {
  ManagerService._privateConstructor();
  static final ManagerService _instance = ManagerService._privateConstructor();
  static ManagerService get instance => _instance;

  // Default configuration
  var _configuration = Configuration(
      questionLength: 10, // 10 question
      questionTimer: 30 * 60, // 30 mins
      gift: []);

  Configuration get configuration => _configuration;

  Future<void> initialize() async {
    final newConfig = await FirebaseDatabaseService.getConfigData();
    if (newConfig != null) {
      _configuration = newConfig;
    }
    print("Config from firebase:" + newConfig.toString());
  }
}
