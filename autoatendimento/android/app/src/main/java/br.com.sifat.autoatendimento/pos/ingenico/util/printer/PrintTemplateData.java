package br.com.sifat.autoatendimento.pos.ingenico.util.printer;

import com.alibaba.fastjson.JSON;

/**
 * PrintTemplateData
 * Created by Bear on 2017/6/16.
 */

public class PrintTemplateData {
    //condition
    private boolean playEnglishFlag;

    // Label
    public String MERCHANT_NAME = "MERCHANT_NAME";
    public String MERCHANT_NO = "MERCHANT_NO";
    public String TERMINAL_NO = "TERMINAL_NO";
    public String OPERATOR_NO = "OPERATOR_NO";
    public String ACQUIRER = "ACQUIRER";
    public String ISSUER = "ISSUER";

    public String CARD_NO = "CARD_NO";
    public String EXPIRY_DATE = "EXPIRY_DATE";
    public String TRANSACTION_TYPE = "TRANSACTION_TYPE";
    public String BATCH_NO = "BATCH_NO";
    public String DATE_TIME = "DATE_TIME";
    public String AMOUNT = "AMOUNT";

    public boolean isPlayEnglishFlag() {
        return playEnglishFlag;
    }

    public String toJSONString() {
        return JSON.toJSONString(this);
    }
}
