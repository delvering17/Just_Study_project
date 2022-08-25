package reservation_p.iamport;


import org.junit.Before;
import org.junit.Test;
import reservation_p.exception.IamportResponseException;
import reservation_p.request.CancelData;
import reservation_p.response.IamportResponse;
import reservation_p.response.Payment;

import java.math.BigDecimal;

public class IamportCancel {

    IamportClient client;
    IamportResponse<Payment> payment_response;

    public IamportCancel() {
        setup();
    }

    @Before
    public void setup() {
        String test_api_key = "5575207425720633";
        String test_api_secret = "MS4qNv47HLCTCKCaggBzq6hgknc3EnVKwqYshagLJX5j3KNc3IHDhns8OoTSbqus6SodAX7CdqqQZ0TW";
        client = new IamportClient(test_api_key, test_api_secret);
    }

    @Test
    public void testCancelPaymentAlreadyCancelledImpUid(String order) {
        CancelData cancel_data = new CancelData(order, true);

        try {
            payment_response = client.cancelPaymentByImpUid(cancel_data);
            System.out.println(payment_response.getMessage()+"전체취소");
        } catch (Exception e) {

        }
    }

    public void testPartialCancelPaymentAlreadyCancelledImpUid(String order, int price) {
        CancelData cancel_data = new CancelData(order, true, BigDecimal.valueOf(price));

        try {
            payment_response = client.cancelPaymentByImpUid(cancel_data);
            System.out.println(payment_response.getMessage()+"부분취소");

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public IamportResponse<Payment> getPayment_response() {
        return payment_response;
    }

    public void setPayment_response(IamportResponse<Payment> payment_response) {
        this.payment_response = payment_response;
    }
}
