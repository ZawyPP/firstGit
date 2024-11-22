// enum Povolanie { REPER, PORNOHEREC, GAY_PORNOHEREC, STRIPTER }
//
// extension ParsePovolanie on Povolanie {
//
//   String toShortString() {
//     return this
//         .toString()
//         .split('.')
//         .last;
//   }
//
//   static Povolanie fromString(String status) {
//
//     switch (status) {
//       case 'REPER':
//         return Povolanie.REPER;
//       case 'PORNOHEREC':
//         return Povolanie.PORNOHEREC;
//       case 'GAY_PORNOHEREC':
//         return Povolanie.GAY_PORNOHEREC;
//       case 'STRIPTE':
//         return Povolanie.STRIPTER;
//       default:
//         throw Exception('Unknown status: $status');
//     }
//   }
// }