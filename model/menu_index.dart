class MenuIndex {
  int index;
  String title;

  MenuIndex(this.index, this.title);
}

// 제공하는 메뉴 목록
List<MenuIndex> menuIndex = [
  MenuIndex(1, '상품 목록 보기'),
  MenuIndex(2, '장바구니에 담기'),
  MenuIndex(3, '장바구니에 담긴 상품의 총 가격 보기'),
  MenuIndex(4, '프로그램 종료'),
  MenuIndex(6, '장바구니 초기화'),
];
