import 'package:myy_app/apis/api_model.dart';
import 'package:myy_app/apis/dummy_api_service.dart';
import 'package:get/get.dart';

class DummyController extends GetxController {

  final ApiService apiService = ApiService();

  var isLoading = true.obs;

  ///Initial State of Model
  var dummyModel = DummyModel(
    statusCode: 0,
    statusMessages: '',
    data: Data(products: []),
  ).obs;
  var errorMessage = ''.obs;

  void onInit() {
    super.onInit();
    fetchDummyData();
  }

    void fetchDummyData() async {
      try {
        isLoading(true);
        final result = await apiService.fetchData();
        dummyModel.value = result;
        errorMessage.value = '';
      } catch (e) {
        errorMessage(e.toString());
      } finally {
        isLoading(false);
      }
    }



}