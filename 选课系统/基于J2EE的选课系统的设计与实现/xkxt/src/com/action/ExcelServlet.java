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
			throws ServletException, IOException {//����excel���

		OutputStream os = response.getOutputStream();// ȡ������� 
        response.reset();// �������� 

       //���������������� filename������� 
        response.setHeader("Content-disposition", "attachment; filename=xyw.xls");// �趨����ļ�ͷ 
        response.setContentType("application/msexcel");// ����������� 
        String type=request.getParameter("type");
      // ׼������excel������ı���      
        ComBean cb = new ComBean();
        
        	
        
       try {      
           // ��ÿ�ʼʱ��      
           long start = System.currentTimeMillis();      
           // �����excel��·��     
//           String filePath = "c:/test.xls";      
           // ����Excel������      
            WritableWorkbook wwb;      
           // �½���һ��jxl�ļ�,����C��������test.xls      
//         OutputStream os = new FileOutputStream(filePath);      
            wwb=Workbook.createWorkbook(os);      
           // ��ӵ�һ�����������õ�һ��Sheet������      
            WritableSheet sheet = wwb.createSheet("������Ϣ", 0);      
            Label label; 
            List ka=new ArrayList();
            if(type.equals("teacher")){
            	String[] title = {"ID","��¼��","����","��ʦ��","email","ְ��","����","רҵ����","��λ","�Ƿ�����"};  
            	ka = cb.getCom("select * from teacher order by id desc",10);
	            for(int i=0;i<title.length;i++){      
	                // Label(x,y,z)����x����Ԫ��ĵ�x+1�У���y+1��, ��Ԫ���������y      
	                // ��Label������Ӷ�����ָ����Ԫ���λ�ú�����      
	                 label = new Label(i,0,title[i]); 
	                
	                // ������õĵ�Ԫ����ӵ���������      
	                 sheet.addCell(label);      
	            }
            }
            if(type.equals("xkjg")){//ѡ�ν��
            	String[] title = {"ѧ�����","��ʦ���","�γ�����","��Ҫ˵��","����ַ","���ʱ��","ѡ�ο�ʼʱ��","ѡ�ν�ֹʱ��","���״̬"};  
            	ka = cb.getCom("select xk.stu,xxk.js,xxk.kcm,xxk.zy,xxk.dd,xxk.sj,xxk.xkks,xxk.xkjs,xxk.zt from xk,xxk where xk.xxid=xxk.id order by xk.id desc",9);
	            for(int i=0;i<title.length;i++){      
	                // Label(x,y,z)����x����Ԫ��ĵ�x+1�У���y+1��, ��Ԫ���������y      
	                // ��Label������Ӷ�����ָ����Ԫ���λ�ú�����      
	                 label = new Label(i,0,title[i]); 
	                
	                // ������õĵ�Ԫ����ӵ���������      
	                 sheet.addCell(label);      
	            }
            }
            else if(type.equals("stu")){
            	String[] title = {"ѧ��","ѧ����","����","�Ա�","email","�ƶ��绰","���֤��","רҵ","ͨ�ŵ�ַ"};  
            	ka = cb.getCom("select * from stu order by id desc",9);
	            for(int i=0;i<title.length;i++){      
	                // Label(x,y,z)����x����Ԫ��ĵ�x+1�У���y+1��, ��Ԫ���������y      
	                // ��Label������Ӷ�����ָ����Ԫ���λ�ú�����      
	                 label = new Label(i,0,title[i]); 
	                
	                // ������õĵ�Ԫ����ӵ���������      
	                 sheet.addCell(label);      
	            }
            }
            else if(type.equals("cj")){
            	String[] title = {"ѧ��","ѧ����","����","�Ա�","email","�ƶ��绰","���֤��","רҵ","ͨ�ŵ�ַ","�ɼ�"};  
            	String cid=request.getParameter("cid");
            	ka = cb.getCom("select stu.*,xk.cj from stu,xk where stu.id=(select stu from xk where cid='"+cid+"') and xk.stu=stu.id and xk.cid='"+cid+"' order by stu.id desc",10);
	            for(int i=0;i<title.length;i++){      
	                // Label(x,y,z)����x����Ԫ��ĵ�x+1�У���y+1��, ��Ԫ���������y      
	                // ��Label������Ӷ�����ָ����Ԫ���λ�ú�����      
	                 label = new Label(i,0,title[i]); 
	                
	                // ������õĵ�Ԫ����ӵ���������      
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
//           // �������������      
//           /* 
//             * �������ֵ���Ԫ����Ҫʹ��jxl.write.Number 
//             * ����ʹ��������·�����������ִ��� 
//             * */     
//           // ����Ʒ���      
//           jxl.write.Number number = new jxl.write.Number(0,1,20071001);      
//            sheet.addCell(number);      
//          // ����Ʒ����      
//            label = new Label(1,1,"������");      
//            sheet.addCell(label);      
//           /* 
//             * ���������ʾ���Ĺ�����ʽ 
//             * jxl���Զ�ʵ���������� 
//             * ���� 2.456�ᱻ��ʽ��Ϊ2.46,2.454�ᱻ��ʽ��Ϊ2.45 
//             * */     
//           jxl.write.NumberFormat nf = new jxl.write.NumberFormat(" . ");      
//           jxl.write.WritableCellFormat wcf = new jxl.write.WritableCellFormat(nf);      
//          // ����Ʒ�۸�      
//           jxl.write.Number nb = new jxl.write.Number(2,1,2.45,wcf);      
//            sheet.addCell(nb);      
//           // ����Ʒ����      
//           jxl.write.Number numb = new jxl.write.Number(3,1,200);      
//            sheet.addCell(numb);      
//           /* 
//             * ������ʾ���ڵĹ�����ʽ 
//             * ��:yyyy-MM-dd hh:mm 
//             * */     
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");      
//            String newdate = sdf.format(new Date());      
//          // ����������      
//            label = new Label(4,1,newdate);      
//            sheet.addCell(label);      
//           // ������      
//            label = new Label(5,1,"��������");      
//            sheet.addCell(label);      
//           /* 
//             * ��ʾ����ֵ 
//             * */     
//           jxl.write.Boolean bool = new jxl.write.Boolean(6,1,true);      
//            sheet.addCell(bool);      
//          /* 
//             * �ϲ���Ԫ�� 
//             * ͨ��writablesheet.mergeCells(int x,int y,int m,int n);��ʵ�ֵ� 
//             * ��ʾ���ӵ�x+1�У�y+1�е�m+1�У�n+1�кϲ� 
//             * 
//             * */     
//            sheet.mergeCells(0,3,2,3);      
//            label = new Label(0,3,"�ϲ���������Ԫ��");      
//            sheet.addCell(label);      
//           /* 
//             * 
//             * ���幫�������ʽ 
//             * ͨ����ȡһ���������ʽ����Ϊģ�� 
//             * ����ͨ��web.getSheet(0)��õ�һ��sheet 
//             * Ȼ��ȡ�õ�һ��sheet�ĵڶ��У���һ��Ҳ����"��Ʒ����"������ 
//             * */     
//            jxl.format.CellFormat cf = wwb.getSheet(0).getCell(1, 0).getCellFormat();      
//            WritableCellFormat wc = new WritableCellFormat();      
//           // ���þ���      
//            wc.setAlignment(Alignment.CENTRE);      
//           // ���ñ߿���      
//            wc.setBorder(Border.ALL, BorderLineStyle.THIN);      
//           // ���õ�Ԫ��ı�����ɫ      
//            wc.setBackground(jxl.format.Colour.RED);      
//            label = new Label(1,5,"����",wc);      
//            sheet.addCell(label);      
//    
//           // ��������      
//           jxl.write.WritableFont wfont = new jxl.write.WritableFont(WritableFont.createFont("����"),20);      
//            WritableCellFormat font = new WritableCellFormat(wfont);      
//            label = new Label(2,6,"����",font);      
//            sheet.addCell(label);  
           // д������      
            wwb.write();      
           // �ر��ļ�      
            wwb.close();      
           long end = System.currentTimeMillis();      
//            System.out.println("----��ɸò������õ�ʱ����:"+(end-start)/1000);      
        } catch (Exception e) {      
 //           System.out.println("---�����쳣---");      
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
