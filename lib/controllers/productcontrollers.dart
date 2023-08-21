import 'package:get/state_manager.dart';
import 'package:shopxapp/model/model.dart';
import 'package:shopxapp/services/remote_services.dart';

    class ProductController extends GetxController{
      var isLoading = true.obs;
     var productList = <ProductsModel>[].obs;


     @override
     void onInit(){
       fetchProducts();
       super.onInit();
     }

     void fetchProducts() async{
       isLoading(true);
   try {
     var products = await   RemoteServices.fetchProducts();
     if(products!=null){
       productList.value = products;
     }
   } finally {
     isLoading(false);
   }
     }
    }