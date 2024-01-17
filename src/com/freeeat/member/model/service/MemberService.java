package com.freeeat.member.model.service;

import static com.freeeat.common.JDBCTemplate.close;
import static com.freeeat.common.JDBCTemplate.commit;
import static com.freeeat.common.JDBCTemplate.getConnection;
import static com.freeeat.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.freeeat.common.JDBCTemplate;
import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.member.model.dao.MemberDao;
import com.freeeat.member.model.vo.Member;

	public class MemberService {
	

//	여기부터 로그인
		
		public Member loginMember(String memId, String memPwd) {
			
			// 1) Connection객체 생성
					Connection conn = getConnection();
					
			// 2) Controller에서 넘어온 전달값과 Connection객체를 가지고 DAO메소드 호출
			Member loginMem = new MemberDao().loginMember(conn, memId, memPwd);
					
			// 3) conn반납
			close(conn);
			
			//4)
			return  loginMem;
		}
		
		public int insertMember(Member loginMem) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new MemberDao().insertMember(conn, loginMem);
			
			if(result > 0) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result;

		}
		
		
		
		public Member updateMember(Member loginMem) {
			
			Connection conn = getConnection();
			
			int result = new MemberDao().updateMember(conn,loginMem);
			
			Member updateMem = null;
			
			if(result > 0) {
				commit(conn);
				updateMem = new MemberDao().selectMember(conn, loginMem.getMemId());
				
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			
			
			return updateMem;
		}
		
		public int deleteMember(String memId) {
			
			Connection conn = getConnection();
			
			int result = new MemberDao().deleteMember(conn, memId);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
			
		}
		
		public int idCheck(String checkId) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int count = new MemberDao().idCheck(conn, checkId);
			
			JDBCTemplate.close(conn);
			
			return count;
		}

		public int nickNameCheck(String memNickName) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int count = new MemberDao().nickNameCheck(conn, memNickName);
			
			JDBCTemplate.close(conn);
			
			return count;
		}
		
		
		
		//로그인 끝
		
		
		//여기부터 성경
		//-------------------------------------------------------------
		// 관리자 - 회원 조회 기능
		//-------------------------------------------------------------	
		
		public int selectMemberListCount() {
			Connection conn = getConnection();
			
			int listCount = new MemberDao().selectMemberListCount(conn);
			
			close(conn);
			
			return listCount;
		}
		
		public ArrayList<Member> selectMemberList(PageInfo pi) {
			Connection conn = getConnection();
			
			ArrayList<Member> list = new MemberDao().selectMemberList(conn, pi);
			
			close(conn);
			
			return list;
		}
		
		public int selectMemberNListCount() {
			
			Connection conn = getConnection();
			
			int listCount = new MemberDao().selectMemberNListCount(conn);
			
			close(conn);
			
			return listCount;
		}
		
		
		public ArrayList<Member> selectMemberNList(PageInfo pi) {
			Connection conn = getConnection();
			
			ArrayList<Member> list = new MemberDao().selectMemberNList(conn, pi);
			
			close(conn);
			
			return list;
		}
		
		public int[] selectTypeValues() {
			Connection conn = getConnection();
			
			int[] typeValues = new MemberDao().selectTypeValues(conn);
			
			close(conn);
			
			return typeValues;
		}
		
		public int[] selectResidenceValues() {
			Connection conn = getConnection();
			
			int[] residenceValues = new MemberDao().selectResidenceValues(conn);
			
			close(conn);
			
			return residenceValues;
		}
		
		public int[] selectAgeValues() {
			Connection conn = getConnection();
			
			int [] ageValues = new MemberDao().selectAgeValues(conn);
			
			close(conn);
			
			return ageValues;
		}
		
		// 날짜별 가입 회원 수 조회
		public ArrayList selectMemEnrollDate(String date) {
			Connection conn = getConnection();
			
			ArrayList dateValues = new MemberDao().selectMemEnrollDate(conn, date);
			
			close(conn);		
			
			return dateValues;
		}
		//성경끝


}
