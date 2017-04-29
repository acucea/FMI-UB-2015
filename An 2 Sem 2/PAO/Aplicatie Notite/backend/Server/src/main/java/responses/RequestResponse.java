package responses;

import net.sf.json.JSONObject;


/**
 * Created by calin on 20.04.2017.
 */
public class RequestResponse {

    private int status;
    private String body;
    private String message;

    public RequestResponse(int status, String body, String message) {
        this.status = status;
        this.body = body;
        this.message = message;
    }

    public JSONObject toJson(){
        JSONObject js = new JSONObject();
        js.put("status", status);
        js.put("boby" ,body);
        js.put("message", message);
        return js;
    }

    //private JsonObject jsonObject;








}
