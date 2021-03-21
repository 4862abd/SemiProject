package com.kr.semiProject.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.kr.semiProject.board.model.BoardVO;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rset;

	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/pool01");
		return ds.getConnection();
	}
	
	//전체 게시글의 갯수를 리턴하는 메소드 
	public int getAllCount(){
		int count = 0;
		
		try {
			//쿼리 준비 
			conn = getConnection();
			String sql ="SELECT COUNT(*) FROM SEMI_BOARD";
			pstmt =conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				count = rset.getInt(1);
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return count;
		
	}
	
	
	//모든 화면에 보여질 데이터 10개씩 추출해서 리턴하는 매소드
	public Vector<BoardVO> getAllBoard(int startRow , int endRow){
		Vector<BoardVO> v = new Vector<>();
		
		try {
			conn = getConnection();
			//쿼리 준비 
			String SQL = "select * from (select A.* ,Rownum Rnum from (select *from SEMI_BOARD order by ref desc ,re_stop asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
			
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
			//쿼리를 실행후 결과를 저장
			rset = pstmt.executeQuery();
			
			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출 
			while(rset.next()){
				 //데이터를 패키징(가방 = Boardbean클래스를 이용)해줌
				 BoardVO bean = new BoardVO();
				 bean.setNum(rset.getInt(1));
				 bean.setWrite(rset.getString(2));
				 bean.setEmail(rset.getString(3));
				 bean.setSubject(rset.getString(4));
				 bean.setPassword(rset.getString(5));
				 bean.setReg_date(rset.getDate(6).toString());
				 bean.setRef(rset.getInt(7));
				 bean.setRe_stop(rset.getInt(8));
				 bean.setRe_level(rset.getInt(9));
				 bean.setReadcount(rset.getInt(10));
				 bean.setContent(rset.getString(11));

				 //패키징한 데이터를 벡터에 저장 
				 v.add(bean);
			 }
			conn.close();
			
			}catch(Exception e) {
				e.printStackTrace();	
			}	
			return v;
	}
	
	
	public void insertBoard(BoardVO bean) {
		
		//빈 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		int ref = 0;// 글 그룹을 의미 = 쿼리를 실행시켜 가장큰 ref 값을 가져온후 +1을 더해주면 된다 
		int re_stop = 1;//새글이기에 = 부모 글이기에
		int re_level = 1;
		try {
			conn = getConnection();
			//가장큰 ref값을 읽어오는 쿼리 준비 
			String refSQL = "SELECT MAX(REF) FROM SEMI_BOARD";
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(refSQL);
			//쿼리를 실행후 결과를 리턴
			rset = pstmt.executeQuery();	
			if(rset.next()){//결과 값이 있다면
				ref = rset.getInt(1)+1;//최대 값에 +1을 더해서 글 그룹을 설정	
			}
			//실제로 게시글 전체값을 테이블에 저장 
			String SQL = "INSERT INTO SEMI_BOARD VALUES(BOARD_SEQ.NEXTVAL,?,?,?,?,SYSDATE,?,?,?,0,?)";
			pstmt = conn.prepareStatement(SQL);
			//?의 값을 맵핑
			pstmt.setString(1, bean.getWrite());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_stop);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			//쿼리를 실행하시오
			pstmt.executeUpdate();	
			//자원 반납
			conn.close();
			}catch(Exception e) {
				e.printStackTrace();	
			}	
	}
	
	
	//BoardInfo 하나의 게시글 리턴하는 메소드
	public BoardVO getOneBoard(int num){	
		//리턴 타입 선언
		BoardVO bean = new BoardVO();
		
		try {
			conn = getConnection();
			//조회수 증가 쿼리 
			String readsql = "UPDATE SEMI_BOARD SET READCOUNT = READCOUNT+1 WHERE NUM=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();	
				
			//쿼리준비
			String SQL = "SELECT * FROM SEMI_BOARD WHERE NUM=?";
			//쿼리실행객체 
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,num);
			//쿼리 실행후 결과를 리턴
			rset= pstmt.executeQuery();
				
			if(rset.next()) {
				bean.setNum(rset.getInt(1));
				bean.setWrite(rset.getString(2));
				bean.setEmail(rset.getString(3));
				bean.setSubject(rset.getString(4));
				bean.setPassword(rset.getString(5));
				bean.setReg_date(rset.getDate(6).toString());
				bean.setRef(rset.getInt(7));
				bean.setRe_stop(rset.getInt(8));
				bean.setRe_level(rset.getInt(9));
				bean.setReadcount(rset.getInt(10));
				bean.setContent(rset.getString(11));
				}
				
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return bean;
		}
	
	
	//답변글이 저장되는 메소드 
	public void reWriteBoard(BoardVO bean){
		//부모글 그룹과 글레벨 글 스템을 읽어드림 
		int ref =bean.getRef();
		int re_stop = bean.getRe_stop();
		int re_level = bean.getRe_level();
		
		try {
			/////////////////////핵심 코드 //////////////////////// 
				conn = getConnection();
				//부모글 보다 큰 re_level의 값을 전부 1씩 증가시켜줌 
				String  levelsql = "UPDATE SEMI_BOARD SET RE_LEVEL=RE_LEVEL+1 WHERE REF=? AND RE_LEVEL > ?";
				//쿼리 삽입 객체 선언 
				pstmt = conn.prepareStatement(levelsql);
				pstmt.setInt(1 , ref);
				pstmt.setInt(2 , re_level);
				//쿼리 실행 
				pstmt.executeUpdate();
				//답변글 데이터를 저장
				String sql ="INSERT INTO SEMI_BOARD VALUES(BOARD_SEQ.NEXTVAL,?,?,?,?,SYSDATE,?,?,?,0,?)";
				pstmt = conn.prepareStatement(sql);
				//?에 값을 대입
				pstmt.setString(1, bean.getWrite());
				pstmt.setString(2, bean.getEmail());
				pstmt.setString(3, bean.getSubject());
				pstmt.setString(4, bean.getPassword());
				pstmt.setInt(5, ref);//부모의 ref 값을 넣어줌 
				pstmt.setInt(6, re_stop+1);//답글이기에 부모글 re_stop에 1을 넣어줌 
				pstmt.setInt(7, re_level + 1);
				pstmt.setString(8, bean.getContent());
				
				//쿼리를 실행하시오
				pstmt.executeUpdate();	
				conn.close();
				
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//Boardupdate용 Delete시 하나의 게시글을 리턴
	public BoardVO getOneUpdateBoard(int num){	
		//리턴 타입 선언
		BoardVO bean = new BoardVO();
		
		try {
			conn = getConnection();
			//쿼리준비
			String SQL = "SELECT * FROM SEMI_BOARD WHERE NUM=?";
			//쿼리실행객체 
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,num);
			//쿼리 실행후 결과를 리턴
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				 bean.setNum(rset.getInt(1));
				 bean.setWrite(rset.getString(2));
				 bean.setEmail(rset.getString(3));
				 bean.setSubject(rset.getString(4));
				 bean.setPassword(rset.getString(5));
				 bean.setReg_date(rset.getDate(6).toString());
				 bean.setRef(rset.getInt(7));
				 bean.setRe_stop(rset.getInt(8));
				 bean.setRe_level(rset.getInt(9));
				 bean.setReadcount(rset.getInt(10));
				 bean.setContent(rset.getString(11));
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return bean;
	}
	
	
	//하나의 게시글을 수정하는 메소드
	public void updateBoard(int num ,String subject , String content){
			
		try {
			conn = getConnection();
			//쿼리 준비 
			String sql = "UPDATE SEMI_BOARD SET SUBJECT=? , CONTENT= ? WHERE NUM = ?";
				
			//쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			
			//?에 값을 대입 하기
			pstmt.setString(1,subject);
			pstmt.setString(2,content);
			pstmt.setInt(3,num);
			
			//쿼리 실행후 결과를 리턴
			pstmt.executeUpdate();
				
			//자원 반납
			conn.close();
					
		}catch(Exception e) {
			e.printStackTrace();
		}
	}  
	
	
	//하나의 게시글을 삭제하는 매소드
		public void deleteBoard(int num){
			
			try {
				conn = getConnection();
				//쿼리 준비 
				String sql = "DELETE FROM SEMI_BOARD WHERE NUM=?";
				
				//쿼리 실행할 객체 선언
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setInt(1,num);
				
				//쿼리 실행
				pstmt.executeUpdate();
				
				//자원 반납
				conn.close();
					
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
	   
}
