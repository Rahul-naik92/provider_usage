import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteProvider>(context);
    print('Whole Build Executing');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Provider'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItems(index);
                        }
                      },
                      title: Text('Item$index'),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
