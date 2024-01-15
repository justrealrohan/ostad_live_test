import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var MyItems = [
  {
    "img":
    "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png"
  },
  {
    "img":
    "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png"
  },
  {
    "img":
    "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png"
  },
  {
    "img":
    "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png"
  },
  {
    "img":
    "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png"
  },
  {
    "img":
    "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png"
  },
  {
    "img":
    "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png"
  },
  {
    "img":
    "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png"
  },
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'News Feed',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
              crossAxisSpacing: 3,
            ),
            itemCount: MyItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          MyItems[index]["img"]!,
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
