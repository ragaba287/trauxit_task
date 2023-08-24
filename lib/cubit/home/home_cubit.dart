import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState()) {
    generateDummyProducts();
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductModel> storeProducts = [];
  void generateDummyProducts() async {
    for (int i = 0; i < 5; i++) {
      storeProducts.add(
        ProductModel(
          id: i,
          price: Random().nextInt(900),
          title: 'Product $i',
        ),
      );
    }
    emit(GetDummyProductsState());
  }

  List<ProductModel> cartProducts = [];
  void addToCart(ProductModel productModel) async {
    cartProducts.add(productModel);
    emit(AddToCartState());
  }

  void removeFromCart(ProductModel productModel) async {
    cartProducts.removeWhere((e) => e.id == productModel.id);
    emit(RemoveFromCartState());
  }

  bool checkItemInCart(ProductModel productModel) =>
      cartProducts.contains(productModel);
}
