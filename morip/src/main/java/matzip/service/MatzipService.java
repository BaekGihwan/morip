package matzip.service;

import java.util.List;

import matzip.bean.MatzipDTO;
import matzip.bean.MatzipImageDTO;
import myblog.bean.MyblogDTO;

public interface MatzipService {

	public List<MatzipDTO> matzipList(int pg, String address);

	public List<MatzipDTO> matzipList();

	public MatzipDTO getMapzipView(String title);

	public List<MatzipDTO> matzipSearch(String matzipText);

	public MatzipDTO getMapzipView2(String title);

	public List<MatzipDTO> matzipThreeList();

	public List<MatzipDTO> matzipAllList(int parseInt);

	public List<MatzipImageDTO> matzipImage(String matzipTitle);

	public List<MyblogDTO> getMatzipReview(String title, int parseInt);

	public String getReviewCount(String keyword);

	public void updateReviewCount(String title, String reviewCount);

}
