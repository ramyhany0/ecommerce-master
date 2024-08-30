import 'package:get/get.dart';

import '../data/helper/status_request.dart';
import '../data/remote/address.dart';
import '../models/view_address_model.dart';
import '../shared/function/handing_datacontroller.dart';
import '../shared/services/services.dart';

class CheckoutController extends GetxController {


  // AddressData addressData = Get.put(AddressData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String? addressid;


  late String total;

  late String token;

  AddressData addressData = AddressData(Get.find()) ;



  List<Address> data=[];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }



  getShippingAddress() async {

    statusRequest = StatusRequest.loading;

    var response = await addressData.getAddress(

      token: myServices.sharedPreferences.getString("token")!,

    );

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == true) {


        List responsedata = response['data']['address'];


        data.addAll(responsedata.map((e) => Address.fromJson(e)));


        print(response);




        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();

  }




  Future<void> initialData() async {


    token = myServices.sharedPreferences.getString("token") ?? "";

    //
    // address = myServices.sharedPreferences.getInt("address");

  }


  @override
  void onInit() {
    initialData();
    total=Get.arguments['total'];
    getShippingAddress();
    super.onInit();
  }
}