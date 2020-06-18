package user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int idCheck(String id) {
		return sqlSession.selectOne("user.idCheck", id);
	}
	
	public int insert(UserVO vo) {
		return sqlSession.insert("user.insert", vo);
	}
}
