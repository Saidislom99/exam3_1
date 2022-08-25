import 'package:exam3/data/models/product_item.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';
class AllProductItemView extends StatelessWidget {
  const AllProductItemView({Key? key, required this.item, required this.onTap})
      : super(key: key);

  final ProductItem item;
  final VoidCallback onTap;





  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 8,
                    blurRadius: 5,
                    offset: const Offset(1, 3),
                    color: Colors.grey.shade300)
              ]),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: MyTextStyle.interBold700.copyWith(
                    fontSize: 16,
                    color: MyColors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.price.toString(),
                    style: MyTextStyle.interSemiBold600.copyWith(
                      fontSize: 18,
                      color: MyColors.C_4047C1,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 3,
            right: 3,
            child: IconButton(
              onPressed: onTap,
              icon: Icon(Icons.favorite_outline,

              ),
            ))
      ],
    );
  }
}
