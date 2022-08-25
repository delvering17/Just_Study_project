package reservation_p.iamport;


import org.junit.Before;
import org.junit.Test;
import reservation_p.exception.IamportResponseException;
import reservation_p.request.CancelData;
import reservation_p.response.IamportResponse;
import reservation_p.response.Payment;

import java.io.IOException;

public class IamportRestTest {

    IamportClient client;
    String order = "imp_521570433605";

    @Before
    public void setup() {
        String test_api_key = "5575207425720633";
        String test_api_secret = "MS4qNv47HLCTCKCaggBzq6hgknc3EnVKwqYshagLJX5j3KNc3IHDhns8OoTSbqus6SodAX7CdqqQZ0TW";
        client = new IamportClient(test_api_key, test_api_secret);
    }

    @Test
    public void testCancelPaymentAlreadyCancelledImpUid() {
        String test_already_cancelled_imp_uid = order;
        CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소

        try {
            IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);

           /* assertNull(payment_response.getResponse());*/
            // 이미 취소된 거래는 response가 null이다
            System.out.println(payment_response.getResponse());
        } catch (IamportResponseException e) {
            System.out.println(e.getMessage());

            switch (e.getHttpStatusCode()) {
                case 401:
                    //TODO
                    break;
                case 500:
                    //TODO
                    break;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
