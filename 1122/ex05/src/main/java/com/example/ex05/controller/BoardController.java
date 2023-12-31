package com.example.ex05.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberProjectDTO;
import com.example.ex05.domain.member.vo.MemberSearchConditionDTO;
import com.example.ex05.domain.member.vo.MemberVO;
import com.example.ex05.member.service.BoardService;
import com.example.ex05.member.service.MemberService;
import com.example.ex05.menu.vo.MenuDTO;
import com.example.ex05.sha.UserSha256;

import lombok.extern.log4j.Log4j;


/*
Task           URL            Method          Parameter               Form          URL이동

전체목록       /board/list        get           
 
등록처리       /board/register    post            모든항목                  입력화면 필요      이동 List페이지     
	
조회          /board/read        get           uNo, entrDate, uNm      
                                              jobRank   inoffiSts 
삭제          /board/remove      get           uNO                       입력화면필요    

수정          /board/modify      post            모든 항목                  입력화면필요      이동 List페이지 



*/

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDTO memberDTO;
	
	@Autowired
	private MemberProjectDTO memberProjectDTO;
	
	@RequestMapping("/main")
	public void main(HttpSession session, Model model) {
		log.info("/main................");
		
		 // 세션에서 사용자 정보 가져오기
	    long uno = (long)session.getAttribute("uno");
	    String authoNo = (String) session.getAttribute("authoNo");
	    String unm = (String) session.getAttribute("unm");
	    
	    // 세션에서 메뉴 항목 리스트 가져오기
	    List<MenuDTO> menuItems = (List<MenuDTO>) session.getAttribute("menuItems");
	    
	    
	    // 필요한 경우, 사용자 정보를 기반으로 추가 처리 수행
//	    if (uno != null) {
//	        // 예: 사용자 권한에 따라 특정 데이터를 모델에 추가
//	        // 예: 사용자의 상세 정보를 데이터베이스에서 조회
//	    } else {
//	        // 사용자가 로그인하지 않았을 경우의 처리
//	        // 예: 로그인 페이지로 리디렉션
//	    }
		
	}

	
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public void list() {
	    log.info("/listpage................");

	}

//	public String postList(Model model) {
//	    log.info("/listpage (POST)................");
//
//	    List<MemberDTO> memberList = memberService.search();
//	    model.addAttribute("memberList", memberList);
//	 @RequestParam(name = "amount", defaultValue = "10") int amount,
//	   @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
//	   @RequestParam(name = "inoffiSts", defaultValue = "") String inoffiSts,
//	   @RequestParam(name = "unm", defaultValue ="") String unm,
//	   @RequestParam(name = "jobRank",defaultValue ="") String jobRank,
//	   @RequestParam(name = "startDate",defaultValue ="") String startDate,
//	   @RequestParam(name = "endDate",defaultValue ="") String endDate,
// Model model
//	
//	// 필요한 정보를 model에 담아서 view로 전달
// model.addAttribute("amount", amount);
// model.addAttribute("pageNum", pageNum);
// model.addAttribute("inoffiSts", inoffiSts);
// model.addAttribute("startDate", startDate);
// model.addAttribute("endDate", endDate);
//	
//	
// return "/board/list";
	
	
	
