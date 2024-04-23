package kr.kh.team3.model.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ItemListVO {
	private int il_num;
	private String il_title; 
	private String il_list;
	private int il_hp_num;
	
	public ItemListVO(String il_title, String il_list, int hp_num) {
		this.il_title = il_title;
		this.il_list = il_list;
		this.il_num = hp_num;
	}
}
