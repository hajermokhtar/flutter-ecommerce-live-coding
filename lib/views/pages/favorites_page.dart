import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/views/widgets/shared/custom_app_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Favorites',
          hasIcon: false,
          hasBackNav: false,
          hasBottomContent: false).build(context),
    );
  }
}
