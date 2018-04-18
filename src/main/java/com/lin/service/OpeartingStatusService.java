package com.lin.service;


import com.lin.domain.OldWeightValue;
import com.lin.domain.Value;

import java.util.List;

public interface OpeartingStatusService  {
    List<Value> selectIndicator_level(String selectName);
    void updateComputeWeight(double updateValue,String updateName);
    List<OldWeightValue> SelectOldWeightValue(String criterionName);
}
