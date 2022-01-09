import 'package:flutter/material.dart';
import 'package:flutter_application_999/screen/chat.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.camera_alt,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Instagram",
          style:
              TextStyle(fontFamily: "Genel", fontSize: 30, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.live_tv,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatPage()));
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Stories',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.8),
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.arrow_right,
                      size: 43,
                    ),
                    Text(
                      'Watch All',
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8),
                          fontWeight: FontWeight.w600,
                          fontSize: 19),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: 122,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 75,
                            height: 75,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/talha.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'My Story',
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                story(
                  'assets/images/nergis.jpeg',
                  'Nergis Bırasoglu',
                ),
                story(
                  'assets/images/barbara.jpeg',
                  'Barbara Palvin',
                ),
                story('assets/images/emir.jpeg', 'Emir'),
                story('assets/images/apo.jpeg', 'Abdullah'),
                story('assets/images/mert.jpeg', 'Mert'),
              ],
            ),
          ),
          post('assets/images/talha.jpeg', "talha.bayrakci"),
          post('assets/images/nergis.jpeg', "Nergis Bırasoglu"),
          post('assets/images/barbara.jpeg', "barbara_palvin"),
          post('assets/images/emir.jpeg', "emirorkcu"),
          post('assets/images/mert.jpeg', "yomralioglumert"),
        ],
      ),
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
}

Widget story(String image, name) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0.1),
          width: 76,
          height: 76,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFc05ba6), width: 3)),
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(
              color: Colors.black.withOpacity(.8), fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget post(String image, name) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(.3)))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/kucuk.jpg'),
          ),
          title: Text(
            name,
            style: TextStyle(
                color: Colors.black.withOpacity(.8),
                fontWeight: FontWeight.w400,
                fontSize: 21),
          ),
          trailing: const Icon(Icons.more_vert),
        ),
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Icon(Icons.favorite_border, size: 31),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(Icons.comment_sharp, size: 31),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(Icons.send, size: 31),
                ],
              ),
              const Icon(Icons.bookmark_border, size: 31)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Text(
            'liked by you and 385 others',
            style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(.8)),
          ),
        )
      ],
    ),
  );
}
