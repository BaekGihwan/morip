package hashtag.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hashtag.dao.HashtagDAO;

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

}
