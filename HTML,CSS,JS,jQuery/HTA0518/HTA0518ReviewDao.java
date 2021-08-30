package review.dao;

import java.util.Date;

import review.vo.HTA0519Review;

public class HTA0518ReviewDao {
	
	public HTA0518Review getReview() {
		HTA0519Review review = new HTA0519Review(100,"아이폰", "애플", 1200000, 10, new Date());
		return review;
	}
}
