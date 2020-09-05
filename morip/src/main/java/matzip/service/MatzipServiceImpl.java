package matzip.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import matzip.bean.MatzipDTO;
import matzip.bean.MatzipImageDTO;
import matzip.dao.MatzipDAO;
import myblog.bean.MyblogDTO;

@Service("matzipService")
public class MatzipServiceImpl implements MatzipService {
	@Autowired
	private MatzipDAO matzipDAO;
	private static String clientID = "hfPXyWE2CcZAhrdQrdHj";
	private static String clientSecret = "b8tHKB6IFb";
	public static StringBuilder sb;

	@Override
	public List<MatzipDTO> matzipList(int pg, String address) {
		// TODO Auto-generated method stub
		int endNum = pg * 8;
		int startNum = endNum - 7;
		return matzipDAO.matzipList(startNum, endNum, address);
	}

	@Override
	public List<MatzipDTO> matzipList() {
		// TODO Auto-generated method stub
		return matzipDAO.matzipList();
	}

	@Override
	public MatzipDTO getMapzipView(String title1) {
		MatzipDTO matzipDTO = new MatzipDTO();
		String getTitle = title1;
		try {
			int display = 5;
			String text = URLEncoder.encode(getTitle, "utf-8");
			URL url;
			url = new URL("https://openapi.naver.com/v1/search/local?query=" + text + "&display=" + display + "&");

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientID);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			sb = new StringBuilder();
			String line;

			while ((line = br.readLine()) != null) {
				sb.append(line + "\n");
			}

			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con.disconnect();
			String data = sb.toString();
			String[] array;
			array = data.split("\"");
			String[] title = new String[display];
			String[] link = new String[display];
			String[] category = new String[display];
			String[] description = new String[display];
			String[] telephone = new String[display];
			String[] address = new String[display];
			String[] roadAddress = new String[display];
			String[] mapx = new String[display];
			String[] mapy = new String[display];
			int k = 0;
			for (int i = 0; i < array.length; i++) {
				if (array[i].equals("title"))
					title[k] = array[i + 2];
				if (array[i].equals("link"))
					link[k] = array[i + 2];
				if (array[i].equals("category"))
					category[k] = array[i + 2];
				if (array[i].equals("description"))
					description[k] = array[i + 2];
				if (array[i].equals("telephone"))
					telephone[k] = array[i + 2];
				if (array[i].equals("address"))
					address[k] = array[i + 2];
				if (array[i].equals("mapx"))
					mapx[k] = array[i + 2];
				if (array[i].equals("description"))
					description[k] = array[i + 2];
				if (array[i].equals("roadAddress"))
					roadAddress[k] = array[i + 2];
				if (array[i].equals("mapy")) {
					mapy[k] = array[i + 2];
					k++;
				}
			}
			for (int i = 0; i < k; i++) {
				matzipDTO.setTitle(title[i]);
				matzipDTO.setLink(link[i]);
				matzipDTO.setCategory(category[i]);
				matzipDTO.setTime(description[i]);
				matzipDTO.setTelephone(telephone[i]);
				matzipDTO.setAddress(address[i]);
				matzipDTO.setMapx(mapx[i]);
				matzipDTO.setMapy(mapy[i]);
				matzipDTO.setRoadAddress(roadAddress[i]);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e);
		}

