import 'package:flutter/material.dart';

class MusicAppBar extends StatelessWidget implements PreferredSizeWidget {

  final IconData appBarIcon;
  final String appBarTitle;
  final String userImageURL;
  final double height = 60;
  const MusicAppBar({ Key? key , required this.appBarIcon , required this.appBarTitle , required this.userImageURL }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
       title: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          
             Flexible( flex : 1 , child: IconButton(onPressed: ()=>{}, icon : Icon(appBarIcon , color : Colors.black))),
             const Spacer(flex: 1,),
             Flexible(flex : 9 , child: Text(appBarTitle , style: const TextStyle(fontSize: 20 , color : Colors.black),)),
             const Spacer(flex: 6,),
             Flexible(
               flex : 7,
               child: CircleAvatar(
                 radius: 25,
                 backgroundImage: NetworkImage(
                   userImageURL
                 ),
               ),
             ),
             Flexible( flex : 2 ,child:  IconButton(onPressed: ()=>{}, icon : const Icon(Icons.settings , color : Colors.black)))
         ],
       )
    );
  }

  @override
  
  Size get preferredSize => Size.fromHeight(height);
}