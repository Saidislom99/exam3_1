import 'package:exam3/example/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cubit"),),
      body: Center(child: Text("${context.watch<CounterCubit>().state}"),),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            context.read<CounterCubit>().a();
          },
          child: Icon(Icons.add),),
          FloatingActionButton(onPressed: (){
            context.read<CounterCubit>().b();
          },
            child: Icon(Icons.remove),
          ),
        ],
      ),

    );
  }
}
