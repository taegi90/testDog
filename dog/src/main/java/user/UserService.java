package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;
	
	public int idCheck(String id) {
		return userDAO.idCheck(id);
	}
	
	public int insert(UserVO vo) {
		return userDAO.insert(vo);
	}
}