//
//	    return "list";
//	}

	@PostMapping("/search")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> search(@RequestBody MemberDTO dataForm){
		
		
		Map<String, Object> map = new HashMap<>();
		log.info("검색관련 조건 : " + dataForm);
		
		
		memberDTO.setPageNum(dataForm.getPageNum());
		memberDTO.setAmount(dataForm.getAmount());
		
		log.info("=====================처음 시작 할때 설정된 pageNum :===================================" + memberDTO.getPageNum());
		
		List<MemberDTO> memberList = memberService.search(dataForm);
		map.put("memberList", memberList);
		
		int totalCount = memberService.getTotalCount(dataForm);// 전체 데이터 개수 조회
		
		memberDTO.setTotalCount(totalCount);
   
		int pageSize = dataForm.getAmount();
		int pagingSize = 10;
		
		// 1/10.0 =  0.1 math =  1 *10 = 10  , 14/10.0 = 1.4 =  math 2 *10 = 20 
	    int endPage = ((int) Math.ceil(memberDTO.getPageNum() / (double)pagingSize)) * pagingSize;
	    // 10 - (10-1) = 1 1페이지 시작
	    int startPage = endPage - (pagingSize - 1);
	    // 136 /10 = 13... 음 안되 14페이지까지 나와야함  136.0 /10 13.6 = 14
	    int realEnd = (int) Math.ceil(totalCount / (double) pageSize);//최대 페이지 갯수 토탈페이지
	    
	    boolean prev = startPage > 1;
	    
	    boolean next = endPage < realEnd;
	    	    
	    //1~10 1단위 이전과 다음 버튼은 10페이지씩 넘어가게 한다
		//11~20
		//20~30
		//...이전단위가 있을경우 1은 없음
	    if (realEnd < endPage) {
	    	//다음 단위가 있을경우 
	        endPage = realEnd;
	    
	    }
	    //조금더 구현해 보고 싶은거 한페이지에 5개씩 정보가 뿌려지지만 번호는 1 2 3 4 5 ...10까지 나오게 하기

	    memberDTO.setPageNum(memberDTO.getPageNum());
        
	    int pageNum= memberDTO.getPageNum();
	    
		log.info("=====================이거는 이제 한번 갔다왔을때 pageNum :===================================" + memberDTO.getPageNum());
	    
	    memberDTO.setStartPage(startPage);
	    memberDTO.setEndPage(endPage);
	    memberDTO.setRealEnd(realEnd);
	    memberDTO.setPrev(prev);
	    memberDTO.setNext(next);
	    
		    
	    log.info("dataForm===============================================" + dataForm);
	        
	    
	    log.info("total: " + totalCount); // 전체 데이터 개수 확인
	    
	    map.put("totalCount", totalCount);
	    map.put("endPage", endPage);
	    map.put("startPage", startPage);
	    map.put("realEnd", realEnd);
	    map.put("prev", prev);
	    map.put("next", next);
        map.put("pageNum", pageNum);
        map.put("realEnd", realEnd);
	    
        return new ResponseEntity<>(map, HttpStatus.OK);
	
	}
		

	
	@PostMapping("/register")
	public String register(MemberVO memberVO, RedirectAttributes rttr) {
		
		log.info("/register : " + memberVO);
		String pwd = memberVO.getPwd();
		
		String encryptedPassword = UserSha256.encrypt(pwd);
		log.info("==sha256=== :"+encryptedPassword);
		memberVO.setPwd(encryptedPassword);
		boardService.register(memberVO);
		boardService.authorityRegister(memberVO.getUId());
		
		rttr.addFlashAttribute("uno", memberVO.getUno());
		rttr.addFlashAttribute("amount", memberDTO.getAmount());
		rttr.addFlashAttribute("pageNum", memberDTO.getPageNum());
		rttr.addFlashAttribute("inoffiSts", memberDTO.getInoffiSts());
		rttr.addFlashAttribute("jobSkill", memberDTO.getJobSkill());
		rttr.addFlashAttribute("unm", memberDTO.getUnm());
		rttr.addFlashAttribute("startDate", memberDTO.getStartDate());
		rttr.addFlashAttribute("endDate", memberDTO.getEndDate());
		rttr.addFlashAttribute("msg","등록이 완료 되었습니다.");
		

//		flash라는 영역은 session에 생기고, redirect로 전송 할 때 request영역이 초기화된다.
//		초기화 되기 전에 flash영역에 데이터를 저장해 놓고, 초기화된 후 flash영역에서 데이터를 가져온다.
//		데이터를 가져왔다면,flash영역에 있던 데이터는 사라진다.
	
//		redircet로 전송할 때는 경로 앞에 "redirect:를 붙여준다.
	return "redirect:/board/list";
	
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> idCheck(@RequestBody String userId){
		
		log.info("==========idCheck==================");
		log.info("uId :"+userId);
		Map<String,Object> map = new HashMap<>();
	
		int isSuccess = memberService.checkId(userId);
		
		log.info("결과 :" +isSuccess);
		
		map.put("idCheckResult", isSuccess);
		
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
//	@GetMapping("/read")
//    public void read(Long uNo,Model model) {
//		log.info("/read : "+ uNo);
//		
//		model.addAttribute("member", boardService.get(uNo));
//		
//		
//	}
	
	@GetMapping("/modify")
    public void read(Long uno,HttpServletRequest request,Model model) {
		
		log.info("read~~~~modify~~~~~");
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
				
		return "redirect:/board/list";
	}
	
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rttr) {
	    log.info("/modify : " + memberVO);

	    log.info("=======================sex=======================:" + memberVO.getSex());
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
	public void register() {
		
	}

	@PostMapping("/userProject")
	public void userProject(@RequestParam Long uno,@ModelAttribute MemberSearchConditionDTO formData, Model model) {
		
		log.info("=========================userProject================");
		
		
		log.info("=================== uno :==============" + uno);
		
		model.addAttribute("userProject", memberService.readUserProject(uno));
		model.addAttribute("formData", formData);
		
		log.info("====================formData============="+formData);
		log.info(memberService.readUserProject(uno));
		
		}
	
//	@GetMapping("/userProjcet")
//	public void userProject(Long uno,HttpServletRequest request,Model model) {
//		
//		log.info("=========================userProject================");
//		
//		String url = request.getRequestURI();
//		
//		log.info(url.substring(url.lastIndexOf("/")) + " : " + uno);
//		
//		model.addAttribute("userProject", memberService.readUserProject(uno));
//		
//		
//		}
	
	
	
	@PostMapping("/changeUserProjects")
	public ResponseEntity<Map<String, Object>> updateUserProject(@RequestBody List<MemberProjectDTO> projects) {
	    log.info("========================updateUser============================");
	    log.info("수정관련 조건들 확인하기 : " + projects);
	    Map<String, Object> map = new HashMap<>();

	    for (MemberProjectDTO project : projects) {
	        if ("update".equals(project.getAction())) {
	            // 수정 로직 수행
	            log.info("수정 작업 실행~~~");
	            boolean isSuccess = memberService.updateUserProject(project);

	            if (isSuccess) {
	                map.put("updateResult", "프로젝트가 성공적으로 수정되었습니다.");
	            } else {
	                map.put("updateResult", "프로젝트 수정에 실패했습니다.");
	            }
	        } else if ("delete".equals(project.getAction())) {
	            // 삭제 로직 수행
	            log.info("삭제 작업 실행~~~");
	            boolean isSuccess = memberService.deleteUserProject(project.getUno(),project.getPjtNo());

	            if (isSuccess) {
	                map.put("deleteResult", "프로젝트가 성공적으로 삭제되었습니다.");
	            } else {
	                map.put("deleteResult", "프로젝트 삭제에 실패했습니다.");
	            }
	        }
	    }

	    return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	@PostMapping("/addUserProject")
	public void addUserProjcet(@RequestParam Long uno,@RequestParam String entrDate ,Model model) {
		
		log.info("=========================addUserProject================");
		
		log.info("===================uno==============:"+uno);
		
		log.info("======================entrDate=====================" + entrDate);
	
		model.addAttribute("uno", uno);
		model.addAttribute("entrDate",entrDate);
		
	}

	@PostMapping("/searchNotAddUserProjects")
	public ResponseEntity<Map<String, Object>> searchNotAddUserProjects(@RequestBody MemberProjectDTO searchNotAddUserProjects, Model model){
		log.info("========================searchNotAddProject============================");
	    
		log.info("수정관련 조건들 확인하기 : " + searchNotAddUserProjects);
	    
	    Map<String, Object> map = new HashMap<>();
		
	    List<MemberProjectDTO> ProjectLists = memberService.notAddUserProject(searchNotAddUserProjects);

	    MemberProjectDTO memberProjectDTO = new MemberProjectDTO();
	    log.info("projectLists ==========" + ProjectLists);

	    memberProjectDTO.setAmount(searchNotAddUserProjects.getAmount());
	    memberProjectDTO.setPageNum(searchNotAddUserProjects.getPageNum());
	    memberProjectDTO.setUno(searchNotAddUserProjects.getUno());
        log.info("================================pageNum==============="+memberProjectDTO.getPageNum());	    
	    
	    int pjtTotalCount = memberService.getPjtTotalCount(searchNotAddUserProjects);// 전체 데이터 개수 조회
	    memberProjectDTO.setPjtTotalCount(pjtTotalCount);
	    
	    int pageSize = searchNotAddUserProjects.getAmount();
		int pagingSize = 10;
		
		// 1/10.0 =  0.1 math =  1 *10 = 10  , 14/10.0 = 1.4 =  math 2 *10 = 20 
	    int endPage = ((int) Math.ceil(memberProjectDTO.getAmount() / (double)pagingSize)) * pagingSize;
	    // 10 - (10-1) = 1 1페이지 시작
	    int startPage = endPage - (pagingSize - 1);
	    // 136 /10 = 13... 음 안되 14페이지까지 나와야함  136.0 /10 13.6 = 14
	    int realEnd = (int) Math.ceil(pjtTotalCount / (double) pageSize);//최대 페이지 갯수 토탈페이지
	    
	    boolean prev = startPage > 1;
	    
	    boolean next = endPage < realEnd;
	    	    
	    //1~10 1단위 이전과 다음 버튼은 10페이지씩 넘어가게 한다
		//11~20
		//20~30
		//...이전단위가 있을경우 1은 없음
	    if (realEnd < endPage) {
	    	//다음 단위가 있을경우 
	        endPage = realEnd;
	    
	    }
	    

	    
        memberProjectDTO.setPageNum(searchNotAddUserProjects.getPageNum());
        
        int pageNum = memberProjectDTO.getPageNum();
        long uno = memberProjectDTO.getUno();
		log.info("=====================이거는 이제 한번 갔다왔을때 pageNum :===================================" + memberProjectDTO.getPageNum());
	    
	    memberProjectDTO.setStartPage(startPage);
	    memberProjectDTO.setEndPage(endPage);
	    memberProjectDTO.setRealEnd(realEnd);
	    memberProjectDTO.setPrev(prev);
	    memberProjectDTO.setNext(next);
	    
	    
	    log.info("pjtTotalCount ==========="+pjtTotalCount);
	    
	    map.put("projectLists", ProjectLists);
		map.put("pjtTotalCount", pjtTotalCount);
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("realEnd", realEnd);
		map.put("prev", prev);
		map.put("next", next);
	    map.put("pageNum", pageNum);
	    map.put("realEnd", realEnd);
		map.put("uno", uno);
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	@PostMapping("/addUserProjects")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addUserProjects(@RequestBody List<MemberProjectDTO> projects){
		log.info("========================addUserProjects============================");
	    log.info("추가할 조건들 확인하기 : " + projects);
	    Map<String, Object> map = new HashMap<>();
		
	    
	    for (MemberProjectDTO project : projects) {
	    	
	    	boolean isSuccess = memberService.addUserProjects(project);
		    
	    	if (isSuccess) {
	    	    map.put("insertResult", "프로젝트가 성공적으로 등록되었습니다.");
	    	} else {
	    	    map.put("insertResult", "프로젝트 등록에 실패했습니다.");
	    	}
	    }
	    
	    
	    
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	

	
	
}
