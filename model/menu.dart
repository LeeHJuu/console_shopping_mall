class Menu {
  int index;
  String title;

  Menu(this.index, this.title);
}

// 제공하는 메뉴 목록
List<Menu> menuIndex = [
  Menu(1, '상품 목록 보기'),
  Menu(2, '장바구니에 담기'),
  Menu(3, '장바구니에 담긴 상품의 총 가격 보기'),
  Menu(4, '프로그램 종료'),
  Menu(6, '장바구니 초기화'),
];
