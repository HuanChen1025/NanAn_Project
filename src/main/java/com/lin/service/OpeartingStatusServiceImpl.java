package com.lin.service;

import com.lin.dao.OperatingStatusDao;
import com.lin.domain.OldWeightValue;
import com.lin.domain.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OpeartingStatusServiceImpl implements OpeartingStatusService {

    @Resource
    private OperatingStatusDao operatingStatusDao;


    /**
     * 专家打分界面返回的数据
     * @param selectName
     * @return
     */
    @Override
    public List<Value> selectIndicator_level(String selectName){
        List<Value> list = operatingStatusDao.selectIndicator_level(selectName);
        return list;
    }

    @Override
    public void updateComputeWeight(double updateValue,String updateName){

        //updateCount 为 update 语句影响的行数
        operatingStatusDao.updateComputeWeight(updateValue,updateName);
    }

    @Override
    public List<OldWeightValue> SelectOldWeightValue(String criterionName){

        List<OldWeightValue> list = operatingStatusDao.SelectOldWeightValue(criterionName);
        return list;
    }




}
