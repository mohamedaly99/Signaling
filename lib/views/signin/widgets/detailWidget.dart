import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentina/services/api/reviews/addReviews.dart';
import 'package:rentina/views/map/carsOnMap.dart';
import 'package:rentina/views/signin/widgets/reviewItem.dart';

class DetailWidget extends StatefulWidget {


  final String userId;
  final String carId;
  final String modelName;
  final String productionYear;
  final String image;
  final String distance;
  final String fuelLevel;
  final String longtiude;
  final String latitude;
  final List< dynamic> reviews;

  DetailWidget(
      this.userId,
      this.carId,
      this.modelName,
      this.productionYear,
      this.image,
      this.distance,
      this.fuelLevel,
      this.longtiude,
      this.latitude,
      this.reviews);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  final  formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     
    String userReview;
        return  Form(
          key: formKey,
        child :Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Card(
              elevation: 15.0,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(widget.image))),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Model :  ",
                        style: TextStyle(fontSize: 18,color:  Theme.of(context).primaryColor),
                      ),
                      Text(
                        widget.modelName,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Proudction Year :  ",
                        style: TextStyle(fontSize: 18,color:  Theme.of(context).primaryColor),
                      ),
                      Text(
                        widget.productionYear,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Fuel Level :  ",
                        style: TextStyle(fontSize: 18,color:  Theme.of(context).primaryColor),
                      ),
                      Text(
                        widget.fuelLevel,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text("Customer Reviews :" ,style: TextStyle(fontSize: 18,color:  Theme.of(context).primaryColor),)
                  ,
                  Spacer(flex: 1,)
                  ,
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.3,
                    child :ListView.builder(
                      
                      padding: const EdgeInsets.all(1),
                      itemCount: widget.reviews.length,
                      itemBuilder: (context,index){
                        
                        return ReviewItem (
                          widget.reviews[index]["name"]
                          ,
                          widget.reviews[index]["review"]
                        );
                      },
    
                    )
                    ),
                  
                  Spacer(
                    flex: 1,
                  ),
                  Row(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      height: MediaQuery.of(context).size.height*0.1,
                    child :TextFormField(
                      
                    onSaved: (reviewInput) => userReview=reviewInput,
                    decoration: InputDecoration(hintText: "Add your review !"),
              )
                  )
            ,
              FlatButton (
                child: Text("Post"),
                color:  Theme.of(context).primaryColor,
                onPressed: (){
                  formKey.currentState.save();
                  if(userReview!=null){
                      print("Detail");
                      print(widget.userId);
                    addReviews(widget.userId, widget.carId, userReview).then((result)=>{

                      if(result=="success")
                      {
                       
                        new GlobalKey<ScaffoldState>().currentState.showSnackBar( 
                          new SnackBar(
                          content: new Text("Thank you for your feedback !"),
                          duration: new Duration(seconds: 3),
                          backgroundColor: Colors.green,
                        )
                        )
                      }
                    });

                  }
                  
                    
                },
              )
              ]
              
              ),
              Spacer(flex: 1,)
              ,Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.05,
              child :FlatButton(
                
                color:  Theme.of(context).primaryColor,
                child: Text("Show On Map"),
                onPressed: () {
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CarsOnMap(
                                carLat: double.parse(widget.latitude),
                                carLang: double.parse(widget.longtiude),
                                carName: widget.modelName,
                              )));
                },
              )
              ),
              Spacer(flex: 1,)
              ,
            ],
          ),
        ),
       )
       )
    ;
  }
}
