import 'dart:io';


import 'package:ac32_hd_sc/screen/devicepage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>(); //creating a key for a form
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   bool _isObscured = true;

  @override
  void initState(){
    super.initState();
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //
      //   title: Text(widget.title),
      // ),
      backgroundColor:  const Color.fromARGB(150, 26, 37, 101),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 400,
                  width: 600,
                  color: Colors.blue,
                  child:Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical:60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  hintText: "Email",
                                hintStyle: const TextStyle(
                                  color: Colors.black, // Change to your desired color
                                  fontSize: 16, // Optional: Adjust font size
                                ),

                                  icon:  Icon(Icons.person, color: Colors.white,),
                              fillColor: Colors.white,
                              filled: true,

                              ),

                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),

                          ),
                          Padding(padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: _isObscured,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                                  icon: _isObscured ? const Icon(Icons.visibility, color: Colors.black,) : const Icon(Icons.visibility_off, color: Colors.black,),
                                  onPressed: (){
                                    setState(() {
                                      _isObscured =! _isObscured;
                                    });
                                  },),
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                  color: Colors.black, // Change to your desired color
                                  fontSize: 16, // Optional: Adjust font size
                                ),

                                icon: const Icon(Icons.lock,color: Colors.white,),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Please enter your password';
                                }
                                else{
                                  return null;
                                }
                              },

                            ),),

                          Padding(padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,

                                children:<Widget> [
                               ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   minimumSize: const Size(15, 30),
                                   // width: 100, height: 40
                                 ),
                                      onPressed: (){
                                        exit(0);
                                      },
                                      child: const Align(
                                        alignment: Alignment.center,  // This ensures the text is centered
                                        child: Text('Exit'),
                                      ),
                                    ),
                                 const SizedBox(
                                   width: 10,
                                 ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(15, 30),
                                      // width: 100, height: 40
                                    ),
                                      onPressed: (){
                                        if(_formKey.currentState!.validate()){
                                          //Navigate the user to the home page


                                          if(emailController.text == "password"
                                              && passwordController.text == "password"){
                                            Navigator.push(context,
                                              MaterialPageRoute(builder:
                                                  (context) => DevicePage()
                                              ),);

                                          } else{
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Invalid Credential'))
                                            );
                                          }

                                        }else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Please fill input'))
                                          );
                                        }
                                      },
                                      child: const Align(
                                    alignment: Alignment.center,  // This ensures the text is centered
                                    child: Text('Submit'),
                                  ),
                                    ),

                                ],
                              ),

                                // child:ElevatedButton(
                                //   onPressed: (){
                                //     if(_formKey.currentState!.validate()){
                                //       //Navigate the user to the home page
                                //
                                //       // if(emailController.text == "gmail" && passwordController.text == "catandmouse"){
                                //       //   Navigator.push(context,
                                //       //     MaterialPageRoute(builder:
                                //       //         (context) => HomePage(email:emailController.text,)
                                //       //     ),);
                                //       //
                                //       // } else{
                                //       //   ScaffoldMessenger.of(context).showSnackBar(
                                //       //       const SnackBar(content: Text('Invalid Credential'))
                                //       //   );
                                //       // }
                                //
                                //     }else{
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //           const SnackBar(content: Text('Please fill input'))
                                //       );
                                //     }
                                //   },
                                //   child: const Text('Submit'),
                                // )

                            ),)

                        ],
                      ),
                    ),
                  )
                  ,
                ),
                const Positioned(
                  top: 8,
                  left: 8,
                  child: Text(
                    'Please log in',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            )


          ],
        ),
      ),

    );
  }
}
