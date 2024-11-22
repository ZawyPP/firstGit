
import 'package:david_je_reper/povolanie.dart';

class David {
  final int iq;
  final String name;  //vysvetli string
  final bool jeTeply;
  final double velkostVCentimetroch;
  final String? pekneSlovaONom;
  final Povolanie povolanie;
  final List<String> davidoveFotky;

  David({
    this.iq = 8,
    required this.name,
    required this.jeTeply,
    required this.velkostVCentimetroch,
    required this.pekneSlovaONom,
    required this.povolanie,
    required this.davidoveFotky
  });


  factory David.fromJson(Map<String, dynamic> json) {
    return David(
      iq: json['iq'],
      name: json['name'],
      jeTeply: json['jeTeply'] != null ? json['jeTeply'] : true,
      velkostVCentimetroch: json['velkostVCentimetroch'] != null ? json['velkostVCentimetroch'] : "",
      pekneSlovaONom: json['pekneSlovaONom'] != null ? json['pekneSlovaONom'] : "",
      povolanie: ParsePovolanie.fromString(json['povolanie']),
      davidoveFotky: json['davidoveFotky'] != null ? List<String>.from(json['davidoveFotky']) : []
    );
  }


  void main() {
    David osoba = David( );
    print("Meno: ${osoba.meno}, Vek: ${osoba.vek}");
  }
}
