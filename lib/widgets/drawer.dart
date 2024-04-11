import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled35/custom_colors.dart';



class DrawerWid extends StatelessWidget {
  const DrawerWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(threeDotBGColor),
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Anmol',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0
                ),),
              accountEmail: Text('mxxxxxx94@gmail.com',
                style: TextStyle(
                  color: Colors.black38,
                ),),
              otherAccountsPictures: <Widget>[
                Transform.translate(
                  offset: Offset(0,82),
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundColor: Colors.grey.shade400,
                    child: CircleAvatar(radius: 23.0,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit_outlined,color: Colors.grey,size: 22.0,),
                    ),
                  ),
                )
              ],
              margin: EdgeInsets.only(top: 16.0,left: 8.0),
              decoration: BoxDecoration(
                  color: Color(threeDotBGColor)
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: Icon(Icons.add_a_photo_outlined,
                  color: Colors.blue.shade100,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width:1.0,color: Colors.grey.shade400)
                  ),
                  child:ListTile(
                    leading: FaIcon(FontAwesomeIcons.crown,color: Colors.yellowAccent,),
                    title: Transform.translate(offset:Offset(-16,0),child: Text('Upgrade to Premium')),
                  )),
            ),
            DrawerTile(
                icon: Icon(Icons.remove_red_eye_outlined),
                title: 'Who viewed my profile',
                trailing: '1'),
            DrawerTile(
              icon: Icon(Icons.shield_outlined),
              title: 'Manage Blocking',
            ),
            DrawerTile(
              icon: FaIcon(FontAwesomeIcons.solidHeart,color: Colors.blue,),
              title: 'Finanicial News',
            ),
            DrawerTile(
                icon: CircleAvatar(
                    radius: 12.0,
                    backgroundColor: Colors.grey.shade800,
                    child: FaIcon(FontAwesomeIcons.indianRupeeSign
                      ,color: Colors.white,size: 14.0,)),
                title: 'Personal Loans'),

            DrawerTile(
              icon: Icon(Icons.card_giftcard_outlined),
              title: 'Invite Friends',
            ),
            Divider(thickness: 1,color: Colors.grey.shade300,),
            ListTile(
              title: Transform.translate(offset:Offset(8,0),child: Text('Dark Mode')),
              trailing: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.grey.shade300,
                child: CircleAvatar(
                    radius:16.0,
                    backgroundColor: Colors.white,
                    child: FaIcon(FontAwesomeIcons.moon,color: Colors.grey.shade800,size: 16.0,)),
              ),
            ),
            OtherOptions(title: 'Settings'),
            OtherOptions(title: 'Send feedbacks'),
            OtherOptions(title: 'FAQ'),
          ],
        )
    );
  }
}

class OtherOptions extends StatelessWidget {
  const OtherOptions({
    Key?key,required this.title
  }):super(key:key);
  final title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Transform.translate(offset: Offset(8,0),child: Text(title),),
    );
  }
}

class DrawerTile extends StatefulWidget {
  const DrawerTile({
    Key? key,this.trailing,required this.title,required this.icon
  }):super(key:key);
  final trailing;
  final title;
  final icon;

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) { Widget trailText= widget.trailing == null?CircleAvatar(
    radius: 0,
    backgroundColor: Colors.transparent,
  ):CircleAvatar(radius: 10.0,backgroundColor: Colors.blue,
    child: Text(widget.trailing,
      style: TextStyle(
          fontSize: 6.0,fontWeight: FontWeight.w600
      ),),);
  return ListTile(
    leading: Transform.translate(
        offset:Offset(-8,0),child: widget.icon),
    title: Transform.translate(
        offset: Offset(-8,0),child:Text(widget.title.toString())),
    trailing: trailText,
  );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2.0
                )
            ),
            height: 40.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.0,vertical: 2.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      icon: Icon(Icons.arrow_back,
                          color: Colors.black),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: (){},
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400
                                )
                            ),
                          )
                      ),
                    ),
                    IconButton(onPressed: (){},
                      icon: Icon(Icons.image_search_outlined,
                          color: Colors.grey),
                    ),
                    IconButton(onPressed: (){},
                      icon: Icon(Icons.location_on_outlined,
                          color: Colors.grey),
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
