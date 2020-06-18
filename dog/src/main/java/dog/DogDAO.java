package dog;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DogDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<DogVO> dogList(){
		return sqlSession.selectList("dog.dogList");
	}
	public int dogInsert(DogVO vo) {
		return sqlSession.insert("dog.dogInsert",vo);
	}
	public DogVO dogView(int vo) {
		return sqlSession.selectOne("dog.dogView",vo);
	}
}
