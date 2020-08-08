package matzip.dao;

import java.util.List;

import matzip.bean.MatzipDTO;

public interface MatzipDAO {

	public List<MatzipDTO> matzipList(String address);

	public List<MatzipDTO> matzipList();

	public MatzipDTO getMatzipView(String title);

}
