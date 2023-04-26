import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';
import 'my_fav_items.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteProvider>(context, listen: false);
    print('Whole Build Executing');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Provider'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFavouriteItemScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
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
