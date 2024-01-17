package com.freeeat.member.model.dao;

import static com.freeeat.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.freeeat.common.JDBCTemplate;
import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.member.model.vo.Member;
import com.freeeat.place.model.dao.PlaceDao;

public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = PlaceDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	여기부터 로그인 
	public Member loginMember(Connection conn, String memId, String memPwd){
		
		Member loginMem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			rset =pstmt.executeQuery();
			
			
			System.out.println("으아");
			if(rset.next()) {
				
				loginMem = new Member(rset.getInt("MEM_NO"),
									   rset.getString("MEM_ID"),
									   rset.getString("MEM_PWD"),
									   rset.getString("MEM_NICKNAME"),
									   rset.getString("MEM_PHONE"),
									   rset.getString("MEM_BIRTH").substring(0,10),
									   rset.getString("MEM_EMAIL"),
									   rset.getString("MEM_TYPE"),
									   rset.getString("MEM_RESIDENCE"),
									   rset.getString("MEM_ENROLLDATE"),
									   rset.getString("MEM_STATUS"),
									   rset.getString("MEM_PROFILE_OG"),
									   rset.getString("MEM_PROFILE_REVISE"),
									   rset.getString("MEM_PROFILE_SAVEPATH")
									
						);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		
		return loginMem;
		
	}
	
	public int insertMember(Connection conn, Member loginMem) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, loginMem.getMemId());
			pstmt.setString(2, loginMem.getMemNickName());
			pstmt.setString(3, loginMem.getMemPwd());
			pstmt.setString(4,loginMem.getPhone());
			pstmt.setString(5, loginMem.getBirthDate());
			pstmt.setString(6, loginMem.getEmail());
			pstmt.setString(7, loginMem.getType());
			pstmt.setString(8, loginMem.getResidence());
			
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public int updateMember(Connection conn, Member loginMem) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, loginMem.getMemNickName());
			pstmt.setString(2, loginMem.getPhone());
			pstmt.setString(3, loginMem.getMemPwd());
			pstmt.setString(4, loginMem.getEmail());
			pstmt.setString(5, loginMem.getType());
			pstmt.setString(6, loginMem.getMem_profileOG());
			pstmt.setString(7, loginMem.getMem_profileRevise());
			pstmt.setString(8, loginMem.getMem_profile_savePath());
			pstmt.setString(9, loginMem.getMemId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	
	}
	
	public Member selectMember(Connection conn, String memId) {
		
		Member loginMem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginMem = new Member(rset.getInt("MEM_NO"),	
							   rset.getString("MEM_ID"),
							   rset.getString("MEM_PWD"),
							   rset.getString("MEM_NICKNAME"),
							   rset.getString("MEM_PHONE"),
							   rset.getString("MEM_BIRTH").substring(0,10),
							   rset.getString("MEM_EMAIL"),
							   rset.getString("MEM_TYPE"),
							   rset.getString("MEM_RESIDENCE"),
							   rset.getString("MEM_ENROLLDATE"),
							   rset.getString("MEM_STATUS"),
							   rset.getString("MEM_PROFILE_OG"),
							   rset.getString("MEM_PROFILE_REVISE"),
							   rset.getString("MEM_PROFILE_SAVEPATH")
						
							   
							   );
								
			}
			
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return loginMem;
		
	}
	
	
	public int deleteMember(Connection conn, String memId) {
		// STATUS = 'Y'  => STATUS = 'N'
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		// SELECT문 => ResultSet => COUNT함수(숫자한개)
		// SELECT COUNT(*) FROM MEMBER WHERE USER_ID = ?
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		System.out.println(checkId);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	
	
	}
	
	public int nickNameCheck(Connection conn, String memNickName) {
		// SELECT문 => ResultSet => COUNT함수(숫자한개)
		// SELECT COUNT(*) FROM MEMBER WHERE USER_ID = ?
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nickNameCheck");
		
		System.out.println("dao"+memNickName);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memNickName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	
	
	}
	//로그인 끝
	
	//-------------------------------------------------------------
	// 관리자 - 회원 조회 기능
	//-------------------------------------------------------------	
	
	public int selectMemberListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Member> selectMemberList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member mem = new Member();
				mem.setMemNo(rset.getInt("MEM_NO"));
				mem.setMemId(rset.getString("MEM_ID"));
				mem.setMemNickName(rset.getString("MEM_NICKNAME"));
				mem.setPhone(rset.getString("MEM_PHONE"));
				mem.setBirthDate(rset.getString("MEM_BIRTH").substring(0, 10));
				mem.setEmail(rset.getString("MEM_EMAIL"));
				mem.setType(rset.getString("MEM_TYPE"));
				mem.setResidence(rset.getString("MEM_RESIDENCE"));
				mem.setEnrollDate(rset.getString("MEM_ENROLLDATE").substring(0, 10));
				mem.setStatus(rset.getString("MEM_STATUS"));
	            list.add(mem);			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
	}
	
	
	public int selectMemberNListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberNListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;	
		
	}
	
	
	public ArrayList<Member> selectMemberNList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member mem = new Member();
				mem.setMemNo(rset.getInt("MEM_NO"));
				mem.setMemId(rset.getString("MEM_ID"));
				mem.setMemNickName(rset.getString("MEM_NICKNAME"));
				mem.setPhone(rset.getString("MEM_PHONE"));
				mem.setBirthDate(rset.getString("MEM_BIRTH").substring(0, 10));
				mem.setEmail(rset.getString("MEM_EMAIL"));
				mem.setType(rset.getString("MEM_TYPE"));
				mem.setResidence(rset.getString("MEM_RESIDENCE"));
				mem.setEnrollDate(rset.getString("MEM_ENROLLDATE").substring(0, 10));
				mem.setStatus(rset.getString("MEM_STATUS"));
	            list.add(mem);			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;		
	}
	
	
	public int[] selectTypeValues(Connection conn) {
		String[] type = {"비건", "락토프리", "슈가프리", "글루텐프리", "동물복지"};
		int[] typeValues = new int[5]; // '비건', '락토프리', '슈가프리', '글루텐프리', '동물복지'
		ArrayList<String> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTypeValues");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(rset.getString("MEM_TYPE"));
			}
			
			for(String str : list) {
				String[] strArr = str.split(",");
				for(int i = 0; i < strArr.length; i++) {
					for (int j = 0; j < type.length; j++) {
						if (type[j].equals(strArr[i])) {
							typeValues[j]++;
							break; 
						}
					}
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return typeValues;
	}
	
	
	public int[] selectResidenceValues(Connection conn) {
		int[] residenceValues = new int[8];
		String[] residence = {"서울", "인천", "경기", "강원", "충청", "전라", "경상", "제주"};
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectResidenceValues");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				for(int i = 0; i < residence.length; i++) {
					if(residence[i].equals(rset.getString("MEM_RESIDENCE"))) {
						residenceValues[i] = rset.getInt("COUNT(*)");
						break;
					}
				}				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return residenceValues;
	}
	
	
	public int[] selectAgeValues(Connection conn) {
		int[] ageValues = new int[6];
		String[] age = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAgeValues");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				for(int i = 0; i < age.length; i++) {
					if(age[i].equals(rset.getString("연령"))) {
						ageValues[i] = rset.getInt("합계");
					}
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ageValues;
	}
	
	// 날짜별 가입 회원 수 조회
		public ArrayList selectMemEnrollDate(Connection conn, String date) {
			ArrayList dateValues = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMemEnrollDate");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, date);
				pstmt.setString(2, date);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					dateValues.add(rset.getString("MEM_ENROLLDATE").substring(0, 10));
					dateValues.add(rset.getString("COUNT(*)"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}		
			
			return dateValues;
		}
	//성경 끝
	
	
	
	
}
