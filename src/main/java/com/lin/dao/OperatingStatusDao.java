package com.lin.dao;

import com.lin.domain.OldWeightValue;
import com.lin.domain.Value;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OperatingStatusDao {
    //专家打分时，生成输入矩阵需要的数据
    List<Value> selectIndicator_level(@Param("selectName") String selectName );

    void updateComputeWeight(@Param("updateValue") double updateValue ,@Param("updateName") String updateName  );

    //查询权重值的旧值
    List<OldWeightValue> SelectOldWeightValue(@Param("criterionName") String criterionName);



}
