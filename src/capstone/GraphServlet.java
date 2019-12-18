package capstone;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DBConnector.DB;

@WebServlet("/GRAPH")
public class GraphServlet extends HttpServlet {
	
	public GraphServlet() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		try {
			service(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
	    Collection<Collection<JSONObject>> jsonArray = new ArrayList<Collection<JSONObject>>();
	    int showFieldN = 0, showDataN = 0;
	    
		if (req.getParameterValues("baytemp1") != null || req.getParameterValues("baytemp2") != null
				|| req.getParameterValues("baytemp3") != null || req.getParameterValues("baytemp4") != null
				|| req.getParameterValues("remaining1") != null || req.getParameterValues("remaining2") != null
				|| req.getParameterValues("remaining3") != null || req.getParameterValues("remaining4") != null) {
			
			int ftype = Integer.parseInt(req.getParameterValues("type")[0]);
			String dateFormat = "%Y-%m-%d %H:%i:%s".substring(0, ftype * 3 - 1);
			
			String showFieldIDs[] = new String[8];

			if (req.getParameterValues("baytemp1") != null) {
				showFieldIDs[showFieldN] = "1";
				showFieldN++;
			}

			if (req.getParameterValues("baytemp2") != null) {
				showFieldIDs[showFieldN] = "2";
				showFieldN++;
			}

			if (req.getParameterValues("baytemp3") != null) {
				showFieldIDs[showFieldN] = "3";
				showFieldN++;
			}

			if (req.getParameterValues("baytemp4") != null) {
				showFieldIDs[showFieldN] = "4";
				showFieldN++;
			}

			if (req.getParameterValues("remaining1") != null) {
				showFieldIDs[showFieldN] = "5";
				showFieldN++;
			}

			if (req.getParameterValues("remaining1") != null) {
				showFieldIDs[showFieldN] = "6";
				showFieldN++;
			}

			if (req.getParameterValues("remaining1") != null) {
				showFieldIDs[showFieldN] = "7";
				showFieldN++;
			}

			if (req.getParameterValues("remaining1") != null) {
				showFieldIDs[showFieldN] = "8";
				showFieldN++;
			}

			String sqlShow_fieldsColumns = "";
			String sqlColumns = "";
			String sqlTables = "";
			String sqlWhereClues = "";

			for (int i = 1; i <= showFieldN; i++) {
				sqlShow_fieldsColumns += (showFieldIDs[i - 1] + " FIELD" + i + ", ");
				sqlColumns += ",T" + i + ".MDPNAME FIELD" + i + "_NAME, " + "T" + i + ".MEADATA FIELD" + i + "_DATA";
				sqlTables += ",TMP T" + i;

				if (i > 1) {
					sqlWhereClues += "AND T" + i + ".MDPIDX = S.FIELD" + i + " AND T1.REPODATE = T" + i + ".REPODATE ";
				}
			}
			
			sqlShow_fieldsColumns = sqlShow_fieldsColumns.substring(0, sqlShow_fieldsColumns.lastIndexOf(","));

			String sqlStTS = req.getParameterValues("startdate")[0] + " " + req.getParameterValues("starttime")[0];
			String sqlEdTS = req.getParameterValues("enddate")[0] + " " + req.getParameterValues("endtime")[0];
			
			String sqlGetGridData = "WITH SHOW_FIELDS AS                                              "
					+ " (                                                               " + "  SELECT  "
					+ sqlShow_fieldsColumns + "                          "
					+ "  FROM DUAL                                                      "
					+ " )                                                               "
					+ " ,TMP AS                                                         "
					+ " (                                                               "
					+ "  SELECT  DATE_FORMAT(T3.MEATIME, '" + dateFormat + "') REPODATE "
					+ "         ,T2.MDPIDX                       MDPIDX                 "
					+ "         ,T2.MDPNAME                      MDPNAME                "
					+ "         ,AVG(T3.MEADATA)                 MEADATA                "
					+ "    FROM  MDCODE       T1                                        "
					+ "         ,MDPIPE       T2                                        "
					+ "         ,MEADAT       T3                                        "
					+ "   WHERE T1.MDCIDX = T2.MDPMCID                                  "
					+ "     AND T2.MDPIDX = T3.MEAMDCO                                  "
					+ "   GROUP BY REPODATE, MDPIDX, MDPNAME                            "
					+ "   ORDER BY REPODATE, MDPIDX ASC                                 "
					+ " )                                                               "
					+ "SELECT  T1.REPODATE                                              " + "        " + sqlColumns
					+ "                                       "
					+ "  FROM SHOW_FIELDS           S                                   " + "        " + sqlTables
					+ "                                        "
					+ " WHERE T1.MDPIDX = S.FIELD1                                      " + "        " + sqlWhereClues 
					+ "   AND DATE_FORMAT('" + sqlStTS + "', '" + dateFormat + "') <= T1.REPODATE  "
					+ "   AND T1.REPODATE <= DATE_FORMAT('" + sqlEdTS + "', '" + dateFormat + "') ;";
			
			ArrayList<ArrayList<String>> sqlRes = DB.excuteQuery(sqlGetGridData);
			showDataN = sqlRes.size();
			
			for(int j=1; j<=showFieldN; j++) {
				Collection<JSONObject> JArr = new ArrayList<JSONObject>();
				
				for (int i=0; i<sqlRes.size(); i++) {
					JSONObject JObj = new JSONObject();
					
					JObj.put("x", i);
					JObj.put("y", (int)(Math.abs(Double.parseDouble(sqlRes.get(i).get(j * 2))) % 100));
					JObj.put("date", sqlRes.get(i).get(0));
					JObj.put("lineType", j);
					JObj.put("lineName", sqlRes.get(i).get(j * 2 - 1));

					JArr.add(JObj);
				}
				
				jsonArray.add(JArr);
			}
		}
		
		else {

		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("xMax", showDataN);
		jsonObject.put("yMax", 100);
		jsonObject.put("data", jsonArray);
		String Data = jsonObject.toString();

		try {
			resp.getWriter().print(Data != null ? Data.toString() : "");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
