// import 'dart:convert';

import 'dart:convert';

import 'package:api_1/constants/constants_1.dart';
import 'package:api_1/widgets/feed_widget.dart';
// import 'package:api_1/home/user_service.dart';
import 'package:api_1/widgets/sales_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:card_swiper/card_swiper.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("Shopping"),
          leading: IconButton(
            color: lightIconsColor,
            onPressed: () {},
            icon: const Icon(IconlyBold.category),
          ),
          actions: [
            IconButton(
              color: lightIconsColor,
              onPressed: () {},
              icon: const Icon(IconlyBold.notification),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                    hintText: "Search",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Theme.of(context).cardColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2,
                      ),
                    ),
                    suffix: GestureDetector(
                      onTap: () {
                        print("Hello world");
                      },
                      child: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Swiper(
                  // itemHeight: MediaQuery.of(context).size.height * 0.25,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const Sales();
                  },
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Colors.amber)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product List",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("SEE MORE>>"),
                    )
                  ],
                ),
              ),
              Feed(),
              // Sales()
            ],
          ),
        ),
      ),
    );
  }
}
