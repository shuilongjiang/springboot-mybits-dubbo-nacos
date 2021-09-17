package com.cc.controller;

import com.cc.pojo.QuotaUserUserd;
import com.cc.service.QuaryService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/quota")
@RestController
public class QuaryAllController {

    @Reference
    QuaryService quaryAllServiceImp;

    @RequestMapping("/insert")
    public void QuaryTest(@RequestBody QuotaUserUserd quotaUserUserd) {
        System.out.println("QuotaUserUserd:" + quotaUserUserd.toString());
        quaryAllServiceImp.insertUser(quotaUserUserd);
    }

    @RequestMapping("/queryAll")
    public List<QuotaUserUserd> quaryAll() {
        return quaryAllServiceImp.quaryAll();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public Integer deleteById(Integer useId) {
        return quaryAllServiceImp.deleteById(useId);
    }

    @RequestMapping("/update")
    public Integer updataById(@RequestBody QuotaUserUserd quotaUserUserd) {
        return quaryAllServiceImp.updateUser(quotaUserUserd);
    }

    @RequestMapping(value = "/selectbyid",method= RequestMethod.GET)
    public QuotaUserUserd selectById(Integer id){
        System.out.println("+++++"+id);
        return quaryAllServiceImp.selectById(id);
    }
}
