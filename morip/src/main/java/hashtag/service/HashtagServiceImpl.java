package hashtag.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hashtag.bean.HashtagDTO;
import hashtag.dao.HashtagDAO;
import myblog.bean.MyblogDTO;

@Service("hashtagService")
public class HashtagServiceImpl implements HashtagService {
	@Autowired
	private HashtagDAO hashtagDAO;

	@Override
	public void insertHashTag(String hashtag) {
		String[] ar = hashtag.split(" ");
		for(int i=0;i<ar.length;i++) {
			hashtagDAO.insertHashTag(ar[i]);
		}		
	}
	
	//해쉬태그 검색
		@Override
		public List<HashtagDTO> hashtagSearch(String hashtagText) {
			List<HashtagDTO> list = new ArrayList<HashtagDTO>();
			list = hashtagDAO.hashtagSearch(hashtagText);
			return list;
		}

		@Override
		public List<MyblogDTO> hastagBlogList(String[] ar) {
			List<MyblogDTO> list = new ArrayList<MyblogDTO>();
			for(int i=0;i<ar.length;i++) {
				System.out.println(ar[i]);
				MyblogDTO myblogDTO = new MyblogDTO();
				myblogDTO = hashtagDAO.hashtagBlogList(ar[i]);
				list.add(myblogDTO);
			}
			return list;
		}
}
