package com.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.bean.ComBean;

public class ExcelServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ExcelServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {//导出excel表格

		OutputStream os = response.getOutputStream();// 取得输出流 
        response.reset();// 清空输出流 

       //不能用用中文设置 filename，会出错 
        response.setHeader("Content-disposition", "attachment; filename=xyw.xls");// 设定输出文件头 
        response.setContentType("application/msexcel");// 定义输出类型 
        String type=request.getParameter("type");
      // 准备设置excel工作表的标题      
        ComBean cb = new ComBean();
        
        	
        
       try {      
           // 获得开始时间      
           long start = System.currentTimeMillis();      
           // 输出的excel的路径     
//           String filePath = "c:/test.xls";      
           // 创建Excel工作薄      
            WritableWorkbook wwb;      
           // 新建立一个jxl文件,即在C盘下生成test.xls      
//         OutputStream os = new FileOutputStream(filePath);      
            wwb=Workbook.createWorkbook(os);      
           // 添加第一个工作表并设置第一个Sheet的名字      
            WritableSheet sheet = wwb.createSheet("导出信息", 0);      
            Label label; 
            List ka=new ArrayList();
            if(type.equals("teacher")){
            	String[] title = {"ID","登录名","密码","教师名","email","职称","年龄","专业方向","单位","是否在用"};  
            	ka = cb.getCom("select * from teacher order by id desc",10);
	            for(int i=0;i<title.length;i++){      
	                // Label(x,y,z)其中x代表单元格的第x+1列，第y+1行, 单元格的内容是y      
	                // 在Label对象的子对象中指明单元格的位置和内容      
	                 label = new Label(i,0,title[i]); 
	                
	                // 将定义好的单元格添加到工作表中      
	                 sheet.addCell(label);      
	            }
            }
            if(type.equals("xkjg")){//选课结果
            	String[] title = {"学生编号","教师编号","课程名称","简要说明","答辩地址","答辩时间","选课开始时间","选课截止时间","审核状态"};  
            	ka = cb.getCom("select xk.stu,xxk.js,xxk.kcm,xxk.zy,xxk.dd,xxk.sj,xxk.xkks,xxk.xkjs,xxk.zt from xk,xxk where xk.xxid=xxk.id order by xk.id desc",9);
	            for(int i=0;i<title.length;i++){      
	                // Label(x,y,z)其中x代表单元格的第x+1列，第y+1行, 单元格的内容是y      
	                // 在Label对象的子对象中指明单元格的位置和内容      
	                 label = new Label(i,0,title[i]); 
	                
	                // 将定义好的单元格添加到工作表中      
	                 sheet.addCell(label);      
	            }
            }
            else if(type.equals("stu")){
            	String[] title = {"学号","学生名","密码","性别","email","移动电话","身份证号","专业","通信地址"};  
            	ka = cb.getCom("select * from stu order by id desc",9);
	            for(int i=0;i<title.length;i++){      
	                // Label(x,y,z)其中x代表单元格的第x+1列，第y+1行, 单元格的内容是y      
	                // 在Label对象的子对象中指明单元格的位置和内容      
	                 label = new Label(i,0,title[i]); 
	                
	                // 将定义好的单元格添加到工作表中      
	                 sheet.addCell(label);      
	            }
            }
            else if(type.equals("cj")){
            	String[] title = {"学号","学生名","密码","性别","email","移动电话","身份证号","专业","通信地址","成绩"};  
            	String cid=request.getParameter("cid");
            	ka = cb.getCom("select stu.*,xk.cj from stu,xk where stu.id=(select stu from xk where cid='"+cid+"') and xk.stu=stu.id and xk.cid='"+cid+"' order by stu.id desc",10);
	            for(int i=0;i<title.length;i++){      
	                // Label(x,y,z)其中x代表单元格的第x+1列，第y+1行, 单元格的内容是y      
	                // 在Label对象的子对象中指明单元格的位置和内容      
	                 label = new Label(i,0,title[i]); 
	                
	                // 将定义好的单元格添加到工作表中      
	                 sheet.addCell(label);      
	            }
            }
           HttpSession session = request.getSession(); 
           
          // ArrayList ka = cb.getKaxinxiExcel("where admin="+adminlogin.get(0));
           
           for(int i = 0;i < ka.size();i++){
        	   ArrayList alRow = (ArrayList)ka.get(i);
        	   for(int m = 0;m < alRow.size();m++){
                   label = new Label(m,i+1,alRow.get(m).toString());      
                   sheet.addCell(label);
        	   }        	   
           }
//           // 下面是填充数据      
//           /* 
//             * 保存数字到单元格，需要使用jxl.write.Number 
//             * 必须使用其完整路径，否则会出现错误 
//             * */     
//           // 填充产品编号      
//           jxl.write.Number number = new jxl.write.Number(0,1,20071001);      
//            sheet.addCell(number);      
//          // 填充产品名称      
//            label = new Label(1,1,"金鸽瓜子");      
//            sheet.addCell(label);      
//           /* 
//             * 定义对于显示金额的公共格式 
//             * jxl会自动实现四舍五入 
//             * 例如 2.456会被格式化为2.46,2.454会被格式化为2.45 
//             * */     
//           jxl.write.NumberFormat nf = new jxl.write.NumberFormat(" . ");      
//           jxl.write.WritableCellFormat wcf = new jxl.write.WritableCellFormat(nf);      
//          // 填充产品价格      
//           jxl.write.Number nb = new jxl.write.Number(2,1,2.45,wcf);      
//            sheet.addCell(nb);      
//           // 填充产品数量      
//           jxl.write.Number numb = new jxl.write.Number(3,1,200);      
//            sheet.addCell(numb);      
//           /* 
//             * 定义显示日期的公共格式 
//             * 如:yyyy-MM-dd hh:mm 
//             * */     
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");      
//            String newdate = sdf.format(new Date());      
//          // 填充出产日期      
//            label = new Label(4,1,newdate);      
//            sheet.addCell(label);      
//           // 填充产地      
//            label = new Label(5,1,"陕西西安");      
//            sheet.addCell(label);      
//           /* 
//             * 显示布尔值 
//             * */     
//           jxl.write.Boolean bool = new jxl.write.Boolean(6,1,true);      
//            sheet.addCell(bool);      
//          /* 
//             * 合并单元格 
//             * 通过writablesheet.mergeCells(int x,int y,int m,int n);来实现的 
//             * 表示将从第x+1列，y+1行到m+1列，n+1行合并 
//             * 
//             * */     
//            sheet.mergeCells(0,3,2,3);      
//            label = new Label(0,3,"合并了三个单元格");      
//            sheet.addCell(label);      
//           /* 
//             * 
//             * 定义公共字体格式 
//             * 通过获取一个字体的样式来作为模板 
//             * 首先通过web.getSheet(0)获得第一个sheet 
//             * 然后取得第一个sheet的第二列，第一行也就是"产品名称"的字体 
//             * */     
//            jxl.format.CellFormat cf = wwb.getSheet(0).getCell(1, 0).getCellFormat();      
//            WritableCellFormat wc = new WritableCellFormat();      
//           // 设置居中      
//            wc.setAlignment(Alignment.CENTRE);      
//           // 设置边框线      
//            wc.setBorder(Border.ALL, BorderLineStyle.THIN);      
//           // 设置单元格的背景颜色      
//            wc.setBackground(jxl.format.Colour.RED);      
//            label = new Label(1,5,"字体",wc);      
//            sheet.addCell(label);      
//    
//           // 设置字体      
//           jxl.write.WritableFont wfont = new jxl.write.WritableFont(WritableFont.createFont("隶书"),20);      
//            WritableCellFormat font = new WritableCellFormat(wfont);      
//            label = new Label(2,6,"隶书",font);      
//            sheet.addCell(label);  
           // 写入数据      
            wwb.write();      
           // 关闭文件      
            wwb.close();      
           long end = System.currentTimeMillis();      
//            System.out.println("----完成该操作共用的时间是:"+(end-start)/1000);      
        } catch (Exception e) {      
 //           System.out.println("---出现异常---");      
            e.printStackTrace();      
        }    
        return; 

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
