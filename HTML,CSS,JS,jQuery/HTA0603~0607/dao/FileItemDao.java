package com.sample.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sample.util.MybatisUtils;
import com.sample.vo.FileItem;

public class FileItemDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	private static FileItemDao instance = new FileItemDao();
	
	private FileItemDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	
	public static FileItemDao getInstance() {
		return instance;
	}
	
	/**
	 * SAMPLE_FILE_REPOSITIORIES 테이블에 저장된 모든 첨부파일 정보를 반환한다.
	 * @return 모든 첨부파일 정보
	 */
	public List<FileItem> getAllFileItems(){
		SqlSession session = sqlSessionFactory.openSession();
		List<FileItem> items = session.selectList("getAllFileItems");
		session.close();
		return items;
	}
	
	/**
	 * SAMPLE_FILE_REPOSITORIES 테이블에 전달받은 번호에 대한 파일정보를 반환한다.
	 * @param no 파일번호
	 * @return 파일정보
	 */
	public FileItem getFileItem(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		FileItem item = session.selectOne("getFileItem", no);
		session.close();
		return item;
		
	}
	/**
	 * 새로운 파일정보를 SAMPLE_FILE_REPOSITORIES 테이블에 저장한다.
	 * @param fileItem
	 */
	public void insertFIleItem(FileItem fileItem) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertFIleItem", fileItem);
		session.close();
	}

}
