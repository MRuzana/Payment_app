import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payment_app/view_model/user_mobx.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key, required this.userMobx});

  final UserMobx userMobx;

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Card(
          elevation: 5,
          child: Observer(
            builder: (context) {
              if (userMobx.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (userMobx.currentUser == null) {
                return const Center(child: Text('No user data available'));
              }

              final user = userMobx.currentUser!;
              Color borderColor = (userMobx.paymentMethod != null || userMobx.enteredAmount != '2500'|| userMobx.visitors.isNotEmpty)
                  ? Colors.green
                  : Colors.transparent;

              return Column(
                children: [
                  const SizedBox(height: 10,),
                  Observer(
                    builder: (_) {
                      return CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(user.image),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:borderColor,
                            width: 6
                          )
                        ),
                      ),
                    );
                    },
                   
                  ),
                  const SizedBox(height: 10,),
                  Text(user.name,style: const TextStyle(fontSize: 14),),
                  Text(user.email,style: const TextStyle(fontSize: 14),),
                  Text(user.place,style: const TextStyle(fontSize: 14),),
                  Text(user.mobile,style: const TextStyle(fontSize: 14),),
                  Observer(
                    builder: (context){
                      return Text('₹ ${userMobx.enteredAmount}',style: const TextStyle(fontSize: 14 ),);
                    },
                    
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}