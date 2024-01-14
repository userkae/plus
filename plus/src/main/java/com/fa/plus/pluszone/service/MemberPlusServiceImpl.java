package com.fa.plus.pluszone.service;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.domain.MemberPlus;
import com.fa.plus.pluszone.mapper.MemberPlusMapper;
import com.fa.plus.mail.Mail;
import com.fa.plus.mail.MailSender;

@Service
public class MemberPlusServiceImpl implements MemberPlusService{
	@Autowired
	private MemberPlusMapper mapper;
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;

	@Override
	public void insertPlus(MemberPlus dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			
			// 패스워드 암호화
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			long memberSeq = mapper.memberSeq();
			dto.setMemberIdx(memberSeq);

			// 회원정보 저장
			mapper.insertPlus(memberSeq);

			mapper.insertPlus12(dto); // member1, member2 테이블 동시에
			
			
			// 권한 저장
			dto.setAuthority("USER");
			mapper.insertAuthority(dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateLastLogin(String userId) throws Exception {
		try {
			mapper.updateLastLogin(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMemberPlus(MemberPlus dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			
			// 패스워드가 변경된 경우만 member1 테이블의 패스워드를 변경하도록 변경해야함
			boolean bPwdUpdate =! isPasswordCheck(dto.getUserId(), dto.getUserPwd());
			if(bPwdUpdate) {
					// 패스워드가 변경된 경우
					String encPwd = bcryptEncoder.encode(dto.getUserPwd());
					
					dto.setUserPwd(encPwd);
					
					mapper.updatePlus1(dto);
			}
			
			mapper.updatePlus2(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}

	@Override
	public MemberPlus findById(String userId) {
		MemberPlus dto = null;
		
		try {
			dto = mapper.findById(userId);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public MemberPlus findByMemberIdx(long memberIdx) {
		MemberPlus dto = null;

		try {
			dto = mapper.findByMemberIdx(memberIdx);
			
			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public MemberPlus loginPlusMember(String userId) {
		MemberPlus dto = null;
		try {
			mapper.loginPlusMember(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
/*
	@Override
	public void generatePwd(MemberPlus dto) throws Exception {
		// 10 자리 임시 패스워드 생성
				StringBuilder sb = new StringBuilder();
				Random rd = new Random();
				String s = "!@#$%^&*~-+ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
				for (int i = 0; i < 10; i++) {
					int n = rd.nextInt(s.length());
					sb.append(s.substring(n, n + 1));
				}

				String result;
				result = dto.getUserId() + "님의 새로 발급된 임시 패스워드는 <b>"
						+ sb.toString()
						+ "</b> 입니다.<br>"
						+ "로그인 후 반드시 패스워드를 변경 하시기 바랍니다.";

				Mail mail = new Mail();
				mail.setReceiverEmail(dto.getEmail());

				mail.setSenderEmail("보내는사람이메일@도메인");
				mail.setSenderName("관리자");
				mail.setSubject("임시 패스워드 발급");
				mail.setContent(result);
				
				// DB 테이블 수정
				dto.setUserPwd(sb.toString());
				updatePwd(dto);
				
				boolean b = mailSender.mailSend(mail);

				if (! b) {
					throw new Exception("이메일 전송중 오류가 발생했습니다.");			
				}
		
	}
*/
	@Override
	public boolean isPasswordCheck(String userId, String userPwd) {
		// 패스워드 비교
		MemberPlus dto =findById(userId);
		if(dto == null) {
			return false;			
		}
		// 암호화되지 않은 패스워드, 암호화된 패스워드
		return bcryptEncoder.matches(userPwd, dto.getUserPwd());
	}

	@Override
	public void updatePwd(MemberPlus dto) throws Exception {
		try {
			if(isPasswordCheck(dto.getUserId(), dto.getUserPwd()))
				throw new RuntimeException("패스워드가 기존 패스워드와 일치합니다.");
			
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			mapper.updatePlus1(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int checkFailureCount(String userId) {
		int result = 0;
		try {
			result = mapper.checkFailureCount(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateFailureCount(String userId) throws Exception {
		try {
			mapper.updateFailureCount(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		try {
			mapper.updateFailureCountReset(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			mapper.updatePlusEnabled(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertMemberState(MemberPlus dto) throws Exception {
		try {
			mapper.insertPlusState(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public int noApprovedPlus() {
		int count = 0;
		try {
			count = mapper.noApprovedPlus();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int requestPlus() {
		int count = 0;
		try {
			count = mapper.requestPlus();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int approvedPlus() {
		int count = 0;
		try {
			count = mapper.approvedPlus();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	
}
