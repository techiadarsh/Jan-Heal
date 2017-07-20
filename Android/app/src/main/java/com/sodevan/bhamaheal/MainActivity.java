package com.sodevan.bhamaheal;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;
import com.sodevan.bhamaheal.Activity.profile;
import com.sodevan.bhamaheal.Interface.APIservice;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.IOException;
import java.io.StringReader;
import java.util.Calendar;

import retrofit2.Retrofit;

public class MainActivity extends AppCompatActivity {

    String uid, add, name,year;

    Calendar calendar = Calendar.getInstance();
    int y = calendar.get(Calendar.YEAR);


    Button Enter;
    public static final String MyPREFERENCES="login_prefs";
    Retrofit retrofit;
    APIservice apiservice;
    boolean isLoggedIn=false;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        SharedPreferences ds = PreferenceManager.getDefaultSharedPreferences(this) ;
        ds.edit().clear();

        Typeface fa = Typeface.createFromAsset(getAssets(), "fontawesome-webfont.ttf");
        TextView logo = (TextView) findViewById(R.id.logo2);
        Button btn = (Button)findViewById(R.id.ScanButton) ;

        btn.setTypeface(fa);

        logo.setTypeface(fa);
        final Activity activity= this;



        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                IntentIntegrator integrator = new IntentIntegrator(activity);
                integrator.setDesiredBarcodeFormats(IntentIntegrator.QR_CODE_TYPES);
                integrator.setPrompt("SCAN");
                integrator.setCameraId(0);
                integrator.setBeepEnabled(false);
                integrator.setBarcodeImageEnabled(false);
                integrator.initiateScan();
            }
        });



    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {







        IntentResult result= IntentIntegrator.parseActivityResult(requestCode, resultCode,data);
        if (result!=null){
            if(result.getContents()==null){
                Toast.makeText(this, "You Cancelled Scanning", Toast.LENGTH_SHORT).show();
            }else {
                Toast.makeText(this, result.getContents(), Toast.LENGTH_SHORT).show();

//                tv.setText(result.getContents());

                XmlPullParserFactory factory = null;
                try {
                    factory = XmlPullParserFactory.newInstance();
                } catch (XmlPullParserException e) {
                    e.printStackTrace();
                }
                factory.setNamespaceAware(true);
                XmlPullParser xpp = null;
                try {
                    xpp = factory.newPullParser();
                } catch (XmlPullParserException e) {
                    e.printStackTrace();
                }

                try {
                    xpp.setInput( new StringReader( result.getContents() ) );
                } catch (XmlPullParserException e) {
                    e.printStackTrace();
                }
                int eventType = 0;
                try {
                    eventType = xpp.getEventType();
                } catch (XmlPullParserException e) {
                    e.printStackTrace();
                }
                while (eventType != XmlPullParser.END_DOCUMENT) {
                    if(eventType == XmlPullParser.START_DOCUMENT) {
                        System.out.println("Start document");
                    } else if(eventType == XmlPullParser.START_TAG) {
                        System.out.println("Start tag "+xpp.getName());
                        System.out.println(xpp.getAttributeValue(0));
                        uid= xpp.getAttributeValue(0);
                        name=xpp.getAttributeValue(1);

                        year= String.valueOf(y-(Integer.parseInt((xpp.getAttributeValue(3)))));

                        String address=new String();

                        for (int i = 5; i <xpp.getAttributeCount()-1 ; i++) {

                            address+=(" "+xpp.getAttributeValue(i));

                        }

                        add=address;


                        Log.d("DekhBhosadike", name + "   "+ year);



//                        tv.append(address);



                    } else if(eventType == XmlPullParser.END_TAG) {
                        System.out.println("End tag "+xpp.getName());
                    } else if(eventType == XmlPullParser.TEXT) {
                        System.out.println("Text "+xpp.getText());
                    }


                    try {
                        eventType = xpp.next();
                    } catch (XmlPullParserException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                System.out.println("End document");


                SharedPreferences ds = PreferenceManager.getDefaultSharedPreferences(this) ;
                ds.edit().putString("uid" , uid).putString("name" , name).putString("age" , year).putString("add" , add ).commit() ;
                Intent sd =new Intent(this ,profile.class) ;
                startActivity(sd);
                finish();


            }



        }




        super.onActivityResult(requestCode, resultCode, data);
    }
}
