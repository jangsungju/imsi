package com.example.ex05.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberProjectDTO;
import com.example.ex05.domain.project.vo.ProjectDTO;
import com.example.ex05.domain.project.vo.ProjectVO;
import com.example.ex05.project.service.ProjectService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/project/*")
public class ProjectController {
	
	@Autowired
	private ProjectDTO projectDTO;
	
	@Autowired
	private ProjectService projectService;
	
	@GetMapping("/list")
	public void list() {
		
		log.info("====================projectList==============");
		
	}

	@PostMapping("/search")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> search(@RequestBody ProjectDTO formData ,Model model){
		
		Map<String, Object> map = new HashMap<>();
		log.info("============search============ 조건 확인:" + formData);
		
		List<ProjectDTO> projectList = projectService.search(formData);
		log.info("=================projectList=================="+projectList);
		
		int totalCount = projectService.totalCount(formData);
		log.info("===============totalCount============="+totalCount);
		
	    
		projectDTO.setPageNum(formData.getPageNum());
		projectDTO.setAmount(formData.getAmount());
		
		int pageSize = formData.getAmount();
		int pagingSize = 10;
		
		// 1/10.0 =  0.1 math =  1 *10 = 10  , 14/10.0 = 1.4 =  math 2 *10 = 20 
	    int endPage = ((int) Math.ceil(projectDTO.getPageNum() / (double)pagingSize)) * pagingSize;
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

	    projectDTO.setPageNum(projectDTO.getPageNum());
        
	    int pageNum= projectDTO.getPageNum();
	    
		log.info("=====================이거는 이제 한번 갔다왔을때 pageNum :===================================" + projectDTO.getPageNum());
	    
		projectDTO.setStartPage(startPage);
		projectDTO.setEndPage(endPage);
		projectDTO.setRealEnd(realEnd);
		projectDTO.setPrev(prev);
		projectDTO.setNext(next);
	    
		    
	    log.info("dataForm===============================================" + formData);
	        
	    
	    log.info("total: " + totalCount); // 전체 데이터 개수 확인
	    
	    map.put("totalCount", totalCount);
	    map.put("endPage", endPage);
	    map.put("startPage", startPage);
	    map.put("realEnd", realEnd);
	    map.put("prev", prev);
	    map.put("next", next);
        map.put("pageNum", pageNum);
        map.put("realEnd", realEnd);
		
		
		
		
		
		map.put("projectList", projectList);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	@GetMapping({"/read","/modify"})
	public void read (int pjtNo,HttpServletRequest request,Model model) {
		
		log.info("read~~~~modify~~~~~");
		
		String url = request.getRequestURI();
		
		log.info(url.substring(url.lastIndexOf("/")) + " : " + pjtNo);
		
		model.addAttribute("project", projectService.readProject(pjtNo));
	
	}
	
	@PostMapping("/modify")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> modify(@RequestBody ProjectVO formData) {
		
		log.info("=============Postmodify=============="+formData);
		Map<String, Object> map = new HashMap<>();
		
		boolean isSuccess = projectService.modifyProjcet(formData);
		

	    if (isSuccess) {
	    	
	    	    map.put("modifytResult", "프로젝트가 성공적으로 수정되었습니다.");
	    	} else {
	    	    map.put("modifytResult", "프로젝트 수정에 실패했습니다.");
	    	}
		
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> ProjectRegister(@RequestBody ProjectVO formData){
		
		log.info("=============Projectregister======================" + formData);
		Map<String, Object> map = new HashMap<>();
		
		boolean isSuccess = projectService.registerProject(formData);
		
		if (isSuccess) {
	    	
    	    map.put("registertResult", "프로젝트가 성공적으로 등록되었습니다.");
    	} else {
    	    map.put("registertResult", "프로젝트 등록에 실패했습니다.");
    	}
	
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@PostMapping("/projectMembers")
	public void projectMember(@RequestParam int pjtNo,Model model) {
		
		log.info("=======================projectMembers=============================" + pjtNo);
		
		model.addAttribute("projectMembers",projectService.projectMembers(pjtNo));
    
		log.info("==========projectMembers==========확인: " + projectService.projectMembers(pjtNo));

		model.addAttribute("pjtNo", pjtNo);
		
	}
	
	
	@PostMapping("/changeProjectUsers")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> changeProjectUsers(@RequestBody List<ProjectDTO> members){
		
		log.info("===================changeProjectUsers===============");
		log.info("======================users============="+members);
		
		Map<String,Object> map = new HashMap<>();
		
		 for (ProjectDTO member : members) {
		        if ("update".equals(member.getAction())) {
		            // 수정 로직 수행
		            log.info("수정 작업 실행~~~");
		            boolean isSuccess = projectService.updateProjectMembers(member);

		            if (isSuccess) {
		                map.put("updateResult", "프로젝트 사원의 정보가 성공적으로 수정되었습니다.");
		            } else {
		                map.put("updateResult", "프로젝트 사원의 정보 수정에 실패했습니다.");
		            }
		        } else if ("delete".equals(member.getAction())) {
		            // 삭제 로직 수행
		            log.info("삭제 작업 실행~~~");
		            boolean isSuccess = projectService.deleteProjectMembers(member.getUno(),member.getPjtNo());

		            if (isSuccess) {
		                map.put("deleteResult", "프로젝트 참여 사원이 삭제되었습니다.");
		            } else {
		                map.put("deleteResult", "프로젝트 참여 사원 삭제에 실패했습니다.");
		            }
		        }
		    }
		
		
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	@PostMapping("/addProjectMember")
	public void addProjectMember(@RequestParam int pjtNo,@RequestParam String pjtToDate,Model model) {
		
		log.info("====================addProjectMember================");
		log.info("pjtNo:"+pjtNo);
		log.info("pjtToDate:"+pjtToDate);
		
		model.addAttribute("pjtNo",pjtNo);
		model.addAttribute("pjtToDate", pjtToDate);
		
	}
	
	@PostMapping("/searchNAPMembers")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> searchNAPMembers(@RequestBody ProjectDTO formData){
		
		
		log.info("====================searchNAPMembers==================");
		log.info("====================search 조건확인==================:" +formData);
		
		Map<String,Object> map = new HashMap<>();
		ProjectDTO projectDTO = new ProjectDTO();
		projectDTO.setPjtNo(formData.getPjtNo());
		projectDTO.setAmount(formData.getAmount());
		projectDTO.setPageNum(formData.getPageNum());
		
		List<ProjectDTO> memberNAPList = projectService.notAPM(formData);
		log.info("==================memberNAPList================"+ memberNAPList);

		int totalCount = projectService.notAPMCount(formData);
		
		log.info("===========totalCount============" + totalCount);
		
		int pjtNo = projectDTO.getPjtNo();
	
		
		int pageSize = formData.getAmount();
		int pagingSize = 10;
		
		// 1/10.0 =  0.1 math =  1 *10 = 10  , 14/10.0 = 1.4 =  math 2 *10 = 20 
	    int endPage = ((int) Math.ceil(projectDTO.getPageNum() / (double)pagingSize)) * pagingSize;
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

	    projectDTO.setPageNum(projectDTO.getPageNum());
        
	    int pageNum= projectDTO.getPageNum();
	    
		log.info("=====================이거는 이제 한번 갔다왔을때 pageNum :===================================" + projectDTO.getPageNum());
	    
		projectDTO.setStartPage(startPage);
		projectDTO.setEndPage(endPage);
		projectDTO.setRealEnd(realEnd);
		projectDTO.setPrev(prev);
		projectDTO.setNext(next);
		    
	    log.info("dataForm===============================================" + formData);
	        
	    
	    log.info("total: " + totalCount); // 전체 데이터 개수 확인
	    
		map.put("memberNAPList", memberNAPList);
		map.put("pjtNo", pjtNo);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("realEnd", realEnd);
		map.put("prev", prev);
		map.put("next", next);
		map.put("pageNum", pageNum);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
		
	}
	
	@PostMapping("/addProjectMembers")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> addProjectMembers(@RequestBody List<ProjectDTO> selectedMembers){
		
		log.info("=================addProjectMembers=================="+selectedMembers);
		Map<String,Object> map = new HashMap<>();
		 
		for (ProjectDTO selectedMember : selectedMembers) {
		    	
		    	boolean isSuccess = projectService.addProjectMembers(selectedMember);
			    
		    	if (isSuccess) {
		    	    map.put("addtResult", "사원이 성공적으로 등록되었습니다.");
		    	} else {
		    	    map.put("addtResult", "사원 등록에 실패했습니다.");
		    	}
		    }
		
		
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
}
