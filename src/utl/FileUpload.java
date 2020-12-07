package utl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload {
	public static String uploadFiles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
        request.setCharacterEncoding("UTF-8");
        //PrintWriter out=response.getWriter();
        String res = "null";//文件存放的位置
        String ret="No";
        try {
            // 配置上传参数
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            // 解析请求的内容提取文件数据
            //@SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            //获取普通参数
            Map<String ,String> field=new HashMap<>();
            for (FileItem item : formItems){
                if(item.isFormField()){
                    field.put(item.getFieldName(),item.getString());
                    System.out.println(item.getString());
                }
            }
            String type=field.get("type");//我自己规定的类型,区分文件是干嘛的
 
            int succ=0;
            // 迭代表单数据
            for (FileItem item : formItems) {
                // 处理不在表单中的字段，即文件
                if (!item.isFormField()) {
                    String fileName = item.getName(); //获取上传的文件名
                    String fileType=fileName.substring(fileName.lastIndexOf(".")+1);
                    //定义上传文件的存放路径
                    String path = request.getServletContext().getRealPath("/upload/"+type);
                    path=path.replace("\\","/");//一定要加上，不然路径在插入数据库时会出错
                    //定义上传文件的完整路径
                    String fileSaveName= new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()).toString();
                    fileSaveName+="."+fileType;
                    String filePath = String.format("%s/%s",path,fileSaveName);
                    File storeFile = new File(filePath);
                    //如果父目录不存在，就创建他
                    if(!storeFile.getParentFile().exists()){
                        storeFile.getParentFile().mkdirs();
                    }
                    // 在控制台输出文件的上传路径
                    //System.out.println(filePath);
                    // 保存文件到硬盘
                    item.write(storeFile);
                    res = filePath;
 
                    succ++; //多上传了一个文件
 
                }
            }
            if(succ>0){
                ret="Yes";
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
 
 
        
        //out.print(ret);
        //out.flush();
        //out.close();
		return res;
    }
}
