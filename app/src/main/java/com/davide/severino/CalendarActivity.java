package com.davide.severino;

import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class CalendarActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        TextView tv = new TextView(this);
        tv.setText("📆 CalendarActivity - Coming soon...");
        tv.setTextSize(20);
        tv.setPadding(50, 100, 50, 50);
        setContentView(tv);
    }
}