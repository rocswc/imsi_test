package com.java.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TranslationRequest {
	
	List<String> text;
	String source_lang;
	String target_lang;

}
