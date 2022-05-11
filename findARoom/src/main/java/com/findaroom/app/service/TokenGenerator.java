
package com.findaroom.app.service;

import com.findaroom.app.model.TransactionRequestDTO;
import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Enumeration;

@Component
public class TokenGenerator {
    public String generateToken(String date, String transactionId, TransactionRequestDTO requestDTO) {
        StringBuilder stringBuilder = new StringBuilder();
        String tokenParam = stringBuilder.append("MERCHANTID=896,APPID=MER-896-APP-1,APPNAME=Test,")
                .append("TXNID=").append(transactionId).append(",TXNDATE=").append(date)
                .append(",TXNCRNCY=NPR,").append("TXNAMT=").append(requestDTO.getTXNAMT())
                .append(",REFERENCEID=").append(transactionId)
                .append(",REMARKS=").append(requestDTO.getREMARKS())
                .append(",PARTICULARS=PART-001,TOKEN=TOKEN").toString();

//        String tokenData="MERCHANTID=896,APPID=MER-896-APP-1,APPNAME=Test,TXNID=123,TXNDATE=2020-04-19,TXNCRNCY=NPR,TXNAMT=1200,REFERENCEID=123,REMARKS=test,PARTICULARS=PART-001,TOKEN=TOKEN";
        try {
            System.out.println(tokenParam);
            String token = generateHashCode(tokenParam);
            System.out.println("Token:  " + token);
            return token;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private String generateHashCode(String stringToHash) {
        try {

            String PFX_FILE_LOCATION = this.getClass().getClassLoader().getResource("BDISP.pfx").getFile();
            String PFX_PASSWORD = "123";

            KeyStore store = KeyStore.getInstance("PKCS12");
            File uploadedFile = new File(PFX_FILE_LOCATION);
            store.load(new FileInputStream(uploadedFile), PFX_PASSWORD.toCharArray());

            Enumeration es = store.aliases();
            String alias = "";
            while (es.hasMoreElements()) {
                alias = (String) es.nextElement();
            }
            KeyStore.PrivateKeyEntry pkEntry = (KeyStore.PrivateKeyEntry) store.getEntry(alias, new KeyStore.PasswordProtection(PFX_PASSWORD.toCharArray()));
            PrivateKey privateKey = pkEntry.getPrivateKey();
            String privatePem = Base64Utils.encodeToString(privateKey.getEncoded());
            return signSHA256RSA(stringToHash, privatePem);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static String signSHA256RSA(String input, String privateKey) throws Exception {
        byte[] encodedKey = Base64Utils.decodeFromString(privateKey);
        PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(encodedKey);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        Signature privateSignature = Signature.getInstance("SHA256withRSA");
        privateSignature.initSign(kf.generatePrivate(spec));
        privateSignature.update(input.getBytes(StandardCharsets.UTF_8));
        return Base64Utils.encodeToString(privateSignature.sign());
    }

    public static void main(String[] args) {
        System.out.println(new TokenGenerator().generateHashCode("MERCHANTID=896,APPID=MER-896-APP-1,APPNAME=Test,TXNID=20b87baf,TXNDATE=2020-04-26,TXNCRNCY=NPR,TXNAMT=50000,REFERENCEID=20b87baf,REMARKS=test,PARTICULARS=PART-001,TOKEN=TOKEN"));
    }

}