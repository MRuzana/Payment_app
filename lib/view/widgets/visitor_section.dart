import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payment_app/view_model/user_mobx.dart';

class VisitorsSection extends StatelessWidget {
  const VisitorsSection({super.key,required this.userMobx});
  final UserMobx userMobx;

  @override
  Widget build(BuildContext context) {
   return Observer(
      builder: (context) {
        
        final visitorsList = userMobx.visitors;

        if(visitorsList.isEmpty){
          return const Center(child: Text('No Visitors',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),));
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: ListView.builder(
            shrinkWrap: true, 
            physics: const NeverScrollableScrollPhysics(),
            itemCount: visitorsList.length,
            itemBuilder: (context, index) {
              final visitor = visitorsList[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5 ),
                child: Card(
                //  color: const Color.fromARGB(255, 234, 230, 230),
                  elevation: 5,
                  child: ListTile(
                    title: Text(visitor.visitorName),
                    trailing: Text('Amount: ₹${visitor.amount}',style: const TextStyle(fontSize: 12),),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}