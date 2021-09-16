package com.cc.pojo;



import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class QuotaUserUserd implements Serializable {
    private Integer userId;
    private Integer usePsw;
    private String opId;
    private String orgId;
    private String remarks;
}
