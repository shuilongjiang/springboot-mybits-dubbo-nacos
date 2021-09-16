package com.cc.service;

import com.cc.mapper.UserMapper;
import com.cc.pojo.QuotaUserUserd;
import com.cc.service.QuaryService;
import com.fasterxml.classmate.types.ResolvedRecursiveType;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;

@Service
public class QuarySeviceImpl implements QuaryService {

    @Autowired
    UserMapper userMapper;

    public List<QuotaUserUserd> quaryAll() {
        return userMapper.selectAll();
    }

    public void insertUser(QuotaUserUserd quotaUserUserd) {
        userMapper.insertUser(quotaUserUserd);
    }

    public int deleteById(Integer useId) {
        return userMapper.deleteById(useId);
    }

    public int updateUser(QuotaUserUserd quotaUserUserd) {
        return userMapper.updateUser(quotaUserUserd);
    }

    public QuotaUserUserd selectById(Integer useId) {
        return userMapper.selectById(useId);
    }


}
