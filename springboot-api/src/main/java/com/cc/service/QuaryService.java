package com.cc.service;

import com.cc.pojo.QuotaUserUserd;

import java.util.List;

public interface QuaryService {
    List<QuotaUserUserd> quaryAll();
    void insertUser(QuotaUserUserd quotaUserUserd);
    int  deleteById(Integer useId);
    int updateUser (QuotaUserUserd quotaUserUserd);
    QuotaUserUserd  selectById(Integer useId);
}
