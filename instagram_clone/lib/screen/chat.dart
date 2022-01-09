import 'package:flutter/material.dart';
import 'package:flutter_application_999/screen/home.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List img = [
    "assets/images/talha.jpeg",
    "assets/images/nergis.jpeg",
    "assets/images/barbara.jpeg",
    "assets/images/talha3.jpeg",
    "assets/images/emir.jpeg",
    "assets/images/mert.jpeg",
    "assets/images/apo.jpeg",
    "assets/images/barbara.jpeg",
    "assets/images/talha4.jpeg",
  ];
  List name = [
    "talha.bayrakci",
    "Nergis Hüsna",
    "barbara_palvin",
    "talha.bayrakci",
    "emirorkcü",
    "yomralioglumert",
    "a.onus",
    "barbara_palvin",
    "talha.bayrakci"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Direct Mesage",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.3),
                      )),
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            const Divider(
              height: 20,
            ),
            SizedBox(
              height: 441,
              child: buildChatScreen(),
            )
          ],
        ));
  }

  buildChatScreen() {
    return ListView.builder(
        itemCount: img.length,
        itemBuilder: (context, index) {
          return Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(img[index]),
                        radius: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 120.0),
                      child: Text(name[index]),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt))
                  ],
                ),
                const Divider(
                  height: 20,
                )
              ],
            ),
            secondaryActions: <Widget>[
              Container(
                  height: 60,
                  color: Colors.grey.shade500,
                  child: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  )),
              Container(
                  height: 60,
                  color: Colors.red,
                  child: const Icon(
                    Icons.delete_outline_sharp,
                    color: Colors.white,
                  )),
            ],
          );
        });
  }
}
