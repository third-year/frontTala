import 'package:flutter/cupertino.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.all(9),
      child: ListView(
        children: [Column(
          children: [



          ],
        )



        ],

      ),



    );
  }
}
// child: Scaffold(
//
// appBar: AppBar(backgroundColor: Color(0xFF439A97),
//
// ),
// body: SingleChildScrollView(
// child:   Padding(
// padding: const EdgeInsets.all(15.0),
// child: Container(
//
// color: Colors.grey[190],
// child:   Form(
// key: formkay,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children:[
//
// SizedBox(height: 30,),
//
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text1( text: 'name product :',size: 18,fontWeight:FontWeight.w400),
// ),
// SizedBox(height: 10,),
// DefaultTextaField(hint: '',color: Colors.white,r: 0,type:TextInputType.text ,     controller: nameproduct,
// validate1: (value) {
// if (value == null || value.isEmpty) {
// return 'please enter the name product';
// }
// return null;
// },),
//
//
// SizedBox(height: 10,),
//
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text1( text: 'description :',size: 18,fontWeight:FontWeight.w400),
// ),
// SizedBox(height: 10,),
// DefaultTextaField(hint: '',color: Colors.white,r: 0,type:TextInputType.text,controller: description_product, validate1: (value) {
// if (value == null || value.isEmpty) {
// return 'please enter ';
// }
// return null;
// },),
//
//
//
// SizedBox(height: 10,),
//
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text1( text: 'price :',size: 18,fontWeight:FontWeight.w400),
// ),
// SizedBox(height: 10,),
// DefaultTextaField(hint: '',color: Colors.white,r: 0,type:TextInputType.number ,controller: number_product,
// validate1: (value) {
// if (value == null || value.isEmpty) {
// return 'please enter ';
// }
// return null;
// },),
//
//
//
// SizedBox(height: 10,),
//
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text1( text: 'quantity :',size: 18,fontWeight:FontWeight.w400),
// ),
// SizedBox(height: 10,),
// DefaultTextaField(hint: '',color: Colors.white,r: 0,type:TextInputType.number ,controller: quantity_product,
// validate1: (value) {
// if (value == null || value.isEmpty) {
// return 'please enter ';
// }
// return null;
// },
// ),
//
//
//
// SizedBox(height: 10,),
//
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text1( text: 'category :',size: 18,fontWeight:FontWeight.w400),
// ),
// SizedBox(height: 10,),
// DropdownButton(
// isExpanded: true,
// value: selectgetcategory,
// items:
// [
// //getcategory().toList(),
// DropdownMenuItem(child:Text("furniture") ,value:   "furniture"),
// DropdownMenuItem(child:Text( "accessories") ,value:  "accessories"),
// DropdownMenuItem(child:Text("food") ,value: "food"),
// DropdownMenuItem(child:Text("clothes") ,value: "clothes"),
// DropdownMenuItem(child:Text("shoes") ,value: "shoes"),
// DropdownMenuItem(child:Text("gifts") ,value: "gifts"),
// DropdownMenuItem(child:Text("books") ,value: "books"),
// DropdownMenuItem(child:Text("technology") ,value: "technology"),
// ],
//
// onChanged:(value){
// setState(() {
// selectgetcategory=value!;
// print(value);
// });
//
//
// }),
//
//
//
// SizedBox(height: 10,),
//
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text1( text: 'status :',size: 18,fontWeight:FontWeight.w400),
// ),
// SizedBox(height: 10,),
// DropdownButton(
// padding:  EdgeInsets.only(left: 8.0),
// isExpanded: true,
// value: selectstatus,
// items: [
// DropdownMenuItem(child:Text('new') ,value: 'new'),
// DropdownMenuItem(child:Text("old") ,value: "old"),
// ],
// onChanged:(value){
// setState(() {
// selectstatus=value!;
// print(value);
// });
// }),
//
// SizedBox(height: 10,),
//
// Center(
// child: DefaultButton(onTap:()async{
// getlocation();
// L=await getlocat();
// print(' llll =${L.longitude}');
// },
// text: 'Click here to access your location',
// w: 300,
//
// ),
// ),
// SizedBox(height: 10,),
// Center(
// child: DefaultButton(text: 'Add Product',
// color: Color(0xFF439A97), s: 20,r: 30,w: 200,
// onTap: () {
// if (formkay.currentState!.validate()) {
// print('yas');
// product(context).
// };
// }),
// ),
// ],
// ),
// ),
// ),
// ),
// )
// ),