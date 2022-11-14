import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: "Green",
                style: TextStyle(color: CustomColors.customSwatchColor),
              ),
              TextSpan(
                text: "grocer",
                style: TextStyle(color: CustomColors.customContrastColor),
              ),
            ],
          ),
        ),

        // Carrinho de compras
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: CustomColors.customSwatchColor,
            ),
          ),
        ],
      ),

      // Campo de pesquisa

      // Categorias

      // Grid de produtos
    );
  }
}
