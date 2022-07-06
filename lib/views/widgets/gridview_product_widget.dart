import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/views/widgets/fav_button.dart';
import '../../utilities/colors.dart';
import 'rate_stars_.dart';

import '../../models/product_model.dart';

class GridViewProductWidget extends StatelessWidget {
  const GridViewProductWidget({Key? key, required this.product})
      : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    bool hasDiscount = product.discount > 0;
    final totalPrice = hasDiscount
        ? product.price
        : product.price - (product.price * product.discount / 100);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 300,
            // width: 600,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.contain,
                          height: 150,
                          width: 170,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      _generateCornerSpan(
                          context, hasDiscount, product.discount),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RateStars.build(product.rate!, context),
                        Text(product.category.toString(),
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: Colors.grey,
                                      // fontSize: 15,
                                    )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.title.toString(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.black,
                                  //fontSize: 18,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: ' $totalPrice SR',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                            text: '${product.price}',
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        FavButton.build(context, true)
      ],
    );
  }

  static Widget _generateCornerSpan(
      BuildContext context, bool hasDiscount, int? discountVal) {
    final Color color_ = hasDiscount ? primaryColor : Colors.black;
    final String text_ = hasDiscount ? '- $discountVal%' : 'new';
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 33,
          width: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: color_,
            ),
            child: Center(
              child: Text(text_,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
