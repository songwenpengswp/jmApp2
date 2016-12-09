package com.jm.app.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Payinfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="payinfo"
    ,catalog="jm"
)

public class Payinfo  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String merchNo;
     private String certNo;
     private String mobile;
     private String accountNo;
     private String accountName;
     private String bankNo;
     private String bankName;
     private String bankType;
     private Integer fee;


    // Constructors

    /** default constructor */
    public Payinfo() {
    }

    
    /** full constructor */
    public Payinfo(String merchNo, String certNo, String mobile, String accountNo, String accountName, String bankNo, String bankName, String bankType, Integer fee) {
        this.merchNo = merchNo;
        this.certNo = certNo;
        this.mobile = mobile;
        this.accountNo = accountNo;
        this.accountName = accountName;
        this.bankNo = bankNo;
        this.bankName = bankName;
        this.bankType = bankType;
        this.fee = fee;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="id", unique=true, nullable=false)

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="merchNo", length=30)

    public String getMerchNo() {
        return this.merchNo;
    }
    
    public void setMerchNo(String merchNo) {
        this.merchNo = merchNo;
    }
    
    @Column(name="certNo", length=30)

    public String getCertNo() {
        return this.certNo;
    }
    
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }
    
    @Column(name="mobile", length=20)

    public String getMobile() {
        return this.mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    @Column(name="accountNo", length=30)

    public String getAccountNo() {
        return this.accountNo;
    }
    
    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }
    
    @Column(name="accountName", length=10)

    public String getAccountName() {
        return this.accountName;
    }
    
    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
    
    @Column(name="bankNo", length=20)

    public String getBankNo() {
        return this.bankNo;
    }
    
    public void setBankNo(String bankNo) {
        this.bankNo = bankNo;
    }
    
    @Column(name="bankName", length=100)

    public String getBankName() {
        return this.bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
    
    @Column(name="bankType", length=20)

    public String getBankType() {
        return this.bankType;
    }
    
    public void setBankType(String bankType) {
        this.bankType = bankType;
    }
    
    @Column(name="fee")

    public Integer getFee() {
        return this.fee;
    }
    
    public void setFee(Integer fee) {
        this.fee = fee;
    }
   








}