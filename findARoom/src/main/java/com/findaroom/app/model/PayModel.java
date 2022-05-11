package com.findaroom.app.model;

public class PayModel {
	private double amount;
    private double taxAmount;
    private double productSC;
    private double productDC;
    private double totalAmount;
    private String merchantName;
    private String merchantId;

    private final  double taxRate = 13.00;
    private final double pscRate = 2.00;
    private final double pdcRate = 3.00;

    public double getPscRate() {
        return pscRate;
    }

    public double getPdcRate() {
        return pdcRate;
    }
    
    public PayModel() {
    }

    public PayModel(double amount, double taxAmount, double productSC, double productDC, double totalAmount, String merchantName, String merchantId) {
        this.amount = amount;
        this.taxAmount = taxAmount;
        this.productSC = productSC;
        this.productDC = productDC;
        this.totalAmount = totalAmount;
        this.merchantName = merchantName;
        this.merchantId = merchantId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getTaxAmount() {
        return taxAmount;
    }

    public void setTaxAmount(double taxAmount) {
        this.taxAmount = taxAmount;
    }

    public double getProductSC() {
        return productSC;
    }

    public void setProductSC(double productSC) {
        this.productSC = productSC;
    }

    public double getProductDC() {
        return productDC;
    }

    public void setProductDC(double productDC) {
        this.productDC = productDC;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public double getTaxRate() {
        return taxRate;
    }
    
    
    
}
