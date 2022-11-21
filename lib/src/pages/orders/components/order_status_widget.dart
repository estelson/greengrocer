import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  // Map de tatus de pedido
  final Map<String, int> allStatus = <String, int>{
    "pending_payment": 0,
    "refunded": 1,
    "paid": 2,
    "preparing_purchase": 3,
    "shipping": 4,
    "delivered": 5,
  };

  // Getter que retorna o status atual do pedido.
  // O "!" no final indica ao lint "null-safety" que nunca será null e que sempre será excolhido algum status do map allStatus.
  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          title: "Pedido confirmado",
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: "PIX estornado",
            backgroundColor: Colors.orange,
          )
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: "Pagamento PIX vencido",
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: "Aguardando pagamento",
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: "Preparando",
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 4,
            title: "Envio",
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus == 5,
            title: "Entregue",
          ),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

// Widget do container direito, contendo a timeline vertical de status do pedido
class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
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
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
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
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
