package com.lin.controller;

import com.lin.StateAssess.AHPComputeWeight;
import com.lin.domain.OldWeightValue;
import com.lin.domain.Value;
import com.lin.service.OpeartingStatusService;

import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user")
public class OpeartingStatusController extends BaseController {

    @Resource
    private OpeartingStatusService opeartingStatusService;
    private Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(value="/first")
    public String main(){
        return "operatingStatus/first";
    }

    @RequestMapping(value="/selectCriterionName.do",method= RequestMethod.POST)
    @ResponseBody
    public String selectIndicator_level(String selectName) {
        logger.info("请求查询当前选择的打分指标层的数据，selectName{}",selectName);

        JSONObject json = new JSONObject(); //用于给子层命名
        try {
            List<Value> list = opeartingStatusService.selectIndicator_level(selectName);

            json.put("selectName", list);
            return responseSuccess(json);
        }
        catch (Exception e) {

            return responseFail(e.getMessage());
        }
    }

    /**
     *
     * @param allInputNumber 前端传入的所有 input
     * @param len   传入数组的行数和列数
     * @param expertNumber  传入的专家人数，也就是表格的个数
     * @return
     */
    @RequestMapping(value="/computeWeight.do",method= RequestMethod.POST)
    @ResponseBody
    public String computeWeight(double[] allInputNumber,int len,int expertNumber){
        logger.info("请求查询的所有输入数据，allInputNumber{}",Arrays.toString(allInputNumber));

        JSONObject json = new JSONObject(); //用于给子层命名,封装json格式

        if (allInputNumber.length == 0 || allInputNumber == null){
            return responseFail("error");
        }

        try {
            int validLen = len*(len-1)/2;

            List<double[][]> list = new ArrayList<double[][]>();



            int arrayIndex = 0;

            for (int k=0;k<expertNumber;k++){
                double [][] array = new double[len][len];
                for (int i=0;i<len;i++){
                    for (int j=i+1;j<len;j++){
                        array[i][j] = allInputNumber[arrayIndex];
                        arrayIndex++;
                        if (array[i][j] != 0){
                            array[j][i] = 1/array[i][j];
                        }
                        else {
                            array[j][i] = 0;
                        }
                    }
                }
                for (int i=0;i<len;i++){
                    array[i][i]=1;
                }
                list.add(array);
            }

            double[] weight = {};

            AHPComputeWeight instance = AHPComputeWeight.getInstance();

            weight =instance.getWeight(list);
            if (weight.length>0){
                json.put("data",weight);
            }
            else {
                //json.put("data",-1);
                return responseFail("error");
            }
            System.out.println(Arrays.toString(weight));



            return responseSuccess(json);
        }
        catch (Exception e) {

            return responseFail(e.getMessage());
        }

    }


    /**
     *
     * @param updateValue 需要更新的值的数组
     * @param updateName  需要更新的值的名称
     * @return
     */
    @RequestMapping(value="/updateWeight.do",method= RequestMethod.POST)
    @ResponseBody
    public String updateWeight(double[] updateValue,String[] updateName){
        logger.info("权重更新数据传入，updateValue{}",Arrays.toString(updateValue));

        JSONObject json = new JSONObject(); //用于给子层命名
        try {
            /**
             * 如果传入本身就为空的话，可以考虑返回错误页面
             */
            if (updateName == null || updateValue == null) {
                json.put("result", 0);
            }


            if (updateName.length == 0 || updateValue.length == 0)
                json.put("result", 0);

            int updateNameLen = updateName.length;
            int updateValueLen = updateValue.length;

            /**
             * 如果两个数组的长度不一致，说明传入的数据本身就有问题
             */
            int sum = 0;

            if (updateNameLen != updateValueLen) {
                json.put("result", 0);
            } else {
                for (int i = 0; i < updateNameLen; i++) {
                     opeartingStatusService.updateComputeWeight(updateValue[i], updateName[i]);
                }
                json.put("result", 1);
            }

            return responseSuccess(json);
        }
        catch (Exception e){
            return responseFail(e.getMessage());
        }

    }

    @RequestMapping(value="/selectOldWeight.do",method= RequestMethod.POST)
    @ResponseBody
    public String SelectOldWeightValue(String criterionName){
        logger.info("查询旧的权重值，criterionName{}",criterionName);

        JSONObject json = new JSONObject(); //用于给子层命名

        try{
            List<OldWeightValue> list = opeartingStatusService.SelectOldWeightValue(criterionName);
            json.put("result",list);
            return responseSuccess(json);
        }
        catch (Exception e){
            return responseFail(e.getMessage());
        }



    }

    }
