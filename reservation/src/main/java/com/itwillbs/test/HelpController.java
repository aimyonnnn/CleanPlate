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

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.test.service.HelpService;
import com.itwillbs.test.vo.QNAVO;

@Controller
public class HelpController {
	
	@Autowired
	HelpService service;

	@GetMapping("helpHome")
	public String helpHome(@RequestParam(defaultValue = "1")int index, Model model) {
		
		return "help/help_home";
	}
	
	//QNA 페이지로 이동
	@GetMapping("QNA")
	public String QNA(HttpSession session, Model model) {
		
		String id = "";
		
		if(session.getAttribute("sId")==null && session.getAttribute("cId") == null) {
			model.addAttribute("msg","로그인시 접근이 가능합니다.");
			return "fail_back";
		} else if(session.getAttribute("sId") != null) {
			id = (String)session.getAttribute("sId");
		} else {
			id = (String)session.getAttribute("cId");
		}
		
		List<QNAVO> QNAList = service.getQNAList(id); 
		
		model.addAttribute("QNAList",QNAList);
		
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

		
		String id = "";
		
		if(session.getAttribute("sId")==null && session.getAttribute("cId") == null) {
			model.addAttribute("msg","로그인시 접근이 가능합니다.");
			return "fail_back";
		} else if(session.getAttribute("sId") != null) {
			id = (String)session.getAttribute("sId");
		} else {
			id = (String)session.getAttribute("cId");
		}
		
		
		String uploadDir = "resources/upload";
		
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
		
			MultipartFile mFile = qna.getFile();
			
			String uuid = UUID.randomUUID().toString();
			
			qna.setQ_file("");
			
			String fileName = uuid.substring(0,8)+"_"+mFile.getOriginalFilename();
			
			if(!mFile.getOriginalFilename().equals("")) {
				qna.setQ_file(fileName);
			}
		
		int insertCount = service.registQNA(qna, id);
		
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
}
