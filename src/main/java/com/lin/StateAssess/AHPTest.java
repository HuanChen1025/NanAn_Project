package com.lin.StateAssess;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AHPTest {

    public static void main(String[] args) {

        //确定两两比较矩阵
        //能否将输入进来的数组存储到一个集合中，方便遍历和删除

        // a,b,c 为三个判别矩阵
        double [][] a ={{1,4,5},{0.25,1,2},{0.2,0.5,1}};
        double [][] b ={{1,2,4},{0.5,1,2},{0.25,0.5,1}};
        double [][] c ={{1,2.5,6},{0.4,1,3},{0.167,0.333,1}};

        //将专家的打分记录存储改为使用List
        List<double[][]> list = new ArrayList<double[][]>();
        list.add(a);
        list.add(b);
        list.add(c);

        double[] weight = {};

        //计算环境还要考虑的东西较多，比如稳定性，不能出线指针越界，
        //另外环境还要考虑能够从服务器反馈给打分专家，告诉管理人员，那个打分出问题了
        AHPComputeWeight instance = AHPComputeWeight.getInstance();
        weight =instance.getWeight(list);
        System.out.println(Arrays.toString(weight));




        //确定单项指标评分公式

    }
}
