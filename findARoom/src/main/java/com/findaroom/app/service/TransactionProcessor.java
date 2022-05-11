
package com.findaroom.app.service;
import  com.findaroom.app.model.TransactionRequestDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.UUID;

@Component
public class TransactionProcessor {


    private final TokenGenerator tokenGenerator;

    @Autowired
    public TransactionProcessor( TokenGenerator tokenGenerator) {
        this.tokenGenerator = tokenGenerator;
    }

//    public ResponseEntity<String> processTransaction(TransactionRequestDTO requestDTO) {
//        String url = "https://uat.connectips.com:7443/connectipswebgw/loginpage";
//        HttpEntity<MultiValueMap<String, String>> multiValueMapHttpEntity = buildRequest(requestDTO);
//        ResponseEntity<String> response = restTemplate.postForEntity(url, multiValueMapHttpEntity, String.class);
//        System.out.println(response);
//        return response;
//
//    }
//
//    private HttpEntity<MultiValueMap<String, String>> buildRequest(TransactionRequestDTO requestDTO) {
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//        String transactionDate = LocalDate.now().toString();
//        String transactionId = UUID.randomUUID().toString().split("-")[0];
//        MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
//        map.add("MERCHANTID", "896");//
//        map.add("APPID", "MER-896-APP-1");//
//        map.add("APPNAME", "Test");//
//        map.add("TXNID", transactionId);
//        map.add("TXNDATE", transactionDate);
//        map.add("TXNCRNCY", "NPR");
//        map.add("TXNAMT", String.valueOf(requestDTO.getTXNAMT()));
//        map.add("REFERENCEID", transactionId);
//        map.add("REMARKS", requestDTO.getREMARKS());
//        map.add("PARTICULARS", "PART-001");
////        map.add("TOKEN", "SJFE+ADI7YwGat15/pIvJk+bj83uNgh24xHos7uAvoLM7h8Calo8mR1o2MUaRDJjrcaAyzVQfN7FdzYlrBszNUug2SsaOcnH7JqXo4R8qO0tRTkCYhETLshql5iwVhW92D/HKr7kmyxKbyC+o5V+2naC6NmSRQXExdpqVPFYzpprh+R+dWpWXuWjUsdZ37ksaipqmkh7ZFgVa8N3YSNSGJPR/Qrg+9QZzyu3FmVe3+Yvq6n6+tPs27ktpvlj7P0UqpcDFM1LmiQa0ZSux0BFNMvsd3BBQ4NCHb0wJu0GCGjN+VFEEkBjA6gDybT5ChbE2QogynEkJ5UMe2v3Pp6IrA==");
//        map.add("TOKEN", tokenGenerator.generateToken(transactionDate, transactionId, requestDTO));
//        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
//        return request;
//    }

    public TransactionRequestDTO getTransactionRequest(TransactionRequestDTO requestDTO) {
        String transactionDate = LocalDate.now().toString();
        String transactionId = UUID.randomUUID().toString().split("-")[0];
        TransactionRequestDTO transactionRequestDTO = new TransactionRequestDTO();
        transactionRequestDTO.setMERCHANTID(896);
        transactionRequestDTO.setAPPID("MER-896-APP-1");
        transactionRequestDTO.setAPPNAME("Test");
        transactionRequestDTO.setTXNID(transactionId);
        transactionRequestDTO.setTXNDATE(transactionDate);
        transactionRequestDTO.setTXNCRNCY("NPR");
        transactionRequestDTO.setTXNAMT(requestDTO.getTXNAMT());
        transactionRequestDTO.setREFERENCEID(transactionId);
        transactionRequestDTO.setREMARKS(requestDTO.getREMARKS());
        transactionRequestDTO.setPARTICULARS("PART-001");
        transactionRequestDTO.setTOKEN(tokenGenerator.generateToken(transactionDate, transactionId, requestDTO));
        return transactionRequestDTO;
    }
}
