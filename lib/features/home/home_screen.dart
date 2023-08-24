import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_task/core/router.dart';
import 'package:trauxit_task/features/cart/cart_screen.dart';

import '../../core/widgets/main_textbutton.dart';
import '../../cubit/home/home_cubit.dart';
import '../../cubit/home/home_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRAUXIT Task'),
        actions: [
          IconButton(
            onPressed: () => RouterNavigator.navigateTo(
              const CartScreen(),
            ),
            icon: const Icon(Icons.shopping_bag),
          )
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Icon(Icons.shopping_bag, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.storeProducts[index].title ?? 'Title',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${cubit.storeProducts[index].price} \$',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  cubit.checkItemInCart(cubit.storeProducts[index])
                      ? MainTextButton(
                          icon: Icons.remove,
                          color: Colors.black12,
                          titleColor: Colors.black,
                          onPressed: () =>
                              cubit.removeFromCart(cubit.storeProducts[index]),
                          title: 'Remove',
                        )
                      : MainTextButton(
                          icon: Icons.add,
                          onPressed: () =>
                              cubit.addToCart(cubit.storeProducts[index]),
                          title: 'Add to Cart',
                        ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: cubit.storeProducts.length,
          );
        },
      ),
    );
  }
}
