import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    // print(data);

    // set backgorund image

    String bgImage;
    int img = data['timeofDay'];
    if(img == 1)
      bgImage = '1.jpg';
    else if(img == 2)
      bgImage = '2.jpg';
    else if(img == 3)
      bgImage = '3.jpg';
    else if(img == 4)
      bgImage = '4.jpg';
    else
      bgImage = '5.jpg';

    Color bgColor;
    if(img == 1)
      bgColor = Colors.blue[400];
    else if(img == 2)
      bgColor = Colors.black;
    else if(img == 3)
      bgColor = Colors.blue;
    else if(img == 4)
      bgColor = Colors.orange[800];
    else
      bgColor = Colors.blue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: [
                  SizedBox(height: 100.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 70.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'location': result['location'],
                          'flag': result['flag'],
                          'time': result['time'],
                          'timeofDay': result['timeofDay'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location_outlined,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    label: Text(
                      'Edit the location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
