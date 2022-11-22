import 'package:get/get.dart';

import 'form_model.dart';

class FormController extends GetxController {
  var forms = List<FormModel>.empty(growable: true).obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    formList();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void formList() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 2), () {
      forms.addAll([
        FormModel(
            leadId: "1",
            leadName: "ABC",
            contact: "123",
            region: "IN",
            address: "Chennai",
            type: "FollowUp"),
        FormModel(
            leadId: "2",
            leadName: "ABDC",
            contact: "1234",
            region: "IN",
            address: "Covai",
            type: "FollowUp")
      ]);
    });
    isLoading.value = false;
    update();
  }

  void addNewForm(id, name, contact, region, address, type) async {
    forms.insert(
        0,
        FormModel(
            leadId: id,
            leadName: name,
            contact: contact,
            region: region,
            address: address,
            type: type));
    update();
    Get.back();
  }
}
