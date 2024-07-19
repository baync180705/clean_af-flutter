import 'package:flutter/material.dart';


class AdvPayement extends StatelessWidget {
  const AdvPayement({super.key});

  @override
  build(BuildContext context){
      final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map ;
      print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make advanced payment',
            style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back),),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Wrap(
          spacing: 16,
          runSpacing: 32,
          )
      )
    );
  }
}


