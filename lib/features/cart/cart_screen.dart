import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/main_textbutton.dart';
import '../../cubit/home/home_cubit.dart';
import '../../cubit/home/home_states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          return cubit.cartProducts.isEmpty
              ? const EmptyCart()
              : Column(
                  children: [CartList(cubit: cubit), CartTotal(cubit: cubit)],
                );
        },
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 50),
      decoration: const BoxDecoration(
        color: Color(0xff040001),
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white54,
              ),
            ),
          ),
          const SizedBox(height: 5),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(
                    cubit.cartProducts[index].title ?? '',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const Spacer(),
                  Text(
                    "${cubit.cartProducts[index].price} \$",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: cubit.cartProducts.length,
          ),
          const Divider(color: Colors.white12, height: 0),
          const SizedBox(height: 20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    cubit.cartProducts
                        .fold(
                          0,
                          (previousValue, element) =>
                              element.price!.toInt() + previousValue,
                        )
                        .toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MainTextButton(
                onPressed: () {},
                title: 'Checkout Now',
                color: Colors.white,
                titleColor: Color(0xff040001),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
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
                    cubit.cartProducts[index].title ?? 'Title',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${cubit.cartProducts[index].price} \$',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MainTextButton(
                icon: Icons.remove,
                color: Colors.black12,
                titleColor: Colors.black,
                onPressed: () =>
                    cubit.removeFromCart(cubit.cartProducts[index]),
                title: 'Remove',
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: cubit.cartProducts.length,
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.inbox,
            size: 120,
            color: Colors.black26,
          ),
          SizedBox(height: 15),
          Text(
            'Cart is Empty',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Add More items to your Cart',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
