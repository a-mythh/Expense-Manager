import "package:flutter/material.dart";

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentOfTotal;

  const ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPercentOfTotal,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              "₹${spendingAmount.toStringAsFixed(0)}",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        RotatedBox(
          quarterTurns: 2,
          child: Container(
            height: 60,
            width: 15,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
