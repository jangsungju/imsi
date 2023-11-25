package com.example.ex05.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ex05.domain.vo.Criteria;
import com.example.ex05.domain.vo.MemberDTO;
import com.example.ex05.domain.vo.MemberVO;
import com.example.ex05.domain.vo.PageDTO;
import com.example.ex05.domain.vo.SearchRequest;
import com.example.ex05.service.BoardService;
import com.example.ex05.service.MemberService;

import lombok.extern.log4j.Log4j;


/*
Task           URL            Method          Parameter               Form          URL이동

전체목록       /board/list        get           
 
등록처리       /board/register    post            모든항목                  입력화면 필요      이동 List페이지     
	
조회          /board/read        get           uNo, entrDate, uNm      
                                              jobRank   inoffiSts 
삭제          /board/remove      get           uNO                       입력화면필요    

수정          /board/modify      post            모든 항목                  입력화면필요      이동 List페이지 



//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	    dateFormat.setLenient(false);
//	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
//	}
	
	
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//	    binder.registerCustomEditor(Date.class, new CustomPropertyEditorSupport() {
//	        public void setAsText(String text) throws IllegalArgumentException {
//	            try {
//	                Date date = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(text).getTime());
//	                setValue(date);
//	            } catch(ParseException e) {
//	                throw new IllegalArgumentException(e);
//	            }
//	        }
//	    });
//	}



*/

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberService;
		
	@GetMapping("/main")
	public void main() {
		log.info("/main................");
	}
	
	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * log.info("/getlist................");
	 * 
	 * model.addAttribute("memberList", boardService.getList());
	 * 
	 * }
	 */
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	 public void list() {
		log.info("/listpage................");

	}

//	public String postList(Model model) {
//	    log.info("/listpage (POST)................");
//
//	    List<MemberDTO> memberList = memberService.search();
//	    model.addAttribute("memberList", memberList);
//
//	    return "list";
//	}

	@PostMapping("/search")
	@ResponseBody
	public List<MemberDTO> search(@RequestBody MemberDTO formData){
		
		log.info("검색관련 조건 : " + formData);
		
		
//	    안쓸꺼 뽑아서 뭐함	
//		String unm = formData.getUnm();
//		String jobSkill = formData.getJobSkill();
//		String inoffiSts = formData.getInoffiSts();
//		String startDate = formData.getStartDate();
//		String endDate = formData.getEndDate();
		
		
		List<MemberDTO> memberList = memberService.search(formData);
		
		
		int totalCount = memberService.getTotalCount(formData);// 전체 데이터 개수 조회
	    
	    log.info(" total :" + totalCount); //전체 데이터 개수 확인
	    
//	    Criteria criteria = new Criteria();
//	    int endPage = (int)(Math.ceil(criteria.getPageNum()/(double)criteria.getAmount())) * criteria.getAmount();
//	    int realEnd  = (int) Math.ceil( totalCount * 1.0 / criteria.getAmount());
//	    		
	    		
		/*
		// formData 여기안에 너가 위에서 뽑은것처럼 unm, jobSkill 등등의 값이 들어있고 그걸 method에 넘겨줘야 활용함
		if (unm == "" && jobSkill == "" && inoffiSts == "" && startDate == "" && endDate == "") {
			
			//									요기
			memberList = memberService.search(formData);
		} 
		
		*/
		
		return memberList;
	}
	
	
//	@PostMapping("/search")
//	@ResponseBody
//	public List<MemberDTO> search(@RequestBody SearchRequest searchRequest){
//		
//		log.info("/search...........................");
//	    log.info("검색정보 들어오냐????? : ");
//		
//		
//		 List<MemberDTO> searchResult = null;
//		 
//		 if (searchRequest == null) {
//		        searchResult = memberService.search();
//		    }
//		 log.info("Search result: {}");
//		    
//		    return searchResult;
////		    model.addAttribute("memberList", memberList);
//	}
	
	@PostMapping("/register")
	public String register(MemberVO memberVO, RedirectAttributes rttr) {
		
		log.info("/register : " + memberVO);
		boardService.register(memberVO);
		
		rttr.addFlashAttribute("uno", memberVO.getUno());

//		flash라는 영역은 session에 생기고, redirect로 전송 할 때 request영역이 초기화된다.
//		초기화 되기 전에 flash영역에 데이터를 저장해 놓고, 초기화된 후 flash영역에서 데이터를 가져온다.
//		데이터를 가져왔다면,flash영역에 있던 데이터는 사라진다.
	
//		redircet로 전송할 때는 경로 앞에 "redirect:를 붙여준다.
	return "redirect:/board/list";
	
	}
	
//	@GetMapping("/read")
//    public void read(Long uNo,Model model) {
//		log.info("/read : "+ uNo);
//		
//		model.addAttribute("member", boardService.get(uNo));
//		
//		
//	}
	
	@GetMapping({"/read","/modify"})
    public void read(Long uno,HttpServletRequest request,Model model) {
		
		String url = request.getRequestURI();
		log.info(url.substring(url.lastIndexOf("/")) + " : " + uno);
		
		model.addAttribute("member", boardService.get(uno));
		
		
		
	}
	
	@GetMapping("/remove")
	public String remove(Long uno,RedirectAttributes rttr) {
		
		log.info("/remove : " + uno);
		
		if(boardService.remove(uno)){
			
			rttr.addFlashAttribute("result", "success");
		
		}
				
		return "redirct:/board/list";
	}
	
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rttr) {
	    log.info("/modify : " + memberVO);

	    log.info("/modify birth : " + memberVO.getBirth());
	    log.info("/modify entrdate :" + memberVO.getEntrDate());
//	    // Use memberVO.getBirth() and memberVO.getEntrDate() directly as Date objects
//	    Date birthDate = memberVO.getBirth();
//	    Date entrDate = memberVO.getEntrDate();
//
//	    // Perform necessary logic using birthDate and entrDate
//	    // ...

	    if (boardService.modify(memberVO)) {
	        rttr.addFlashAttribute("result", "success");
	    }

	    return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register() {}
	
	
}
