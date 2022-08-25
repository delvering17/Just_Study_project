package reservation_p.iamport;

import com.google.gson.*;
import com.siot.IamportRestClient.request.ScheduleEntry;
import com.siot.IamportRestClient.request.escrow.EscrowLogisInvoiceData;
import com.siot.IamportRestClient.response.PaymentBalanceEntry;
import com.siot.IamportRestClient.response.Schedule;
import com.siot.IamportRestClient.response.escrow.EscrowLogisInvoice;
import com.siot.IamportRestClient.serializer.BalanceEntrySerializer;
import com.siot.IamportRestClient.serializer.EscrowInvoiceEntrySerializer;
import com.siot.IamportRestClient.serializer.ScheduleEntrySerializer;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import reservation_p.exception.IamportResponseException;
import reservation_p.request.AuthData;
import reservation_p.request.CancelData;
import reservation_p.response.AccessToken;
import reservation_p.response.IamportResponse;
import reservation_p.response.Payment;
import retrofit2.Call;
import retrofit2.HttpException;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class IamportClient {

	public static final String API_URL = "https://api.iamport.kr";
	public static final String STATIC_API_URL = "https://static-api.iamport.kr";
	protected String apiKey = null;
	protected String apiSecret = null;
	protected String tierCode = null;
	protected Iamport iamport = null;

	public IamportClient(String apiKey, String apiSecret) {
		this.apiKey = apiKey;
		this.apiSecret = apiSecret;
		this.iamport = this.create(false);
	}

	public IamportClient(String apiKey, String apiSecret, boolean useStaticIP) {
		this.apiKey = apiKey;
		this.apiSecret = apiSecret;
		this.iamport = this.create(useStaticIP);
	}

	public IamportClient(String apiKey, String apiSecret, String tierCode) {
		this.apiKey = apiKey;
		this.apiSecret = apiSecret;
		this.tierCode = tierCode;
		this.iamport = this.create(false);
	}

	public IamportClient(String apiKey, String apiSecret, String tierCode, boolean useStaticIP) {
		this.apiKey = apiKey;
		this.apiSecret = apiSecret;
		this.tierCode = tierCode;
		this.iamport = this.create(useStaticIP);
	}

	public void setTierCode(String tier_code) {
		this.tierCode = tier_code;
	}

	public IamportResponse<AccessToken> getAuth() throws IamportResponseException, IOException {
		Call<IamportResponse<AccessToken>> call = this.iamport.token(new AuthData(this.apiKey, this.apiSecret) );
		Response<IamportResponse<AccessToken>> response = call.execute();

		if ( !response.isSuccessful() )	throw new IamportResponseException( getExceptionMessage(response), new HttpException(response) );

		return response.body();
	}

	public IamportResponse<Payment> cancelPaymentByImpUid(CancelData cancelData) throws IamportResponseException, IOException {
		AccessToken auth = getAuth().getResponse();
		Call<IamportResponse<Payment>> call = this.iamport.cancel_payment(auth.getToken(), cancelData);

		Response<IamportResponse<Payment>> response = call.execute();
		if ( !response.isSuccessful() )	throw new IamportResponseException( getExceptionMessage(response), new HttpException(response) );

		return response.body();
	}

	protected Iamport create(boolean useStaticIP) {
		OkHttpClient client = new OkHttpClient.Builder()
				.readTimeout(30, TimeUnit.SECONDS)
				.connectTimeout(10, TimeUnit.SECONDS)
				.addInterceptor(new Interceptor() { //Tier Header
					public okhttp3.Response intercept(Chain chain) throws IOException {
						Request request = chain.request();

						if (IamportClient.this.tierCode != null) {
							request = request.newBuilder().addHeader("Tier", IamportClient.this.tierCode).build();
						}

						return chain.proceed(request);
					}
				})
				.build();

		Retrofit retrofit = new Retrofit.Builder()
								.baseUrl(useStaticIP ? STATIC_API_URL:API_URL)
								.addConverterFactory(buildGsonConverter())
								.client(client)
								.build();

		return retrofit.create(Iamport.class);
	}

	protected GsonConverterFactory buildGsonConverter() {
        GsonBuilder gsonBuilder = new GsonBuilder();

        // Adding custom deserializers
        Object escrowInvoiceStrategy = new EscrowInvoiceEntrySerializer();

        gsonBuilder.registerTypeAdapter(ScheduleEntry.class, new ScheduleEntrySerializer());
        gsonBuilder.registerTypeAdapter(Schedule.class, new ScheduleEntrySerializer());
        gsonBuilder.registerTypeAdapter(PaymentBalanceEntry.class, new BalanceEntrySerializer());
        gsonBuilder.registerTypeAdapter(EscrowLogisInvoiceData.class, escrowInvoiceStrategy);
        gsonBuilder.registerTypeAdapter(EscrowLogisInvoice.class, escrowInvoiceStrategy);

        Gson myGson = gsonBuilder.create();

        return GsonConverterFactory.create(myGson);
    }

	protected String getExceptionMessage(Response<?> response) {
		String error = null;
		try {
			JsonElement element = new JsonParser().parse(response.errorBody().string());
			error = element.getAsJsonObject().get("message").getAsString();
		} catch (JsonSyntaxException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if ( error == null )	error = response.message();

		return error;
	}

}
