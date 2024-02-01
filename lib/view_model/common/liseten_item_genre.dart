enum BigGenre {
  love(1), //1
  fantasy(2), //2
  literature(3), //3
  sf(4), //4
  other(98), //98
  nonGenre(99),
  non(0), //上記以外のジャンル（存在しない）
  ;

  const BigGenre(
    this.genreNo,
  );

  final int genreNo;

  factory BigGenre.fromName(int num) {
    switch (num) {
      case 1:
        return BigGenre.love;
      case 2:
        return BigGenre.fantasy;
      case 3:
        return BigGenre.literature;
      case 4:
        return BigGenre.sf;
      case 98:
        return BigGenre.other;
      case 99:
        return BigGenre.nonGenre;
      default:
        return BigGenre.non;
    }
  }
}
