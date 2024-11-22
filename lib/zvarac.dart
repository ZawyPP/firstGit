class Zvarac {
  String meno;
  int vek;

  // Štandardný konštruktor
  Zvarac(String? meno, int? vek) {
    this.meno = meno;
    // this.vek = vek ?? 4;
  }
}

void main() {
  Zvarac osoba = Zvarac("Michal", 30);
  print("Meno: ${osoba.meno}, Vek: ${osoba.vek}");
  print("Meno: ${osoba.vek}" );


  List<String>zoznam =[];

}

