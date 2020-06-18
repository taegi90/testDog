package dog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;


@Service
public class DogService {
	
	@Autowired
	DogDAO dogDao;
	
	public List<DogVO> dogList(){
		return dogDao.dogList();
	}
	public int dogInsert(DogVO vo, MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/images/"));
		vo.setImage(fu.fileName);
		return dogDao.dogInsert(vo);
	}
	public DogVO dogView(int id) {
		DogVO vo = dogDao.dogView(id);
		return vo;
	}
}
