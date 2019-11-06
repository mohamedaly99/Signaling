import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {


  final String user;
  final String review;


  ReviewItem (this.user,this.review);

  @override
  Widget build(BuildContext context){

    return 
      Container (
        child: Row(
          children: <Widget>[
            Text ( '${user} :  ' ,style: TextStyle(fontSize: 15,color: Colors.black87),  )
            ,
            Text (review, style: TextStyle(fontSize: 12),)

          ],

        )
       ,
      width: MediaQuery.of(context).size.width*0.6,
      height: MediaQuery.of(context).size.height*0.07,
      )
    ;
  }

}