import 'package:flutter/material.dart';
import 'package:myy_app/apis/dummy_controller.dart';
import 'package:get/get.dart';
class DummyView extends StatelessWidget {
  final DummyController controller = Get.put(DummyController());

  DummyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Product List', style: TextStyle(fontSize: 14),),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }


        ///Add Error Widgwt
        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              'Error: ${controller.errorMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        final products = controller.dummyModel.value.data.products;


        ///if Product Empty
        if (products.isEmpty) {
          return const Center(
            child: Text('No products found'),
          );
        }


        ///View
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: Image.network(
                  product.imageUrl,
                  width: 80,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 60,
                      color: Colors.grey,
                    );
                  },
                ),
                title: Text(product.name, style: const TextStyle(fontSize: 12),),
                subtitle: Text(
                  '${product.currency} ${product.price.toStringAsFixed(2)}',
                ),
                trailing: Icon(
                  product.inStock ? Icons.check_circle : Icons.cancel,
                  color: product.inStock ? Colors.green : Colors.red,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
