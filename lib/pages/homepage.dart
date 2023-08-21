import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopxapp/controllers/productcontrollers.dart';
import 'package:get/get.dart';
import 'package:shopxapp/pages/producttile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
              padding:const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(child: Text("ShopX",
                style: TextStyle(
                  fontFamily: 'avenier',
                  fontSize: 32,
                  fontWeight: FontWeight.w900
                ),
                ),
                ),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.view_list_rounded,
                    ),
                ),
                IconButton(onPressed: (){},
                  icon: const Icon(
                    Icons.grid_view,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if(productController.isLoading.value)
                return const Center(child: CircularProgressIndicator());
              else
              return
                StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(
                        productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                );
            }
            ),
          ),

        ],
      ),
      
    );
  }
}
