import 'package:get/get.dart';
import 'package:translator_app/api/http_manager.dart';
import 'package:translator_app/constants/url.dart';
import 'package:translator_app/models/all_languges_model.dart';

class AllLanguagesController extends GetxController {
  RxInt count = RxInt(0);
  var allLanguages = AllLanguagesModel();
  var isLoading = true.obs;
  getAllLanguages() async {
    final languages = await DioService().getMthod('$baseUrl/languages');

    allLanguages = languages!;
    isLoading = false.obs;
    count.value = allLanguages.data!.languages.length;
  }

  @override
  void onInit() {
    getAllLanguages();
    super.onInit();
  }
}
