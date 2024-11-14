import 'package:change_currencies/blocs/current_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue1 = 'EGP';
    String dropdownValue2 = 'EG';
    var itemss = [
      'EGP',
      'USD',
      'USD',
    ];

    return BlocConsumer<CurrentCubit, CurrentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CurrentCubit.get(context);
        return Scaffold(
          // backgroundColor: Colors.black,

          appBar: AppBar(
            title: Text("Currency App"),
          ),
          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cubit.amount2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter amount',
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('from', style: TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),)
                  , Container(
                    height: 30,
                    child: DropdownButton(
                      value:cubit.dropdownValue1,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cubit.itemss.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );}).toList(),
                      onChanged: (String? newValue) {
                        cubit.DropDownValueFun1(newValue.toString());
                      },
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('to', style: TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),),
                  Container(
                    height: 30,
                    child: DropdownButton(
                      value: cubit.dropdownValue2,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cubit.itemss.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );                 }).toList(),
                      onChanged: ( newValue) {
                        cubit.DropDownValueFun2(newValue.toString());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: ()async {
                   await  cubit.getAll(
                        amount: int.parse(cubit.amount2.text),
                        from: cubit.dropdownValue1,
                        to: cubit.dropdownValue2,
                    );
                  }, child: Text(
                      "Convert"
                  )),
                  ElevatedButton(onPressed: () {

                  }, child: Text(
                      "Reset"
                  )),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("result ", style: TextStyle(fontSize: 20),),


                  Text("${ cubit.currentModel?.approxResult??'0'}", style: TextStyle(fontSize: 20)),

                ],
              )
            ],
          ),
        );
      },
    );
  }
}
