import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sx/provider/favourite_provider.dart';

class MyFavourites extends StatefulWidget {
  const MyFavourites({Key? key}) : super(key: key);

  @override
  State<MyFavourites> createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  @override
  Widget build(BuildContext context) {
    final _myFav = Provider.of<FavProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _myFav.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.remove(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        leading: Text(index.toString()),
                        trailing: value.selectedItem.contains(index)
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
