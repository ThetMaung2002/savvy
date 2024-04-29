// import 'package:flutter/material.dart';
// import 'package:savvy/components/typo.dart';

// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.secondary,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       margin: const EdgeInsets.all(16.0),
//       child: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Typo(
//               label: "Total",
//               variant: TypoVariant.title,
//               color: Colors.white,
//             ),
//             Typo(
//               label: "",
//               variant: TypoVariant.subtitle,
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// enum Type { size, large, medium, small, micro }

import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Typo(
        label: "Hello World",
        variant: TypoVariant.defaultVariant,
      ),
    );
  }
}

//ToDo Build dashboard widget component to display datas of user
//* 29th April 2024
//* Author - ThetMaung2002