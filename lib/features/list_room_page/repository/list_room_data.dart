import 'package:effective_test/services/service.dart';

class ListRoomData {
  listRoomData() async {
    final response = await NetworkService().get(
        url: 'https://run.mocky.io/v3/157ea342-a8a3-4e00-a8e6-a87d170aa0a2');

    return response;
  }
}
