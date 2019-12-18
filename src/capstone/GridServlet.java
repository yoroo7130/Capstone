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

@WebServlet("/GRID")
public class GridServlet extends HttpServlet {

	public GridServlet() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

	    Collection<JSONObject> jsonHeader = new ArrayList<JSONObject>();
	    Collection<JSONObject> jsonValue = new ArrayList<JSONObject>();

		if (req.getParameterValues("baytemp1") != null || req.getParameterValues("baytemp2") != null
				|| req.getParameterValues("baytemp3") != null || req.getParameterValues("baytemp4") != null
				|| req.getParameterValues("remaining1") != null || req.getParameterValues("remaining2") != null
				|| req.getParameterValues("remaining3") != null || req.getParameterValues("remaining4") != null) {
			
			int ftype = Integer.parseInt(req.getParameterValues("type")[0]);
			String dateFormat = "%Y-%m-%d %H:%i:%s".substring(0, ftype * 3 - 1);
			
			int showFieldN = 0;
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
			
			JSONObject tmp = new JSONObject();
			tmp.put("key", 0);
			tmp.put("label", "측정시간");
			tmp.put("align", "center");
			tmp.put("width", 200);
			jsonHeader.add(tmp);

			for (int i = 1; i <= showFieldN; i++) {
				sqlShow_fieldsColumns += (showFieldIDs[i - 1] + " FIELD" + i + ", ");

				tmp = new JSONObject();
				tmp.put("key", (i * 2 - 1));
				tmp.put("label", "측정 센서 명 " + i);
				tmp.put("align", "center");
				jsonHeader.add(tmp);

				tmp = new JSONObject();
				tmp.put("key", (i * 2));
				tmp.put("label", "측정 값 " + i);
				tmp.put("align", "center");
				jsonHeader.add(tmp);

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
			
			for(int i=0; i<sqlRes.size(); i++) {
				tmp = new JSONObject();
				for(int j=0; j<sqlRes.get(i).size(); j++) {
					tmp.put(j, sqlRes.get(i).get(j));
				}
				jsonValue.add(tmp);
			}
		}
		
		else {
			String strInVals = "";

			if (req.getParameterValues("led1") != null) {
				strInVals += "1, ";
			}

			if (req.getParameterValues("led2") != null) {
				strInVals += "2, ";
			}

			if (req.getParameterValues("led3") != null) {
				strInVals += "3, ";
			}

			if (req.getParameterValues("led4") != null) {
				strInVals += "4, ";
			}

			if (req.getParameterValues("cooler") != null) {
				strInVals += "5, ";
			}

			if (req.getParameterValues("heater") != null) {
				strInVals += "6, ";
			}

			if (req.getParameterValues("conequip") != null) {
				strInVals += "7, ";
			}
			
			strInVals = strInVals.substring(0, strInVals.lastIndexOf(","));
			
			JSONObject tmp = new JSONObject();
			tmp.put("key", 0);
			tmp.put("label", "동작시간");
			tmp.put("align", "center");
			tmp.put("width", 200);
			jsonHeader.add(tmp);

			tmp = new JSONObject();
			tmp.put("key", 1);
			tmp.put("label", "기기 명");
			tmp.put("align", "center");
			tmp.put("width", 300);
			jsonHeader.add(tmp);
			
			tmp = new JSONObject();
			tmp.put("key", 2);
			tmp.put("label", "동작 상태");
			tmp.put("align", "center");
			jsonHeader.add(tmp);
			
			String sqlStTS = req.getParameterValues("startdate")[0] + " " + req.getParameterValues("starttime")[0];
			String sqlEdTS = req.getParameterValues("enddate")[0] + " " + req.getParameterValues("endtime")[0];
			
			String sqlGetGridData = "SELECT  DATE_FORMAT(A1.MACTIME, '%Y-%m-%d %H:%i:%s') MACTIME"
					+ "       ,A2.MCCMEMO                                   MCCMEMO"
					//+ "       ,A1.MACSTAT                                   MACSTAT"
					+ "       ,CASE          "
					+ "           WHEN A2.MCCIDX <> 8 THEN CONCAT(A2.MCCMEMO, ("
					+ "                                                        CASE"
					+ "                                                         WHEN A1.MACSTAT = 1 THEN ' ON'"
					+ "                                                         ELSE                     ' OFF'"
					+ "                                                        END"
					+ "                                                      ))"
					+ "         ELSE CONCAT(A1.MACSTAT, '번 베이로 양액 공급')"
					+ "        END                                         MACSTAT"
					+ "  FROM  MACACT      A1"
					+ "       ,MCCODE      A2"
					+ " WHERE A1.MACMCCO = A2.MCCIDX"
					+ "   AND A2.MCCIDX IN (" + strInVals + ")"
					+ "   AND DATE_FORMAT('" + sqlStTS + "', '%Y-%m-%d %H:%i:%s') <= MACTIME "
					+ "   AND MACTIME <= DATE_FORMAT('" + sqlEdTS + "', '%Y-%m-%d %H:%i:%s')"
					+ " ORDER BY MACTIME;";

			System.out.println(sqlGetGridData);
			
			ArrayList<ArrayList<String>> sqlRes = DB.excuteQuery(sqlGetGridData);
			
			for(int i=0; i<sqlRes.size(); i++) {
				tmp = new JSONObject();
				for(int j=0; j<sqlRes.get(i).size(); j++) {
					tmp.put(j, sqlRes.get(i).get(j));
				}
				jsonValue.add(tmp);
			}
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("GRID_HEADER", jsonHeader);
		jsonObject.put("GRID_DATA", jsonValue);
		String Data = jsonObject.toString();

		try {
			resp.getWriter().print(Data != null ? Data.toString() : "");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
