package hashtag.dao;

import java.util.List;

import hashtag.bean.HashtagDTO;
import myblog.bean.MyblogDTO;

public interface HashtagDAO {

	public void insertHashTag(String hashtag);

	public List<HashtagDTO> hashtagSearch(String hashtagText);

	public MyblogDTO hashtagBlogList(String seq);


}
