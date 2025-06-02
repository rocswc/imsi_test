package com.java.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.java.service.HumanService;
import com.java.vo.HumanVO;

@Controller
public class KakaoController {

    @Autowired
    private HumanService humanService;

    @RequestMapping("/kakaoLogin")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {

        // 1. access_token 요청
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "0b582480692a1acc336163c086a3eb8d");
        params.add("redirect_uri", "http://localhost:8080/trip/kakaoLogin");
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<>(params, headers);

        ResponseEntity<String> tokenResponse = restTemplate.postForEntity(
                "https://kauth.kakao.com/oauth/token",
                tokenRequest,
                String.class
        );

        JSONObject tokenJson = new JSONObject(tokenResponse.getBody());
        String accessToken = tokenJson.getString("access_token");

        // 2. 사용자 정보 요청
        HttpHeaders userHeaders = new HttpHeaders();
        userHeaders.set("Authorization", "Bearer " + accessToken);
        HttpEntity<String> userRequest = new HttpEntity<>(userHeaders);

        ResponseEntity<String> userInfoResponse = restTemplate.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.GET,
                userRequest,
                String.class
        );

        JSONObject userJson = new JSONObject(userInfoResponse.getBody());
        String kakaoId = userJson.get("id").toString();
        String nickname = userJson.getJSONObject("kakao_account")
                                  .getJSONObject("profile")
                                  .getString("nickname");

        // 3. 회원 DB 처리 (이메일 없이)
        HumanVO kakaoUser = new HumanVO();
        kakaoUser.setHuman_id("kakao_" + kakaoId);  // 고유 ID
        kakaoUser.setHuman_pass("kakao");           // 더미 패스워드
        kakaoUser.setHuman_name(nickname);
        kakaoUser.setHuman_state("normal");
        kakaoUser.setHuman_blacklist("N");
        kakaoUser.setHuman_birth("000101");

        HumanVO exist = humanService.getCheckId(kakaoUser);
        if (exist == null) {
        	 humanService.insertKakaoUser(kakaoUser);
        }

        // 4. 세션에 저장
        session.setAttribute("loginUser", kakaoUser);

        return "redirect:/index2.jsp";
    }
}