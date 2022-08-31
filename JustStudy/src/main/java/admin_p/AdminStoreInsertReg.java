package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.BranchDAO;
import model_p.BranchDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;

public class AdminStoreInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String path = request.getRealPath("/img/branch");
        //todo : 배포할땐 뒤에꺼 주석처리

        int size = 1024 * 1024 * 10;

        try {
            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            BranchDTO branchDTO = new BranchDTO();

            branchDTO.setCity(mr.getParameter("cityName"));
            branchDTO.setName(mr.getParameter("branchName").trim());

            if(mr.getParameterValues("roomType").length > 0){
                ArrayList<String> roomType = new ArrayList<String>();
                int roomCnt = 1;
                for(int i = 0; i < mr.getParameterValues("roomType").length; i++){
                    for(int k = 0; k < Integer.parseInt(mr.getParameterValues("roomNum")[i]); k++){
                        roomType.add("룸"+roomCnt+")"+mr.getParameterValues("roomType")[i]);
                        roomCnt++;
                    }
                }
                branchDTO.setRooms(String.join(",", roomType));
            }else{
                branchDTO.setRooms("");
            }

            branchDTO.setPrice(Integer.parseInt(mr.getParameter("price").trim()));
            branchDTO.setOpen(Integer.parseInt(mr.getParameter("open").trim()));
            branchDTO.setClose(Integer.parseInt(mr.getParameter("close").trim()));
            branchDTO.setAddress(mr.getParameter("address").trim());
            branchDTO.setAddressDetail(mr.getParameter("addressDetail").trim());
            branchDTO.setPhone(mr.getParameter("phone").trim());
            branchDTO.setImg(mr.getFilesystemName("img").trim());
            branchDTO.setFacilities((mr.getParameterValues("facilities") != null ? String.join(",", mr.getParameterValues("facilities")) : null));

            double[] latlng = findLatlng(mr.getParameter("address"));

            branchDTO.setLongitude(latlng[0]);
            branchDTO.setLatitude(latlng[1]);


            String msg = "추가 실패";

            if(new BranchDAO().insert(branchDTO) > 0){
                msg = "추가 완료되었습니다.";
            };

            request.setAttribute("msg", msg);
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("goUrl", "AdminStoreDetail?branchName="+mr.getParameter("branchName"));

        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    public double[] findLatlng(String inputAddress) {

        String GEOCODE_URL="http://dapi.kakao.com/v2/local/search/address.json?query=";
        String GEOCODE_USER_INFO="7cdddba1d52cb71bb4fe171be274adf2";

        URL obj;
        double [] latlng = new double[2];
        try{
            //인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
            String address = URLEncoder.encode(inputAddress, "UTF-8");

            obj = new URL(GEOCODE_URL+address);

            HttpURLConnection con = (HttpURLConnection)obj.openConnection();

            //get으로 받아오면 된다. 자세한 사항은 카카오개발자센터에 나와있다.
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", "KakaoAK " + GEOCODE_USER_INFO);
            con.setRequestProperty("content-type", "application/json");
            con.setDoOutput(true);
            con.setUseCaches(false);
            con.setDefaultUseCaches(false);

            Charset charset = Charset.forName("UTF-8");
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));

            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            JSONParser jsonParse = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParse.parse(response.toString());
            JSONArray documentsArr = (JSONArray) jsonObj.get("documents");
            JSONObject addressObj = (JSONObject) documentsArr.get(0);
            JSONObject personObject = (JSONObject) addressObj.get("address");

            latlng = new double[]{Double.parseDouble(personObject.get("x").toString()),Double.parseDouble(personObject.get("y").toString()) };
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return latlng;
    }



}