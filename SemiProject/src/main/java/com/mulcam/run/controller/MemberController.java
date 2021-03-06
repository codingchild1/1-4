package com.mulcam.run.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Member;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Route;
import com.mulcam.run.dto.Today;
import com.mulcam.run.service.BoardService;
import com.mulcam.run.service.MateService;
import com.mulcam.run.service.MemberService;
import com.mulcam.run.service.RouteService;
import com.mulcam.run.service.TodayService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	RouteService routeService;
	
	@Autowired
	TodayService todayService;
	
	@Autowired
	MateService mateService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private ServletContext servletContext;
	
	
	//?????????
	@GetMapping(value="login")
	public String login() {
		return "login";
	}
	
	@PostMapping(value="login")
	public String loginForm(@RequestParam Map<String,String> info, Model model, HttpSession session) {
		try {
			String id=info.get("id");
			String password=info.get("password");
			if(id ==null || password==null) {
				model.addAttribute("error", "????????? ?????? ??????????????? ????????? ?????????.");
				return "err";
			}
			if(memberService.accessMember(id, password)) {
				session.setAttribute("id", id);
				int admin = memberService.queryById(id).getAdminCk();
				session.setAttribute("adminCheck", admin);
			} else {
				model.addAttribute("err", "????????? ?????? ??????????????? ???????????? ????????????.");
				return "err";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "????????? ??? ????????? ??????????????????.");
			return "err";
		}
		return "redirect:/main";
	}
	
	
	
	//????????????
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		session.removeAttribute("id");
		return "login";
	}
	
	//????????????
	@GetMapping(value="/join")
	public String joinForm() {
		return "join";
	}
	
	//????????????
	@PostMapping(value="/join")
	public String join(@RequestParam(value="profile") MultipartFile file,
			@RequestParam("name") String name, @RequestParam("id") String id, @RequestParam("password") String password, @RequestParam("email") String email, @RequestParam("phone")
		String phone, Model model) {
//		String path = servletContext.getRealPath("/profile/");
		String path = "/profile/";
		File destFile = new File(path+file.getOriginalFilename());
		try {
			file.transferTo(destFile);
		} catch(IOException e) {
			e.printStackTrace();
		}

		
		Member mem = new Member(id, name, password, email, phone, file.getOriginalFilename());
		Member member = new Member();

		try {
			memberService.makeMember(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/login";
	}
		
	//err?????? ????????????
	@GetMapping(value="/mypage")
	public String mypage(Model model) throws Exception {
		String id = (String) session.getAttribute("id");
		Member member = memberService.queryById(id);
		model.addAttribute(member);
		return "/mypage";
	}

	//????????? ?????? ??????
	@ResponseBody
	@PostMapping(value="/memberoverlap")
	public String memberOverlap(@RequestParam(value="id", required=true)String id) {
		boolean overlap=false;
		try {
			overlap=memberService.memOverlap(id);
		} catch(Exception e) {
		}
		return String.valueOf(overlap);
	}
	
	//?????? ??????
	@GetMapping(value="/memberlist")
	public String memberList(Model model) {
		List<Member> list = memberService.memberList();
		model.addAttribute("list", list);
		return "memberlist";
	}
	
	//?????? ?????? ??????
	@RequestMapping(value="/memberdelete", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteMember(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size;i++) {
			memberService.delete(ajaxMsg[i]);
		}
		return "redirect:memberlist";
	}
	


	//?????? ??? ??? ???????????????
	@RequestMapping(value="/fblist", method= {RequestMethod.GET, RequestMethod.POST})
	public String fbList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		String id = (String) session.getAttribute("id");
		PageInfo pageInfo = new PageInfo();
			
		try {
			List<Board> fblist = boardService.fbList(id, page, pageInfo);
			model.addAttribute("fblist", fblist);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("count", fblist.size());
			for(Board br : fblist) {
				System.out.println(br.fb_articleNo);
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("fblist", null);
		}		
	
		return "fblist";
	}
	//?????? ??? ??? ?????? ??????
	@RequestMapping(value="/routelist", method= {RequestMethod.GET, RequestMethod.POST})
	public String routeList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		String id = (String) session.getAttribute("id");
		PageInfo pageInfo = new PageInfo();
	
		try {
			List<Route> routelist = routeService.routeList(id, page, pageInfo);
			model.addAttribute("routelist", routelist);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("count", routelist.size());
			for(Route br : routelist) {
				System.out.println(br.route_articleNo);
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("routelist", null);
		}		
		
		
		return "routelist";
	}
	
	//?????? ??? ??? ????????? ??????
	@RequestMapping(value="/todaylist", method= {RequestMethod.GET, RequestMethod.POST})
	public String todayList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		String id = (String) session.getAttribute("id");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Today> todaylist = todayService.todayList(id, page, pageInfo);
			model.addAttribute("todaylist", todaylist);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("count", todaylist.size());
			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("todaylist", null);
		}
		
		return "todaylist";
	}
	
	//?????? ??? ??? ?????????
	@RequestMapping(value="/matelist", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mateList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		ModelAndView mv = new ModelAndView("matelist");
		String id = (String) session.getAttribute("id");
		PageInfo pageInfo = new PageInfo();
		try {
			List<GroupAndMate> matelist = mateService.mateList(id, page, pageInfo);
			mv.addObject("matelist", matelist);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("count", matelist.size());
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("matelist", null);
		}
		
		return mv;
	}
	
	//????????? ?????????
	@GetMapping(value="/profileview/{filename}")
	public void fileview(@PathVariable String filename,
			HttpServletRequest request, HttpServletResponse response) {
	/*?????? /fileview/board/${file.originalFilename } ????????? ????????? ???????????????,
	${file.originalFilename }??? URL??? ????????? ?????? ?????????????????? ????????????. ?????? filename????????? ????????? ?????? ?????????
	????????? ???????????? ??????????????? ?????? ??????????????? ????????? ?????????????????? ????????? PathVaribale????????? ?????????????????? ????????????. */
//		String path=servletContext.getRealPath("/profile/");
		String path="/profile/";
		File file=new File(path+filename); 
		String sfilename=null;
		FileInputStream fis=null;
		try {
			if(request.getHeader("User-Agent").indexOf("MSIE")>-1) {
				sfilename=URLEncoder.encode(file.getName(), "UTF-8");
			} else {
				sfilename=new String(file.getName().getBytes("UTF-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/octet-stream; charest=UTF-8");
//			response.setHeader("Content-Disposition", "attachment; filename="+sfilename);
			OutputStream out=response.getOutputStream();
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, out); 
			out.flush(); 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try{
					fis.close(); 
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	//?????? ?????? ????????????
	@RequestMapping(value="update", method= {RequestMethod.POST})
	public String memberUpdate(@RequestParam(value="profile") MultipartFile profile, @RequestParam(value="email") String email, @RequestParam(value="phone")
	String phone, @RequestParam(value="id") String id, @RequestParam(value="fileChange") String file) {
//		String path = servletContext.getRealPath("/profile/");
		String path ="/profile/";
		String fileName = profile.getOriginalFilename();
		System.out.println(id);
		System.out.println("?????? ???????????? ?????? ?????? :" +fileName);
		File destFile = new File(path+fileName);
		try {
			Member mem = memberService.queryById(id);
			System.out.println("?????? ???????????? ????????? ?????? ?????? :" + mem.getMemberthumb());
			System.out.println(file);
			if(file.equals("0")) {
				//???????????? ?????? ??? 0 ???????????????????????????
				mem = new Member(fileName, email, phone, id);
				profile.transferTo(destFile);
			} else {
				fileName =  mem.getMemberthumb();
			} //??????
			

			

			memberService.updateMember(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage";
		

	}
	
	//?????? ??????
	@GetMapping(value="/delete")
	public String deleteForm() {
		return "delete";
	}
	
	//?????? ??????
	@PostMapping(value="/delete")
	public String deleteMem(@RequestParam("password") String password) {
		String id = (String) session.getAttribute("id");
		String pw = memberService.checkPw(id);
		if(!password.equals(pw)) {
			return "delete";
		}
		memberService.delete(id);
		session.invalidate();
		return "login";
	}
	
	//???????????? ??????
	@GetMapping(value="/changepw")
	public String changePw() {
		return "changepw";
	}
	
	//???????????? ??????
	@PostMapping(value="/changepw")
	public String pwChange(@RequestParam("password") String password, @RequestParam("newPw") String newPw) {
		String id = (String) session.getAttribute("id");
		String pw = memberService.checkPw(id);
		Member mem = new Member(id, newPw);
		if(password.equals(pw)) {
			memberService.modifyPw(mem);
			session.invalidate();
			return "login";
		}
		
		return "redirect:/changepw";
		
	}
		
	
}
