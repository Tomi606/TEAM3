package kr.kh.team3.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {
	private int co_num;
	private String co_content;
	private Date co_date;
	private int co_report_count;
	private int co_po_num;
	private int co_mg_num;
}
