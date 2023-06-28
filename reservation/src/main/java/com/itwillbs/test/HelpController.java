package com.itwillbs.test;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.test.service.HelpService;
import com.itwillbs.test.vo.NoticeVO;
import com.itwillbs.test.vo.PageInfoVO;
import com.itwillbs.test.vo.QNAVO;

@Controller
public class HelpController {
	
	@Autowired
	HelpService service;
	
	//QNA 페이지로 이동
	@GetMapping("QNA")
	public String QNA(@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String searchKeyword, 
			@RequestParam(defaultValue = "1") int pageNum,HttpSession session, Model model) {
		
		String sid = "";
		String cid = "";
		
		if(session.getAttribute("sId")==null && session.getAttribute("cId") == null) {
			model.addAttribute("msg","로그인시 접근이 가능합니다.");
			return "fail_back";
		} else if(session.getAttribute("sId") != null) {
			sid = (String)session.getAttribute("sId");
		} else {
			cid = (String)session.getAttribute("cId");
		}
		
		
		int listLimit = 10; // 한 페이지에서 표시할 목록 수
		int StartRow = (pageNum - 1) * listLimit; // 조회 시작 행 번호
		List<QNAVO> QNAList;
		int listCount;
		if(!sid.equals("")) {
			QNAList = service.getQNAMemberList(sid, searchType, searchKeyword, StartRow, listLimit); // 게시물 목록 조회 요청
			listCount = service.getQnaListCount(sid, searchType, searchKeyword); // 전체 게시물 수 조회 요청 
		} else {
			QNAList = service.getQNACeoList(cid, searchType, searchKeyword, StartRow, listLimit); // 게시물 목록 조회 요청
			listCount = service.getQnaCeoListCount(cid, searchType, searchKeyword); // 전체 게시물 수 조회 요청 
		}
		
		int pageListLimit = 3; // 페이지 개수 제한
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); // 최대 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 시작 페이지
		int endPage = startPage + pageListLimit - 1; // 끝 페이지\
		
		if(maxPage < endPage) { // 끝 페이지가 전체보다 클 경우 끝 페이지로 교체  
			endPage = maxPage;
		}
		
		PageInfoVO pageInfo = new PageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("QNAList",QNAList);
		model.addAttribute("pageNum",pageNum);
		
