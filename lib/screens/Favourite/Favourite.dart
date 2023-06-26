import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sx/provider/favourite_provider.dart';
import 'package:provider_sx/screens/Favourite/my_favourite.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> indexList = [];
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyFavourites()));
            },
            child: Icon(
              Icons.favorite_sharp,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 1000,
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
