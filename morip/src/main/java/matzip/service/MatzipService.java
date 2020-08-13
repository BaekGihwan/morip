package matzip.service;

import java.util.List;

import matzip.bean.MatzipDTO;

public interface MatzipService {

	public List<MatzipDTO> matzipList(String address);

	public List<MatzipDTO> matzipList();

	public MatzipDTO getMapzipView(String title);

	public List<MatzipDTO> matzipSearch(String matzipText);

	public MatzipDTO getMapzipView2(String title);

	public List<MatzipDTO> matzipThreeList();

}
