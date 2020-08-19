package hashtag.service;

import java.util.List;

import hashtag.bean.HashtagDTO;
import myblog.bean.MyblogDTO;

public interface HashtagService {

	public void insertHashTag(String hashtag);

	public List<HashtagDTO> hashtagSearch(String hashtagText);

	public List<MyblogDTO> hastagBlogList(String[] ar);

}
