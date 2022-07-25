package com.sada.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sada.model.AttachImageVO;
import com.sada.model.Criteria;
import com.sada.model.PageDTO;
import com.sada.model.ProductVO;
import com.sada.model.ReplyDTO;
import com.sada.service.AdminService;
import com.sada.service.ReplyService;
import com.sada.task.FilterTask;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private String onOff="";

	   public String getOnOff() {
	      return onOff;
	   }

	   public void setOnOff(String onOff) {
	      this.onOff = onOff;
	   }
	   
	   @Autowired
	   private FilterTask filterTask;

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ReplyService replyService;

	/* 관리자 메인 페이지 이동 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception {

		logger.info("관리자 페이지 이동");

	}

	/* 상품 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "goodsManage", method = RequestMethod.GET)
	public void goodsManageGET(Criteria cri, Model model) throws Exception {
		/* 상품 리스트 데이터 */

		logger.info("상품 등록 페이지 접속");

		List list = adminService.goodsGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
	}

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) { // 업로드를 수행하는 url 매핑
																									// 메서드를 여러 개의 파일
																									// 업로드도 처리를 할 수 있도록
		// "/admin/uploadajaxAction"url 요청에 응답을 하는 url 매핑 메서드를 작성
		// 뷰(view)에서 전송한 첨부파일 데이터를 전달받기 위해서 MultipartFile 타입의 "uploadFile" 변수를 매개변수로 부여
		logger.info("uploadAjaxActionPOST..........");

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {

				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}

		}

		String uploadFolder = "/home/ubuntu/Users/jingoo/upload/";

		// 날짜 경로 문자열 얻기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 (file 객체 사용) */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();

		// 향상된 for
		for (MultipartFile multipartFile : uploadFile) {

			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString(); // 동일한 이름의 파일이 곂치지 않도록
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

//				// 썸네일 생성(ImageIO)
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//				
//				BufferedImage bo_image = ImageIO.read(saveFile);
//				
//				/* 비율 */
//				double ratio = 3;
//				/*넓이 높이*/
//				int width = (int) (bo_image.getWidth() / ratio);
//				int height = (int) (bo_image.getHeight() / ratio);
//			
//				//비율 축소 적용 
//				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
//								
//				Graphics2D graphic = bt_image.createGraphics();
//				
//				
//				
//				graphic.drawImage(bo_image, 0, 0,width,height, null);
//				
//				ImageIO.write(bt_image, "jpg", thumbnailFile); 

				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}

			list.add(vo);
		}
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);

		return result;

		// 1. 이미지 파일 저장
		// 2. 썸네일 이미지 파일 생성 및 저장
		// 3. 각 이미지 정보 List 객체에 저장
		// 4. ResponseEntity를 통해서 뷰(view)로 http 상태 코드가 200이고 http Body에 이미지 정보가 담긴 List
		// 객체를 전송
	}
	// MultiparFile에 대해 간략히 설명을 하면 뷰(View)에서 전송한 multipart 타입의 파일을 다룰 수 있도록
	// 해주는 인터페이스입니다. 해당 인터페이스의 메서드들은 파일의 이름 반환, 파일의 사이즈 반환, 파일을 특정 경로에 저장 등을 수행합니다.

	/* 상품 등록 페이지 접속 */
	@RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
	public void goodsEnrollGET(Model model) throws Exception { // 뷰(view)로 데이터를 넘겨주기 위해서 url 매핑 메서드의 파라미터에 Model를 부여해준 후
																// addAttribute()를 사용하여 "cateList"속성에 String타입의
																// 'cateList' 변수의 값을 저장시킵니다.
		logger.info("상품 등록 페이지 접속");

		ObjectMapper objm = new ObjectMapper();

		List list = adminService.cateList();

		String cateList = objm.writeValueAsString(list);

		model.addAttribute("cateList", cateList);

		logger.info("변경 전.........." + list);
		logger.info("변경 후.........." + cateList);
		// 사용해야 할 메서드는 writeValueAsString() 메서드입니다.
		// Java 객체를 String타입의 JSON형식 데이터로 변환해줍니다.

		// 우리가 사용할 Jackson-databind의 메서드는 static
		// 메서드가 아니기 때문에 바로 사용할 수는 없습니다.
		// ObjectMapper클래스를 인스턴스화 하여 사용해야 합니다. 따라서 ObjectMapper 타입의 'mapper'변수를 선언한 후
		// ObjectMapper 객체로 초기화합니다.
	}

	/* 상품 등록 */
	@PostMapping("/goodsEnroll")
	public String goodsEnrollPOST(ProductVO product, RedirectAttributes rttr) {

		logger.info("goodsEnrollPOST......" + product);

		adminService.productEnroll(product);

		rttr.addFlashAttribute("enroll_result", product.getProductName());

		return "redirect:/admin/goodsManage";

	}

	/* 상품 정보 삭제 */
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int productId, RedirectAttributes rttr) {

		logger.info("goodsDeletePOST..........");

		List<AttachImageVO> fileList = adminService.getAttachInfo(productId);

		if (fileList != null) {

			List<Path> pathList = new ArrayList();

			fileList.forEach(vo -> {

				// 원본 이미지
				Path path = Paths.get("/home/ubuntu/Users/jingoo/upload/", vo.getUploadPath(),
						vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

				// 섬네일 이미지
				path = Paths.get("/home/ubuntu/Users/jingoo/upload/", vo.getUploadPath(),
						"s_" + vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

			});

			pathList.forEach(path -> {
				path.toFile().delete();
			});

		}

		int result = adminService.goodsDelete(productId);

		rttr.addFlashAttribute("delete_result", result);

		return "redirect:/admin/goodsManage";

	}

	/* 상품 조회 페이지 */
	@GetMapping({ "/goodsDetail", "/goodsModify" })
	public void goodsGetInfoGET(Integer productId, Criteria cri, Model model) throws JsonProcessingException {

		logger.info("goodsGetInfo()........." + productId);

		ObjectMapper mapper = new ObjectMapper();

		/* 카테고리 리스트 데이터 */
		model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));

		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);

		/* 조회 페이지 정보 */
		model.addAttribute("goodsInfo", adminService.goodsGetDetail(productId));

	}

	/* 상품 정보 수정 */
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(ProductVO vo, RedirectAttributes rttr) {

		logger.info("goodsModifyPOST.........." + vo);

		int result = adminService.goodsModify(vo);

		rttr.addFlashAttribute("modify_result", result);

		return "redirect:/admin/goodsManage";

	}

	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("deleteFile........" + fileName);

		File file = null;

		try {
			/* 썸네일 파일 삭제 */
			file = new File("/Users/jingoo/upload/" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			logger.info("originFileName : " + originFileName);

			file = new File(originFileName);

			file.delete();

		} catch (Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

		} // catch

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "replyFilter", method = RequestMethod.POST)
	public String replyDeleteAll(@RequestParam(value = "on_off") String on_off) {

		logger.info("필터접속");
		AdminController Controller = new AdminController();
		if (on_off.equals("on")) {
			List<ReplyDTO> replyList = replyService.getReplyFindAll();
			
			ArrayList<JSONObject> jsonArrayList = new ArrayList<>();
			try {
				for (ReplyDTO reply : replyList) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("document", reply.getContent());
					jsonObject.put("id", reply.getReplyId());
					jsonArrayList.add(jsonObject);
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
			JSONObject bellInJsonObject = new JSONObject();
			bellInJsonObject.put("bell_in", jsonArrayList);
			String result = null;
			System.out.println(bellInJsonObject);
			try {
				System.out.println(bellInJsonObject);
				result = Controller.sendJSON(bellInJsonObject);
				System.out.println(result);
			} catch (IOException e) {
				e.printStackTrace();
			}

			org.json.JSONObject outputJObject = new org.json.JSONObject(result);
			JSONArray outputJArray = outputJObject.getJSONArray("bell_out");
			System.out.println("============================");
			for (int i = 0; i < outputJArray.length(); i++) {
				org.json.JSONObject obj = outputJArray.getJSONObject(i);
				int label = obj.getInt("label");
				int id = obj.getInt("id");
				replyService.updateFilterOn(label, id);
			}
//	            scheduleOn이면 실행
		} else if (on_off.equals("scheduleOn")) {
			setOnOff("scheduleOn");
			filterTask.startScheduledTask();
//	            scheduleOff면 중지
		} else if (on_off.equals("scheduleOff")) {
			setOnOff("scheduleOff");
			filterTask.stopScheduledTask();
		} else {
			// 스케쥴링 off설정
			replyService.updateFilterOff();
		}

		return "admin/replyManage";

	}

	public String sendJSON(JSONObject jObject) throws IOException {
		String inputLine = null;
		StringBuffer stringBuffer = new StringBuffer();

		URL url = new URL("http://3.39.179.14:8000/"); // URL객체 생성

		HttpURLConnection conn = (HttpURLConnection) url.openConnection(); // url주소를 가지고 Http 커넥션 객체 생성

		System.out.println(conn.toString());
		conn.setDoOutput(true);
		conn.setDoInput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("accept", "application/json");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setConnectTimeout(10000);
		conn.setReadTimeout(10000);

		// 데이터 전송
		BufferedWriter bWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
		// 데이터쓰기
		bWriter.write(jObject.toString());
		// 데이터 보내기
		bWriter.flush();
		// 전송된 결과를 읽어옴
		BufferedReader bReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		while ((inputLine = bReader.readLine()) != null) {
			stringBuffer.append(inputLine);
		}
		bWriter.close();
		bReader.close();
		conn.disconnect();
		// 전송된 결과 반환
		return stringBuffer.toString();
	}// sendJSON()
	
	@RequestMapping(value = "replyManage", method = RequestMethod.GET)
	   public String replyManage() {
	      
	      logger.info("상품 등록 페이지 접속");
	      return "admin/replyManage";
	      
	   }

}
