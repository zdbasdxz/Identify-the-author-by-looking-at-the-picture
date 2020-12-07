package utl;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;

//import org.python.core.PyFunction;
//import org.python.core.PyObject;
//import org.python.util.PythonInterpreter;
//import org.python.core.PyInteger;
//import org.python.core.PyObject;
//import org.python.core.PySystemState;

public class Identity {
//    public void get() {
//    	System.out.print(this.getClass().getResource("").getPath());
//        PythonInterpreter interpreter = new PythonInterpreter();
//        interpreter.execfile("C:\\Users\\Lenovo\\Desktop\\test\\test.py");
//
//        PyFunction pyFunction = interpreter.get("mainFunc", PyFunction.class); // ��һ������Ϊ������õĺ����������������֣��ڶ�������Ϊ�������صĶ�������
//        PyObject pyObject = pyFunction.__call__(); // ���ú���
//        System.out.print("2222");
//        System.out.println(pyObject);
//        System.out.print("2222");
//    }
	 public String get(String ImagPth){
		 System.out.println("start python");
         //�贫��Ĳ���
//		 String a = "C:\\Users\\Lenovo\\Desktop\\test\\0.jpg"; 
//         System.out.println("start;" + a);
         //���������д������
         String[] args = new String[] { "E:\\Anaconda3\\python.exe", "C:\\Users\\Lenovo\\Desktop\\test\\test.py",ImagPth};  //����
         Process pr;
         String result = "";
		try {
			pr = Runtime.getRuntime().exec(args);
	         //TODO:�÷���ֻ�ܴ����ַ���
//	         Process pr = Runtime.getRuntime().exec("python C:\\Users\\Desktop\\test1.py C:\\Users\\hpp\\Desktop\\test1.mp4");
			 System.out.println(ImagPth);
	         BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
	         String line;
	         System.out.println("2222222222222");
	         while ((line = in.readLine()) != null) {
//	             line = decodeUnicode(line);
	        	 result += line +"-";
	             System.out.println(line);
	         }
	         System.out.println("2222222222222");
	         in.close();
	         try {
				pr.waitFor();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      return result;
	 }
	 }
