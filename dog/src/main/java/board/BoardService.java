package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDao;
	
	public List<BoardVO> list(BoardVO vo){
		return boardDao.list(vo);
	}
}
