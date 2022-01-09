import 'package:flutter/material.dart';
import 'package:flutter_application_999/follow/follow_detay.dart';
import 'package:flutter_application_999/screen/profil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({Key? key}) : super(key: key);

  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  final List<User> _users = [
    User(
        'Talha Bayrakcı', '@talha.bayrakci', 'assets/images/talha.jpeg', false),
    User('Nergis Bırasoglu', '@nergis_61', 'assets/images/nergis.jpeg', false),
    User('Emir Örkcü', '@emirorkcu', 'assets/images/emir.jpeg', false),
    User('Barbara Palvin', '@barbara_palvin', 'assets/images/barbara.jpeg',
        false),
    User('Abdullah Onus', '@a.onus', 'assets/images/apo.jpeg', false),
    User('Mert Yomralıoğlu', '@yomralıoglumert', 'assets/images/mert.jpeg',
        false),
    User('Talha Bayrakcı', '@talha.bayrakci', 'assets/images/talha2.jpeg',
        false),
    User('Talha Bayrakcı', '@talha.bayrakci', 'assets/images/talha3.jpeg',
        false),
    User('Talha Bayrakcı', '@talha.bayrakci', 'assets/images/talha4.jpeg',
        false),
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilPage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                hintText: "Search users"),
          ),
        ),
      ),
      body: Container(
        child: _foundedUsers.length > 0
            ? ListView.builder(
                itemCount: _foundedUsers.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: userComponent(user: _foundedUsers[index]),
                  );
                })
            : const Center(
                child: Text(
                "No users found",
                style: TextStyle(color: Colors.black),
              )),
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    user.image,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 5,
              ),
              Text(user.username, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: user.isFollowedByMe
                        ? Colors.blue[700]
                        : Color(0xffffff),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: user.isFollowedByMe
                          ? Colors.transparent
                          : Colors.grey.shade700,
                    )),
                child: Center(
                    child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow',
                        style: TextStyle(
                            color: user.isFollowedByMe
                                ? Colors.black
                                : Colors.black)))),
          )
        ],
      ),
    );
  }
}
