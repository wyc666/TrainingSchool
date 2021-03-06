package nju.wjw.dao;

import nju.wjw.dao.base.BaseDao;
import nju.wjw.entity.Account;
import org.springframework.stereotype.Repository;

/**
 * Created by Jerry Wang on 2017/2/13.
 */
@Repository
public class AccountDao extends BaseDao<Account,Integer> {

    public Account getAccountbyAccountNumber(String accountNumber){
        return getByHQL("from Account where accountNumber=?",accountNumber);
    }

}
