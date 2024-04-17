package kr.kh.team3.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationScheduleVO {
	private int rs_num;
	private int rs_hp_num; 
	private Date rs_date;
	private Date rs_time;
	private int rs_max_person;
	
	public String getRsDate() {
	    if (this.rs_date != null) {
	        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
	        return format.format(this.rs_date);
	    } else {
	        return "없당ㅎㅎ";
	    }
	}
	
}