		return "help/help_qa";
	}
	
	//QNA 작성 페이지로 이동
	@GetMapping("QNABoard")
	public String QNABoard(HttpSession session, Model model, QNAVO qna) {
		
		if(session.getAttribute("sId")==null && session.getAttribute("cId") == null) {
			model.addAttribute("msg","로그인시 접근이 가능합니다.");
			return "fail_back";
		} 
		
		
		return "help/help_qa_2";
	}
	
	//QNA 작성시 db에 저장
	@PostMapping("QNABoardPro")
	public String QNABoardPro(HttpSession session, Model model, QNAVO qna) {

		
		String sid = "";
		String cid = "";
		
		if(session.getAttribute("sId")==null && session.getAttribute("cId") == null) {
			model.addAttribute("msg","로그인시 접근이 가능합니다.");
			return "fail_back";
		} else if(session.getAttribute("sId") != null) {
			sid = (String)session.getAttribute("sId");
		} else {
			cid = (String)session.getAttribute("cId");
		}
		
		
		String uploadDir = "/resources/upload";
		
		//실제 저장 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		
		String subDir = ""; //서브디렉토리(날짜구분하여 저장)
		// 설정한 날짜별로 파일 생성
		
		try {
		//오늘날짜 가져옴
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		//sdf 로 설정된 date 를 subDir 에 저장
		subDir = sdf.format(date);
		saveDir += "/" + subDir;
		
		Path path = Paths.get(saveDir);
		
		//실제 경로에 존재하지 않는 파일을 생성한다.
		
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
			MultipartFile mFile = qna.getFile();
			
			String uuid = UUID.randomUUID().toString();
			
			qna.setQ_file("");
			
			String fileName = uuid.substring(0,8)+"_"+mFile.getOriginalFilename();
			
			if(!mFile.getOriginalFilename().equals("")) {
				qna.setQ_file(subDir + "/" + fileName);
			}
			
		int insertCount;
		if(!sid.equals("")) {
			insertCount = service.registQNA(qna, sid);
		} else {
			insertCount = service.registCeoQNA(qna, cid);
		}
		
		if(insertCount > 0) {
			
			if(!mFile.getOriginalFilename().equals("")) {
				try {
					mFile.transferTo(new File(saveDir,fileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		return "redirect:QNA";
	}
	
	@PostMapping("QNAAnswer")
	public String QNAAnswer(QNAVO qna, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		if(!id.equals("admin")) {
			model.addAttribute("msg","잘못된 접근입니다.");
			return "fail_back";
		}
		
		int updateCount = service.QnaAnswer(qna);
		
		if(updateCount > 0) {
			
			return "redirect:QNA";
		}
		
		model.addAttribute("msg","답변실패");
		return "fail_back";
		
	}
	
	// FAQ 회원
	@GetMapping("FAQ")
	public String faqMember() {
		return "help/help_fq";
	}
	// FAQ 점주
	@GetMapping("FAQ2")
	public String faqOwner() {
		return "help/help_fq_2";
	}
	// 회원가입양식 확인
	@GetMapping("registrationForm")
	public String registrationForm() {
		return "help/registrationForm";
	}
	
	// Notice 페이지로 이동
	@GetMapping("Notice")
	public String notice(@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String searchKeyword, 
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		// 페이징 처리
		int listLimit = 5; // 한 페이지에서 표시할 목록 수
		int StartRow = (pageNum - 1) * listLimit; // 조회 시작 행 번호
		List<NoticeVO> noticeList = service.getNoticeList(searchType, searchKeyword, StartRow, listLimit); // 게시물 목록 조회 요청
		int listCount = service.getNoticeListCount(searchType, searchKeyword); // 전체 게시물 수 조회 요청 
		
		int pageListLimit = 3; // 페이지 개수 제한
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); // 최대 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 시작 페이지
		int endPage = startPage + pageListLimit - 1; // 끝 페이지
		
		if(maxPage < endPage) { // 끝 페이지가 전체보다 클 경우 끝 페이지로 교체  
			endPage = maxPage;
		}
		
		PageInfoVO pageInfo = new PageInfoVO(listCount, pageListLimit, startPage, maxPage, endPage);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "help/help_home";
	}
	
	// Notice 작성 페이지로 이동 - 관리자만 가능
	@GetMapping("NoticeBoard")
	public String noticeBoard(HttpSession session, Model model, NoticeVO notice) {
		
		// 아이디가 관리자가 아닐 경우
		if(!session.getAttribute("sId").equals("admin")) {
			model.addAttribute("msg","관리자만 접근이 가능합니다.");
			return "fail_back";
		} 
		
		return "help/help_notice_form";
	}
	
	// Notice 작성 후 등록 
	@PostMapping("NoticeBoardPro")
	public String noticeBoardPro(HttpSession session, Model model, NoticeVO notice) {
		
		// 아이디가 관리자가 아닐 경우 
		if(!session.getAttribute("sId").equals("admin")) {
			model.addAttribute("msg","관리자만 접근이 가능합니다.");
			return "fail_back";
		} 
		
		String uploadDir = "/resources/upload";
		
		//실제 저장 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		String subDir = ""; //서브디렉토리(날짜구분하여 저장)
		// 설정한 날짜별로 파일 생성
		
		try {
			//오늘날짜 가져옴
			Date date = new Date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
			
			//sdf 로 설정된 date 를 subDir 에 저장
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			
			Path path = Paths.get(saveDir);
			
			//실제 경로에 존재하지 않는 파일을 생성한다.
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MultipartFile mFile = notice.getFile();
		
		String uuid = UUID.randomUUID().toString();
		
		notice.setNo_file("");
		
		String fileName = uuid.substring(0,8)+"_"+mFile.getOriginalFilename();
		
		if(!mFile.getOriginalFilename().equals("")) {
			notice.setNo_file(subDir + "/" + fileName);
		}
		
		int insertCount = service.registNotice(notice);
		
		if(insertCount > 0) {
			try {
				if(!mFile.getOriginalFilename().equals("")) {
					mFile.transferTo(new File(saveDir, fileName));
				} 
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			return "redirect:/Notice";
		} else { // 실패
			model.addAttribute("msg", "글 등록 실패!");
			return "fail_back";
		}
	}
	
	// 공지 글 상세정보 조회
	@GetMapping("NoticeDetail")
	public String noticeDetail(@RequestParam int no_idx, Model model) {
		
		// 글 조회 요청
		NoticeVO notice = service.getNotice(no_idx);
		
		model.addAttribute("notice", notice);
		
		return "help/help_notice_view";
	}
	
	// 공지 글 수정 폼으로 이동
	@GetMapping("NoticeModifyForm")
	public String noticeModifyForm(@RequestParam int no_idx, 
			@RequestParam(defaultValue = "1") int pageNum, 
			HttpSession session, Model model) {
		
		// 아이디가 관리자가 아닐 경우 
		if(!session.getAttribute("sId").equals("admin")) {
			model.addAttribute("msg","관리자만 접근이 가능합니다.");
			return "fail_back";
		} 
		
		// 공지 게시글 조회 
		NoticeVO notice = service.getNotice(no_idx);
		model.addAttribute("notice", notice);
		
		return "help/help_notice_modify";
	}
	
	@PostMapping("NoticeModifyPro")
	public String noticeModifyPro(NoticeVO notice, 
			@RequestParam(defaultValue = "1") int pageNum, 
			HttpSession session, 
			Model model, HttpServletRequest request) {
		
		// 아이디가 관리자가 아닐 경우 
		if(!session.getAttribute("sId").equals("admin")) {
			model.addAttribute("msg","관리자만 접근이 가능합니다.");
			return "fail_back";
		} 
		
		String uploadDir = "/resources/upload"; 
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		String subDir = ""; // 서브디렉토리(날짜 구분)
		
		try {
			Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			// --------------------------------------------------------------
			Path path = Paths.get(saveDir);
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile = notice.getFile();
		
		String uuid = UUID.randomUUID().toString();
		notice.setNo_file("");
		
		String fileName = uuid.substring(0, 8) + "_" + mFile.getOriginalFilename();
		
		if(!mFile.getOriginalFilename().equals("")) {
			notice.setNo_file(subDir + "/" + fileName);
		}
		
		System.out.println("실제 업로드 파일명1 : " + notice.getNo_file());
		
		int updateCount = service.modifyNotice(notice); // 글 수정
		
		// 글 수정 작업 요청 결과 판별
		if(updateCount > 0) { // 성공
			try {
				if(!mFile.getOriginalFilename().equals("")) {
					mFile.transferTo(new File(saveDir, fileName));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 수정 작업 성공 시 글 글 상세정보 조회로 리다이렉트
			return "redirect:/Notice?no_idx=" + notice.getNo_idx() + "&pageNum=" + pageNum;
		} else { // 실패
			model.addAttribute("msg", "글 수정 실패!");
			return "fail_back";
		}
	}
	
	// 글삭제
	@GetMapping("NoticeDelete")
	public String noticeDelete(@RequestParam int no_idx, 
			@RequestParam(defaultValue = "1") int pageNum, 
			HttpSession session, Model model) {
		
		// 아이디가 관리자가 아닐 경우 
		if(!session.getAttribute("sId").equals("admin")) {
			model.addAttribute("msg","관리자만 접근이 가능합니다.");
			return "fail_back";
		} 
		
		int deleteCount = service.removeNotice(no_idx); // 공지글 삭제
		
		if(deleteCount == 0) {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		} 
		
		return "redirect:/Notice?pageNum=" + pageNum;
	}
	
	@GetMapping("DeleteQna")
	public String DeleteQna(@RequestParam int q_idx, HttpSession session, Model model) {
		
		if(session.getAttribute("sId") == null && session.getAttribute("cId") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		String id="";
		
		if(session.getAttribute("sId") != null) {
			id = service.getQnaMemberInfo(q_idx);
		} else {
			id = service.getQnaCeoInfo(q_idx);
		}
		
		if(!session.getAttribute("sId").equals(id) && !session.getAttribute("cId").equals(id)) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int deleteCount = service.removeQNA(q_idx);
		
		if(deleteCount <= 0) {
			model.addAttribute("msg", "삭제 실패.");
			return "fail_back";
		}
		
		
		return "redirect:QNA";
		
	}
	
	
}
