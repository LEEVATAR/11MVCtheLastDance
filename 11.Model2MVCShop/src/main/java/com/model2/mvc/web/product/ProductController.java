package com.model2.mvc.web.product;

import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	
	//@Value("#{commonProperties['pageUnit'] ?: 3}") 다양한 사용방법을 알아둬라 근데 따로따로관리할땐 이게더좋은거같은데?
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//@Value("#{commonProperties['pageSize'] ?: 2}")만약 오타일때 없으면 40번라인기준 3으로 들어가라, 44번라인기준 2로
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
//	@GetMapping("addProduct")
//	public String addUser() throws Exception{
//		
//		System.out.println("/product/addProduct : GET");
//		
//		return "redirect:/product/getProduct.jsp";
//	}
//	@RequestMapping("/addProduct.do") 주석 when 07refact 겟인지 테스트좀
//	@RequestMapping( value="addProduct", method=RequestMethod.POST)
	@RequestMapping("addProduct")
	public String addProduct( @ModelAttribute("product") Product product ) throws Exception {
		System.out.println("/product/addProduct : POST");
		System.out.println(product+" 무엇이 보이는가?");
		
		//Business Logic
		productService.addProduct(product);
		System.out.println(product+" 프로덕트 잘들어왔니?"); 
		System.out.println(product.getProdNo()+"prodNO출력요청");
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping("getProduct")
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		//System.out.println(product + "컨트롤부분 널체크" + prodNo+ "prodNo조건 잘들어왔는지?");
		return "forward:/product/getProduct.jsp";
	}
//	@RequestMapping("/updateProductView.do") 정보줘요 수정하게
	@RequestMapping( value ="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
		System.out.println("/product/updateProductView : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
//		System.out.println("[before] product을 받아왔는지 확인합니다 "+product+" 이상없을시 진행합니다.");
//		System.out.println("prodNo을 받아왔는지 확인합니다 "+prodNo+" 이상없을시 진행합니다.");
		model.addAttribute("product", product);
//		System.out.println("[after] product을 받아왔는지 확인합니다 "+product+" 이상없을시 진행합니다.");
		return "forward:/product/updateProductView.jsp";
	}
//	@RequestMapping("/updateProduct.do", method=RequestMethod.POST)
	@PostMapping( value ="updateProduct")
	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{
		
		System.out.println("/product/updateProduct : POST");
		//Business Logic
		session.setAttribute("product", product);
		productService.updateProduct(product);
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
	
//	@RequestMapping("/listProduct.do")
	@RequestMapping( value="listProduct" )
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct  : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	@RequestMapping(value = "autocomplete")
	public @ResponseBody Map<String, Object> autocomplete
    						(@RequestParam Map<String, Object> paramMap) throws Exception{

		List<Map<String, Object>> resultList = productService.autocomplete(paramMap);
		paramMap.put("resultList", resultList);

		return paramMap;
	}
}