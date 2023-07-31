import 'dart:ui';

import 'package:fake_store_app/bloc/bloc/store_bloc.dart';
import 'package:fake_store_app/pages/detail_page.dart';
import 'package:fake_store_app/widget/home_load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          top: 28,
          right: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<StoreBloc, StoreState>(
              builder: (context, state) {
                if (state is ErrorStore) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is GetDataStoreCompletedState) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: state.dataHomeStore.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              mainAxisExtent: 200),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailPage(),
                              ),
                            );
                            context.read<StoreBloc>().add(
                                GetDataDetailStoreEvent(
                                    state.dataHomeStore[index].id));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Image.network(
                                    state.dataHomeStore[index].image,
                                    height: 80,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    state.dataHomeStore[index].title
                                        .split(' ')
                                        .take(2)
                                        .join(' '),
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.star),
                                      Text(state.dataHomeStore[index].rating
                                          .toString()),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        '  \$ ${state.dataHomeStore[index].price}'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }

                return const HomeLoad();
              },
            ),
          ],
        ),
      ),
    );
  }
}
