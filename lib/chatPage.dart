import 'package:chatapp/authentication.dart';
import 'package:chatapp/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required String UID}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: TextTheme().apply(bodyColor: Colors.black),
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white)),
            child: PopupMenuButton<int>(
              color: Colors.black,
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text("Settings")),
                PopupMenuItem<int>(
                    value: 1, child: Text("Privacy Policy page")),
                PopupMenuDivider(),
                PopupMenuItem<int>(

                    value: 2,
                    child: GestureDetector(
                      onTap: (){
                        AuthenticationHelper().authSignOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text("Logout")
                        ],
                      ),
                    )),
              ],
              // onSelected: (),
            ),
          ),
        ],
        title: Text("Chats"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Akil S",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  Text("8:44 PM",style: TextStyle(fontSize: 16,color: Colors.black38),),
                ],

              ),
              SizedBox(height: 2,),
              Text("Hi! How are you doing ?",style: TextStyle(fontSize: 16,color: Colors.black38),),
              Divider(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Madhavan S",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  Text("9:20 AM",style: TextStyle(fontSize: 16,color: Colors.black38),),
                ],

              ),
              SizedBox(height: 2,),
              Text("I'll be there tomorrow morning! ?",style: TextStyle(fontSize: 16,color: Colors.black38),),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
