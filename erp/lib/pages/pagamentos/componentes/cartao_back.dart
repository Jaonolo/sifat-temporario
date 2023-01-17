import 'package:flutter/material.dart';

class CartaoCreditoBack extends StatelessWidget {
  const CartaoCreditoBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width *.3,
      width: 380,
      height: 220,
      decoration: BoxDecoration(
        color: Color.fromRGBO(13, 13, 13, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: LayoutBuilder(
        builder: (_, constraints){
          return Column(
            children: [
              SizedBox(height: 20,),
              Container(
                height: 40,
                color: Colors.white,
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: constraints.maxWidth * .8,
                    height: 60,
                    color: Colors.grey,
                  ),
                  Container(
                    width: constraints.maxWidth * .2,
                    height: 60,
                    color: Colors.white,
                    child: Center(child: Text('***')),
                  ),
                ],
              )
            ],
          );
        },
      ),

    );
  }
}
