import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Latihan extends StatefulWidget{
  const Latihan({super.key});

@override
  State<Latihan> createState() => LatihanState();
}


class LatihanState extends State<Latihan> {
  List<Map<String, dynamic>> dataMobil =[
    {'type': 'Yaris', 'roda': 1,'pintu': 3},
    {'type': 'Innova', 'roda': 2,'pintu': 2},
    {'type': 'Avanza', 'roda': 3,'pintu':4}
  ];
  bool listMobil = false;

 @override
  Widget build(BuildContext context){

       

  return  Scaffold(

        backgroundColor: Colors.white,
        body: SingleChildScrollView(
      

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100),
              Container(
                
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              child: Image.asset('assets/images/toyota.png',
              width: 200,
              height:200,
              
              )
              ),
              const SizedBox(height: 10),
              const Text('Status Saat Ini',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            
              // Tombol 1
              GestureDetector(
                onTap: () {
                  setState(() {
                    listMobil = true;
                     const snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'On Snap!',
                      message:
                          'This is an example error message that will be shown in the body of snackbar!',
          
                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.warning,
                    ),
                  );
                      ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Tombol 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
          
              //Tombol 2
              GestureDetector(
                onTap: () {
                  setState(() {
                  listMobil = false;
                  const materialBanner = MaterialBanner(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    forceActionsBelow: true,
                    content: AwesomeSnackbarContent(
                      title: 'Oh Hey!!',
                      message:
                          'This is an example error message that will be shown in the body of materialBanner!',
          
                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.success,
                      // to configure for material banner
                      inMaterialBanner: true,
                    ),
                    actions: [SizedBox.shrink()],
                  );
          
                  ScaffoldMessenger.of(context)
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(materialBanner);
          
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Tombol 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ), 
              const SizedBox(width: 10),
          
              //Tombol 3
               GestureDetector(
                onTap: () {
                  setState(() {
                    listMobil = false;
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Tombol 3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
               
                ],
              ),
              const SizedBox(height: 15),
          
              // Text yang berubah

              if (listMobil==true)
              
              ...{
                ListView.separated(
                  shrinkWrap: true, 
                  itemCount: dataMobil.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context , index){
                    return const Divider();
                  },
                  itemBuilder: (context,index){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " ${dataMobil[index]['type']} \n Roda : ${dataMobil[index]['roda']} Pintu : ${dataMobil[index]['pintu']} ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                      ],
          
                    );
                  }
                )
              }
          
          
          
            ]
           
          ),
        ),
       )
      );
  
  }
  }

