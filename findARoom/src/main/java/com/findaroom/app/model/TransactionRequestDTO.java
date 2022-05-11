package com.findaroom.app.model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

public class TransactionRequestDTO {
    private int MERCHANTID;
    private String APPID;
    private String APPNAME;
    private String TXNID;
    private String TXNDATE;
    private String TXNCRNCY;
    private int TXNAMT;
    private String REFERENCEID;
    private String REMARKS;
    private String PARTICULARS;
    private String TOKEN;
    
    public int getMERCHANTID() {
		return MERCHANTID;
	}
	public void setMERCHANTID(int mERCHANTID) {
		MERCHANTID = mERCHANTID;
	}
	public String getAPPID() {
		return APPID;
	}
	public void setAPPID(String aPPID) {
		APPID = aPPID;
	}
	public String getAPPNAME() {
		return APPNAME;
	}
	public void setAPPNAME(String aPPNAME) {
		APPNAME = aPPNAME;
	}
	public String getTXNID() {
		return TXNID;
	}
	public void setTXNID(String tXNID) {
		TXNID = tXNID;
	}
	public String getTXNDATE() {
		return TXNDATE;
	}
	public void setTXNDATE(String tXNDATE) {
		TXNDATE = tXNDATE;
	}
	public String getTXNCRNCY() {
		return TXNCRNCY;
	}
	public void setTXNCRNCY(String tXNCRNCY) {
		TXNCRNCY = tXNCRNCY;
	}
	public int getTXNAMT() {
		return TXNAMT;
	}
	public void setTXNAMT(int tXNAMT) {
		TXNAMT = tXNAMT;
	}
	public String getREFERENCEID() {
		return REFERENCEID;
	}
	public void setREFERENCEID(String rEFERENCEID) {
		REFERENCEID = rEFERENCEID;
	}
	public String getREMARKS() {
		return REMARKS;
	}
	public void setREMARKS(String rEMARKS) {
		REMARKS = rEMARKS;
	}
	public String getPARTICULARS() {
		return PARTICULARS;
	}
	public void setPARTICULARS(String pARTICULARS) {
		PARTICULARS = pARTICULARS;
	}
	public String getTOKEN() {
		return TOKEN;
	}
	public void setTOKEN(String tOKEN) {
		TOKEN = tOKEN;
	}
	
    
}
