package reservation_p.iamport;


import com.siot.IamportRestClient.response.PagedDataList;
import com.siot.IamportRestClient.response.PaymentBalance;
import reservation_p.request.AuthData;
import reservation_p.request.CancelData;
import reservation_p.response.AccessToken;
import reservation_p.response.IamportResponse;
import reservation_p.response.Payment;
import retrofit2.Call;
import retrofit2.http.*;

import java.util.List;

public interface Iamport {

	@POST("/users/getToken")
	Call<IamportResponse<AccessToken>> token(
		@Body AuthData auth);

	@POST("/payments/cancel")
	Call<IamportResponse<Payment>> cancel_payment(
		@Header("Authorization") String token,
		@Body CancelData cancel_data
	);

}
