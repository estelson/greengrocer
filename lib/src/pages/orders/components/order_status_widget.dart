import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  const OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _StatusDot(
          title: "Teste de pagamento",
          isActive: true,
        ),
        _StatusDot(
          title: "Pagamento efetuado",
          isActive: false,
        ),
      ],
    );
  }
}

// Widget do container direito, contendo a timeline vertical de status do pedido
class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Pontos dos status da timeline
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color:
                isActive ? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        // Espaçamento entre o ponto e o texto
        const SizedBox(width: 5),

        // Textos dos status da timeline
        Expanded(
          child: Text(title),
        ),
      ],
    );
  }
}
