package util;

import board2.PageInfo;

public class Page {

	public static PageInfo getPageInfo(int page, int limit, int listCount) {
		// 전체페이지수
		int maxPage = listCount / limit;
		if (listCount % limit > 0) maxPage++;
		
		// 시작페이지
		//int startPage = (((int) ((double)page/10+0.9))-1)*10+1;
		int startPage = (page-1)/limit*limit+1; //15-1 /10*10+1
		// 종료페이지
		int endPage = startPage+limit-1;
		
		if (endPage > maxPage) endPage = maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		return pageInfo;
	}
	
	// 화면에 페이징처리영역을 생성해주는 기능
	// 매개변수 : 사용자가 요청한 페이지, 전페 페이지 수, url
	// 리턴 : 페이지갯수만큼 <a></a> 반복해서 문자열로 리턴
	public static String getPageList(int page, int totalpage, String url) {
		// 시작페이지
		int startPage = (page-1)/10*10+1; //15-1 /10*10+1
		// 종료페이지
		int endPage = startPage+10-1;
		if (endPage > totalpage) endPage = totalpage;
				
		String result = "<section id='pageList'>";
		
		// 이전 링크
		if (page <= 1) result += "[이전]";
		else result += "<a href='"+url+"?page="+(page-1)+"'>[이전]</a>&nbsp;";
		
		// 반복
		for (int i=startPage; i<=endPage; i++) {
			if (i == page) {
				result +="["+i+"]";
			} else {
				result += "<a href='"+url+"?page="+i+"'>["+i+"]</a>&nbsp;";
			}
		}
		
		// 다음 링크
		if (page >= totalpage) result += "[다음]";
		else result += "<a href='"+url+"?page="+(page+1)+"'>[다음]</a>&nbsp;";
		
		result += "</section>";
		return result;
	}
	
	public static  void main(String[] args) {
		String p = getPageList(1, 3, "index.do");
		System.out.println(p);
	}
	
	
}
