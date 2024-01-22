import 'package:effective_test/services/service.dart';

class HomeData {
  homeScreenData() async {
    final response = await NetworkService().get(
        url: 'https://run.mocky.io/v3/75000507-da9a-43f8-a618-df698ea7176d');

    return response;
  }
}
