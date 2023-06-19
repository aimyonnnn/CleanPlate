//package com.itwillbs.test.handler;
//
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.jdbc.BadSqlGrammarException;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//
//@ControllerAdvice
//@Qualifier("ExceptionHandlerController")
//public class ExceptionHandlerController {
//	
//    @ExceptionHandler(BadSqlGrammarException.class)
//    public String handleBadSqlGrammarException(BadSqlGrammarException ex, Model model) {
//        String msg = "해당 테이블을 찾을 수 없습니다. 테이블을 생성해주세요";
//        model.addAttribute("msg", msg);
//        return "fail_back";
//    }
    
//    @ExceptionHandler(Exception.class)
//    public String handleException(Exception ex, Model model) {
//        String errorMessage = ex.getMessage();
//        model.addAttribute("errorMessage", errorMessage);
//        return "error_view";
//    }
    
    
//}
