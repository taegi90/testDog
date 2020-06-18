package board2;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class Board2DAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Board2VO> list(Board2VO vo) {
		return sqlSession.selectList("board2.list", vo); // mapper 이름 namespace.id
	}
	
	public int count() {
		return sqlSession.selectOne("board2.count");
	}
	
	public int insert(Board2VO vo) {
		return sqlSession.insert("board2.insert",vo);
	}
	public void refUpdate(int board_num) { //리턴안받고 정수로 받음 상관없기에.
		sqlSession.update("board2.refUpdate",board_num);
	}
	// 조회수 증가
	public void updateReadcount(int board_num) {
		sqlSession.update("board2.updateReadcount", board_num);
	}
	public Board2VO view(int board_num) {
		return sqlSession.selectOne("board2.view",board_num);
	}
	public int update(Board2VO param) {
		return sqlSession.update("board2.update",param);
	}
	public int delete(int board_num) {
		return sqlSession.delete("board2.delete",board_num);
	}
	public int replySeq(Board2VO vo) {
		return sqlSession.update("board2.replySeq",vo);
	}
	public int replyInsert(Board2VO vo) {
		return sqlSession.insert("board2.replyInsert",vo);
	}
	
}
