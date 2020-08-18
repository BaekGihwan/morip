package matzip.dao;

import java.util.List;

import matzip.bean.MatzipDTO;
import myblog.bean.MyblogDTO;

public interface MatzipDAO {

	public List<MatzipDTO> matzipList(String address);

	public List<MatzipDTO> matzipList();

	public MatzipDTO getMatzipView(String title);

	public List<MatzipDTO> matzipThreeList();

	public List<MatzipDTO> matzipAllList(int startNum, int endNum);

	public List<MyblogDTO> getMatzipReview(String title, int startNum, int endNum);

	public String getReviewCount(String keyword);

}
