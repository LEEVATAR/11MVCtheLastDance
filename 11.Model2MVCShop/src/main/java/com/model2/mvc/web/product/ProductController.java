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


//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	
	//@Value("#{commonProperties['pageUnit'] ?: 3}") �پ��� ������� �˾Ƶֶ� �ٵ� ���ε��ΰ����Ҷ� �̰Դ������Ű�����?
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//@Value("#{commonProperties['pageSize'] ?: 2}")���� ��Ÿ�϶� ������ 40�����α��� 3���� ����, 44�����α��� 2��
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
//	@GetMapping("addProduct")
//	public String addUser() throws Exception{
//		
//		System.out.println("/product/addProduct : GET");
//		
//		return "redirect:/product/getProduct.jsp";
//	}
//	@RequestMapping("/addProduct.do") �ּ� when 07refact ������ �׽�Ʈ��
//	@RequestMapping( value="addProduct", method=RequestMethod.POST)
	@RequestMapping("addProduct")
	public String addProduct( @ModelAttribute("product") Product product ) throws Exception {
		System.out.println("/product/addProduct : POST");
		System.out.println(product+" ������ ���̴°�?");
		
		//Business Logic
		productService.addProduct(product);
		System.out.println(product+" ���δ�Ʈ �ߵ��Դ�?"); 
		System.out.println(product.getProdNo()+"prodNO��¿�û");
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping("getProduct")
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		//System.out.println(product + "��Ʈ�Ѻκ� ��üũ" + prodNo+ "prodNo���� �ߵ��Դ���?");
		return "forward:/product/getProduct.jsp";
	}
//	@RequestMapping("/updateProductView.do") ������� �����ϰ�
	@RequestMapping( value ="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
		System.out.println("/product/updateProductView : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
//		System.out.println("[before] product�� �޾ƿԴ��� Ȯ���մϴ� "+product+" �̻������ �����մϴ�.");
//		System.out.println("prodNo�� �޾ƿԴ��� Ȯ���մϴ� "+prodNo+" �̻������ �����մϴ�.");
		model.addAttribute("product", product);
//		System.out.println("[after] product�� �޾ƿԴ��� Ȯ���մϴ� "+product+" �̻������ �����մϴ�.");
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
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
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