import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:Home(),debugShowCheckedModeBanner: false,),);
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldkey=new GlobalKey<ScaffoldState>();
  
VoidCallback _showParsBottomSheetCallBack;
@override
void initState() { 
  super.initState();
  _showParsBottomSheetCallBack=_showBottomSheet;
  
}
void _showBottomSheet(){
  setState(() {
     _showParsBottomSheetCallBack=null;
  });
 _scaffoldkey.currentState.showBottomSheet((context){
 return Card(
   elevation: 10,
    child: Container(
     height: 300,
child: Center(
    child: new Text(
      "Persistenc Bottom Sheet"
      ,style: new TextStyle(
        fontSize:18,
        fontWeight:FontWeight.bold),)),
   ),
 );
 }).closed.whenComplete(() {
if(mounted){
  setState(() {
    _showParsBottomSheetCallBack =_showBottomSheet;
  });
}
 });
}

void _showModelSheet(){
  showModalBottomSheet(context: (context), builder: (builder){
   return Container(
     child: Center(child: Text("Modek Sheet",style: new TextStyle(fontSize:18,color: Colors.black)),),
   );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child:Text("BottomSheet",style: TextStyle(color:Colors.black),),),backgroundColor: Colors.white,),
      key: _scaffoldkey,
      backgroundColor: Colors.black,
      body: Center(
     child: Column(
     
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
         Card(
           elevation: 7,
             child: InkWell(
               child: Container(
               child: Center(child: new Text("Persistenc",style: new TextStyle(fontWeight:FontWeight.bold,color:Colors.black),)),  
               height: 40,
               width: 120,
               
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(6),
                 color: Colors.white
               ),
             
           ),
           onTap:_showParsBottomSheetCallBack,
             ),
         ),
         SizedBox(height:20),
         Card(
           elevation: 7,
             child: InkWell(
               child: Container(
               child: Center(child: new Text("Model",style: new TextStyle(fontWeight:FontWeight.bold,color:Colors.black),)),  
               height: 40,
               width: 120,
               
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(6),
                 color: Colors.white
               ),
             
           ),
           onTap: _showModelSheet,
             ),
         ),
     ],
        ),
      ),
    );
  }
}