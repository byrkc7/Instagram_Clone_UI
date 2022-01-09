import 'package:flutter/material.dart';
import 'package:flutter_application_999/follow/follow.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "talha.bayrakci",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/talha.jpeg')),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: const [
                                TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Text("posts"),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FollowPage()));
                                  },
                                  child: Text(
                                    "1.174",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Text(
                                  "followers",
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FollowPage()));
                                    },
                                    child: Text("832",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))),
                                Text("following"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Talha Bayrakcı"),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Flutter Developer"),
                    )
                  ],
                ),
                Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    width: 320,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.black),
                        )))

                /* Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {},
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
            const Divider(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.table_chart_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person_search)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 90,
                        height: 150,
                        child: const Image(
                          image: AssetImage("assets/images/talha.jpeg"),
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 100,
                        height: 150,
                        child: const Image(
                          image: AssetImage("assets/images/talha2.jpeg"),
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 120,
                        height: 150,
                        child: const Image(
                          image: AssetImage("assets/images/talha3.jpeg"),
                          fit: BoxFit.contain,
                        ))
                  ],
                )
              ],
            )
          ],
        ),
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
