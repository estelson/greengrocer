import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título do tile do pedido
              Text("Pedido: ${order.id}"),

              // Data do tile do pedido
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          // Aplicando espaçamento interno ao conteúdo do dialog expandido
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),

          children: [
            // Conteúdo do dialog expandido
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  // Container esquerdo
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: order.items.map((orderItem) {
                        return _OrderItemWidget(
                          utilsServices: utilsServices,
                          orderItem: orderItem,
                        );
                      }).toList(),
                    ),
                  ),

                  // Container direito
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          // Quantidade e unidade de medida
          Text(
            "${orderItem.quantity} ${orderItem.item.unit} ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          // Nome do produto
          Expanded(
            child: Text(orderItem.item.itemName),
          ),

          // Preço do produto
          Text(utilsServices.priceToCurrency(orderItem.totalPrice())),
        ],
      ),
    );
  }
}
