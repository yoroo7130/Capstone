package capstone;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DBConnector.DB;

/**
 * Servlet implementation class DashBoardServlet
 */
@WebServlet("/DASHBOARD")
public class DashBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			performTask(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "null", "rawtypes" })
	public void performTask(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String sqlGetMACDAT = "SELECT MACMCCO,DATE_FORMAT(MACTIME, '%Y-%m-%d %H:%i:%s') MACTIME ,MACSTAT FROM MACACT A1,(SELECT MACIDX FROM MACACT B1,(SELECT DATE_FORMAT(MAX(MACTIME), '%Y-%m-%d %H:%i:%s') MACTIME, MACMCCO FROM MACACT GROUP BY MACMCCO) B2 WHERE B1.MACMCCO = B2.MACMCCO AND B1.MACTIME = B2.MACTIME) A2 WHERE A1.MACIDX = A2.MACIDX ORDER BY MACMCCO";

		String sqlGetMEADAT = "SELECT A2.MDPIDX MDPIDX,A2.MDPNAME MDPNAME,A1.MDCIDX MDCIDX,A1.MDCMEMO MDCMEMO,A3.MEAIDX MEAIDX,DATE_FORMAT(A3.MEATIME, '%Y-%m-%d %H:%i:%s') MEATIME ,A3.MEADATA MEADATA FROM MDCODE A1 ,MDPIPE A2 ,MEADAT A3 ,( SELECT B1.MEAIDX FROM MEADAT B1 ,( SELECT DATE_FORMAT(MAX(MEATIME), '%Y-%m-%d %H:%i:%s') MEATIME ,MEAMDCO FROM MEADAT GROUP BY MEAMDCO ) B2 WHERE B1.MEAMDCO = B2.MEAMDCO AND B1.MEATIME = B2.MEATIME ) A4 WHERE A1.MDCIDX = A2.MDPMCID AND A2.MDPIDX = A3.MEAMDCO AND A3.MEAIDX = A4.MEAIDX ORDER BY MDPIDX";
		
		JSONObject jsonObject = new JSONObject();
		
		ArrayList<ArrayList<String>> sqlRes;
		
		sqlRes = DB.excuteQuery(sqlGetMACDAT);
		jsonObject.put("LIST_MACDAT", sqlRes);
		
		sqlRes = DB.excuteQuery(sqlGetMEADAT);
		jsonObject.put("LIST_MEADAT", sqlRes);
		
		String Data = jsonObject.toString();
		
		try {
			res.getWriter().print(Data != null ? Data.toString() : "");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
