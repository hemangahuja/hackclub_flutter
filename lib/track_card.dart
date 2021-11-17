import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrackInfo{
  String name;
  String imageURL;
  DateTime releaseDate;
  Duration length;
  double price;
  TrackInfo({required this.name, required this.imageURL,required this.releaseDate,required this.length,required this.price});

}

class TrackCard extends StatelessWidget {

  final TrackInfo data;
  const TrackCard({ Key? key , required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Row(
          children: [
            const Spacer(flex: 1,),
            Flexible(
              flex: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                    data.imageURL,
                    height: 75,
                    width: 100,
                  ),  
                
              ),
            ),
            const Spacer(flex: 1,),
            Flexible(
              flex: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Text(data.name , style: const TextStyle(fontSize: 20),),
                  const SizedBox(height: 3,),
                  Text(DateFormat.yMMMd().format(data.releaseDate), style:  TextStyle(fontSize: 15 ,color: Colors.grey[700])),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.schedule , color: Colors.grey[700]),
                      Text(' ${data.length.inMinutes} ${data.length.inSeconds%60}', style: const TextStyle(fontSize: 15),),
                      const SizedBox(width: 49,),
                      Icon(Icons.play_circle,color: Colors.grey[700]),
                      const Text(' --', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 49,),
                      Icon(Icons.monetization_on,color: Colors.grey[700]),
                      Text(' \$${data.price.toString() } ' , style: const TextStyle(fontSize: 15),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
    );
   
  }
}