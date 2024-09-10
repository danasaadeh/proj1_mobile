import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/model/hotel_model.dart';



class customCard extends StatelessWidget {
  final HotelInfo hotelInfo;
  final VoidCallback press;
    final double width;
  
  const customCard({
    required this.hotelInfo,required this.press,
    super.key, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
       borderRadius: BorderRadius.circular(20),
      child:Container(
        height: 230,
        width:width,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(20)),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image:DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage(hotelInfo.image))
                ),
              ),
              const SizedBox(height:20),
              Text( hotelInfo.name,
              style: TextStyle(fontSize:18,fontWeight: FontWeight.bold ),
              ),
             const SizedBox(height:8),
             Row(
           
              children: [
              Icon(Icons.location_on,
              color:Color(0XFF1B4158),
              ),
              Text(hotelInfo.location,style: TextStyle(
                color:Colors.grey,
                fontSize: 15,
              ),),
              const SizedBox(width: 10,),
              IconButton(
             icon:Icon(Icons.favorite_border_outlined,),
              color:Color(0XFF1B4158),
               onPressed: () {  },
              ),
            
             ],)
            
            
            
            ],),
          )
                
      )
    );
  }
}