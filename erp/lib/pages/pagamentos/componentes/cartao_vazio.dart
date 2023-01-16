import 'package:flutter/material.dart';


class CartaoVazio extends StatelessWidget {
  final VoidCallback? onPressed;

  CartaoVazio(
      {Key? key,
       required this.onPressed,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 2,
                    ),
                ),
                child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.add_circle,
                      size: 144,
                      color: Color.fromRGBO(50, 50, 50, 1),
                    )
                ),
              ),
              const SizedBox(height: 12,),
            ],
          ),
          SizedBox(height: 24,),
        ],
      ),
    );
  }
}
