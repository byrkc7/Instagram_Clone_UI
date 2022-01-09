import 'package:flutter/material.dart';
import 'package:flutter_application_999/models/category.dart';
import 'package:flutter_application_999/search_json.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getSearch(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            icon:
                const Icon(Icons.home_outlined, size: 32, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/search");
            },
            icon: const Icon(Icons.search, size: 32, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/actions");
            },
            icon: const Icon(Icons.favorite_border,
                size: 32, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/profil");
            },
            icon:
                const Icon(Icons.person_outline, size: 32, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget getSearch() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SafeArea(
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 15,
              ),
              Container(
                width: size.width - 30,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.3),
                      )),
                  style: TextStyle(color: Colors.black.withOpacity(0.3)),
                  cursorColor: Colors.black.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
                children: List.generate(searchCategories.length, (index) {
              return CategoryStoryItem(
                name: searchCategories[index],
              );
            })),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Wrap(
          spacing: 1,
          runSpacing: 1,
          children: List.generate(searchImage.length, (index) {
            return Container(
              width: (size.width - 3) / 3,
              height: (size.width - 3) / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(searchImage[index]),
                      fit: BoxFit.cover)),
            );
          }),
        )
      ],
    ));
  }
}
