import 'dart:convert';

import 'package:api_1/Modles/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<ProductModel> productlist = [];

  Future<List<ProductModel>> getpostapi() async {
    final response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        productlist.add(ProductModel.fromJson(i));
      }
      return productlist;
    } else {
      return productlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getpostapi(),
      builder: (context, Snapshot) {
        if (!Snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: productlist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    print("Hello worldf ");
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 140, 169, 233),
                          Color.fromARGB(255, 230, 74, 13),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        // productlist[index].images == null
                        //     ? const Text("La image xaena")
                        //     :

                        Image.network(
                          productlist[index].images.toString(),
                          fit: BoxFit.cover,
                        ),
                        Text(
                          productlist[index].title.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          productlist[index].price.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
