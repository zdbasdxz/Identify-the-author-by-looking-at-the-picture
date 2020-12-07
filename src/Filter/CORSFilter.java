package Filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet Filter implementation class CORSFilter
 */
/*自定义拦截器 用于给每个都加上跨域的头*/
public class CORSFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CORSFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	@Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //变成http的
        HttpServletResponse resp = (HttpServletResponse) response;
        // 添加参数，允许任意domain访问
        resp.setContentType("text/html;charset=UTF-8");
        //禁用缓存，确保网页信息是最新数据
        resp.setHeader("Pragma","No-cache");
        resp.setHeader("Cache-Control","no-cache");
        resp.setHeader("Access-Control-Allow-Origin", "*");
        resp.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, HEAD, DELETE, PUT");
        resp.setHeader("Access-Control-Max-Age", "3600");
        resp.setHeader("Access-Control-Allow-Headers",
                "X-Requested-With, Content-Type, Authorization, Accept, Origin, User-Agent, Content-Range, Content-Disposition, Content-Description");

        resp.setDateHeader("Expires", -10);
        chain.doFilter(request, resp);
    }

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