		return matzipDTO;
	}

	@Override
	public List<MatzipDTO> matzipSearch(String matzipText) {
		List<MatzipDTO> list = new ArrayList<MatzipDTO>();
		String matzipText1 = matzipText;
		try {
			int display = 5;
			String text = URLEncoder.encode(matzipText1, "utf-8");
			URL url;
			url = new URL("https://openapi.naver.com/v1/search/local?query=" + text + "&display=" + display + "&");

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientID);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			int responseCode = con.getResponseCode();

			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			sb = new StringBuilder();
			String line;

			while ((line = br.readLine()) != null) {
				sb.append(line + "\n");
			}

			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con.disconnect();
			String data = sb.toString();
			String[] array;
			array = data.split("\"");
			String[] title = new String[display];
			String[] link = new String[display];
			String[] category = new String[display];
			String[] description = new String[display];
			String[] telephone = new String[display];
			String[] address = new String[display];
			String[] roadAddress = new String[display];
			String[] mapx = new String[display];
			String[] mapy = new String[display];
			int k = 0;
			for (int i = 0; i < array.length; i++) {
				if (array[i].equals("title"))
					title[k] = array[i + 2];
				if (array[i].equals("link"))
					link[k] = array[i + 2];
				if (array[i].equals("category"))
					category[k] = array[i + 2];
				if (array[i].equals("description"))
					description[k] = array[i + 2];
				if (array[i].equals("telephone"))
					telephone[k] = array[i + 2];
				if (array[i].equals("address"))
					address[k] = array[i + 2];
				if (array[i].equals("mapx"))
					mapx[k] = array[i + 2];
				if (array[i].equals("description"))
					description[k] = array[i + 2];
				if (array[i].equals("roadAddress"))
					roadAddress[k] = array[i + 2];
				if (array[i].equals("mapy")) {
					mapy[k] = array[i + 2];
					k++;
				}
			}
			for (int i = 0; i < k; i++) {
				MatzipDTO matzipDTO = new MatzipDTO();
				matzipDTO.setTitle(title[i]);
				matzipDTO.setLink(link[i]);
				matzipDTO.setCategory(category[i]);
				matzipDTO.setTime(description[i]);
				matzipDTO.setTelephone(telephone[i]);
				matzipDTO.setAddress(address[i]);
				matzipDTO.setMapx(mapx[i]);
				matzipDTO.setMapy(mapy[i]);
				// matzipDTO.setDescription(description[i]);
				matzipDTO.setRoadAddress(roadAddress[i]);
				list.add(i, matzipDTO);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;

	}

	@Override
	public MatzipDTO getMapzipView2(String title) {
		// TODO Auto-generated method stub
		return matzipDAO.getMatzipView(title);
	}

	// 메인에 베스트 3개 뿌려주기
	@Override
	public List<MatzipDTO> matzipThreeList() {
		return matzipDAO.matzipThreeList();
	}

	public List<MatzipDTO> matzipAllList(int pg) {
		int endNum = pg * 8;
		int startNum = endNum - 7;
		List<MatzipDTO> list = matzipDAO.matzipAllList(startNum, endNum);
		// session.setAttribute("ar", ar);
		return list;
	}

	@Override
	public List<MatzipImageDTO> matzipImage(String matzipTitle) {

		List<MatzipImageDTO> list = new ArrayList<MatzipImageDTO>();

		try {

			String text = URLEncoder.encode(matzipTitle, "utf-8");
			URL url;
			url = new URL("https://openapi.naver.com/v1/search/image?query=" + text + "&display=8&start=1&sort=sim");

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientID);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			int responseCode = con.getResponseCode();

			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			sb = new StringBuilder();
			String line;

			while ((line = br.readLine()) != null) {
				sb.append(line + "\n");
			}

			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con.disconnect();
			String data = sb.toString();
			String[] array;
			array = data.split("\"");
			String[] title = new String[8];
			String[] link = new String[8];
			String[] thumbnail = new String[8];

			int k = 0;
			for (int i = 0; i < array.length; i++) {
				if (array[i].equals("title"))
					title[k] = array[i + 2];
				if (array[i].equals("link"))
					link[k] = array[i + 2];
				if (array[i].equals("thumbnail")) {
					thumbnail[k] = array[i + 2];
					k++;
				}
			}
			for (int i = 0; i < k; i++) {
				MatzipImageDTO matzipImageDTO = new MatzipImageDTO();
				matzipImageDTO.setTitle(title[i]);
				matzipImageDTO.setLink(link[i]);
				matzipImageDTO.setThumbnail(thumbnail[i]);
				list.add(i, matzipImageDTO);
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;

	}

	@Override
	public List<MyblogDTO> getMatzipReview(String title, int pg) {
		int endNum = pg * 2;
		int startNum = endNum - 1;
		List<MyblogDTO> list = matzipDAO.getMatzipReview(title, startNum, endNum);
		return list;
	}

	@Override
	public String getReviewCount(String keyword) {
		return matzipDAO.getReviewCount(keyword);
	}

	@Override
	public void updateReviewCount(String title, String reviewCount) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("reviewCount", reviewCount);
		matzipDAO.updateReviewCount(map);
	}

	@Override
	public List<MatzipDTO> matzipListAll() {
		return matzipDAO.matzipListAll();
	}

	@Override
	public void deleteMatzip(String title) {
		matzipDAO.deleteMatzip(title);
	}
}
