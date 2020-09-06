package matzip.dao;

import java.util.List;
import java.util.Map;

import matzip.bean.MatzipDTO;
import myblog.bean.MyblogDTO;

public interface MatzipDAO {

	public List<MatzipDTO> matzipList(int startNum, int endNum, String address);

	public List<MatzipDTO> matzipList();

	public MatzipDTO getMatzipView(String title);

	public List<MatzipDTO> matzipThreeList();

	public List<MatzipDTO> matzipAllList(int startNum, int endNum);

	public List<MyblogDTO> getMatzipReview(String title, int startNum, int endNum);

	public String getReviewCount(String keyword);

	public void updateReviewCount(Map<String, String> map);

	public List<MatzipDTO> matzipListAll();

	public void deleteMatzip(String title);

}
