package com.lin.StateAssess;

import java.util.Arrays;
import java.util.List;

/**
 *  校验判断矩阵是否有效
 *
 *  遍历所有的判别矩阵：和平均矩阵做判断
 *
 *  每一个元素与已经求取平均判别矩阵相比较
 */
public class MartixIsValid {

    //私有构造
    private MartixIsValid(){

    }

    //单例
    private static  final  MartixIsValid instance = new MartixIsValid();

    //返回单例
    public static MartixIsValid getInstance(){
        return instance;
    }

    /**
     *
     * @param avgMartix
     * @param list
     * @return
     */
    public boolean  isValid_list(double[][] avgMartix,List<double[][]> list){
        //校验输入
        if (avgMartix == null || list == null)
            return false;
        if (avgMartix.length == 0 || list.size() == 0)
            return false;

        //矩阵的维度
        int len = avgMartix.length;

        //保存输入list 的 长度，便于之后的比较
        int listLen = list.size();

        //获取二维数组的个数,用于循环遍历
        int arrayLen = list.size();

        //判断该矩阵的离散度
        for (int i=0;i<len;i++){
            for (int j=0;j<len;j++){
                for (int k=0;k<arrayLen;k++){
                    //如果这个矩阵不符合要求，删除它并跳出循环
                    if ( list.get(k)[i][j] - avgMartix[i][j]>avgMartix[i][j]/2){
                        System.out.println("删除矩阵：");
                        list.remove(list.get(k));
                       arrayLen = arrayLen-1;
                       break;
                    }
                }
            }
        }
        //如果遍历完之后list 的长度和arrayLen相等。说明符合要求，否则返回重新计算
       return list.size() == listLen ?true:false;
    }
}
