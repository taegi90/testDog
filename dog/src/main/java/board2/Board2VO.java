package board2;

public class Board2VO {

	// DB(Table)에 필드 = 입력폼(form) name값 = VO 필드
	// getter/setter 자동 생성 단축키 shift+alt+s -> r -> alt+a -> alt+r
	
	// 테이블에 있는 필드
	private int board_num;
	private String board_name;
	private String board_pass;
	private String board_subject;
	private String board_content;
	private String board_file;
	private int board_re_ref;
	private int board_re_lev;
	private int board_re_seq;
	private int board_readcount;
	private String board_date;
	private String test;
	
	// 추가 필드
	private int page;	// 사용자가 요청한 페이지번호
	private int limit;	// 페이지당 로우 수
	private int startIndex;	// limit 시작 인덱스
	private int maxPage;	// 총페이지수
	private String searchword;
	
	// 초기화(생성자)
	public Board2VO() {
		this.page = 1;	// 사용자가 요청한 페이지번호가 없으면 초기값 1
		this.limit = 10; // 페이지당 로우수가 지정이 안되면 초기값 10
	}
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_pass() {
		return board_pass;
	}
	public void setBoard_pass(String board_pass) {
		this.board_pass = board_pass;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public int getBoard_re_ref() {
		return board_re_ref;
	}
	public void setBoard_re_ref(int board_re_ref) {
		this.board_re_ref = board_re_ref;
	}
	public int getBoard_re_lev() {
		return board_re_lev;
	}
	public void setBoard_re_lev(int board_re_lev) {
		this.board_re_lev = board_re_lev;
	}
	public int getBoard_re_seq() {
		return board_re_seq;
	}
	public void setBoard_re_seq(int board_re_seq) {
		this.board_re_seq = board_re_seq;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStartIndex() {
		// 시작인덱스값 mybatis에서 getter 메서드를 호출하기 때문에 여기에 로직을 추가
		int i = (this.page - 1) * this.limit;
		return i;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public String getTest() {
		return test;
	}


	public void setTest(String test) {
		this.test = test;
	}


	public String getSearchword() {
		return searchword;
	}


	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	
	
}
