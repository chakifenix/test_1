import 'package:effective_test/services/service.dart';

class OrderData {
  orderData() async {
    final response = await NetworkService().get(
        url: 'https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');

    return response;
  }
}
