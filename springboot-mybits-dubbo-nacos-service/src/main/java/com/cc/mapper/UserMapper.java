package com.cc.mapper;




import com.cc.pojo.QuotaUserUserd;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
   List<QuotaUserUserd> selectAll();
   void insertUser(QuotaUserUserd quotaUserUserd);
   int  deleteById(Integer useId);
   int updateUser(QuotaUserUserd quotaUserUserd);
   QuotaUserUserd  selectById(Integer useId);

}
