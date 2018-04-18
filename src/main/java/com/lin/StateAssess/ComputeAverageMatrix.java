package com.lin.StateAssess;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

/**
 * 求取求平均判断矩阵
 */
public class ComputeAverageMatrix {


    //单例
    private static final  ComputeAverageMatrix instance = new ComputeAverageMatrix();


    /**
     * 私有构造函数
     */
    private ComputeAverageMatrix(){

    }

    //返回单例
    public static ComputeAverageMatrix getInstance(){
        return instance;
    }

    /**
     * 修改为采用list计算
     *  * 平均判断矩阵也要满足对角线对称，处理方式如下：
     * 1）所有两两判断矩阵中主对角线的元素均为1，不作处理
     * 2）仅对 m 个两两判断矩阵中主对角线以上部分的 n(n-1)/2 个元素作平均化处理
     * 3）翻转上半部分到下半部分，其中值为倒数
     * @param list
     * @return
     */
    public  double[][] computeAverageMatrix_list(List<double[][]> list){
        //校验输入
        if (list== null || list.size()==0)
            return null;
        //获取数组的长度
        int len = list.get(0).length;

        //获取二维数组的个数,用于循环遍历
        int arrayLen = list.size();

        double[][] res = new double[len][len];    //返回结果集


        for (int i=0;i<len;i++){
            for (int j=i+1;j<len;j++){
                double sum =0;
                for (int k=0;k<arrayLen;k++){
                    sum += list.get(k)[i][j];
                }
                //将右上角平均花的值写入到返回数组中
                res[i][j] = sum/3;
                //翻转 res 数组，沿对角线翻转，其下方的值为上方的倒数,边计算边翻转
                res[j][i] = 1/res[i][j];
                //四舍五入，保留有效位为4位
                res[i][j] = round(res[i][j],4);
                res[j][i] = round(res[j][i],4);
            }
        }
        //将对角线上的值置为 1
        for (int i=0;i<res.length;i++){
            res[i][i] = 1;
        }

        // System.out.println(Arrays.toString(res[0]));

        //平均判断矩阵
        return res;
    }

    /**
     * 四舍五入
     *
     * @param v
     * @param scale
     * @return
     */
    private static double round(double v, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException(
                    "The scale must be a positive integer or zero");
        }
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 测试的主函数，
     * 上线的时候应该去除
     * @param args
     */
    public static void main(String[] args) {
        double [][] a ={{1,4,5},{0.25,1,2},{0.2,0.5,1}};
        double [][] b ={{1,2,4},{0.5,1,2},{0.25,0.5,1}};
        double [][] c ={{1,2.5,6},{0.4,1,3},{0.167,0.333,1}};

       // computeAverageMatrix(a,b,c);
    }
}
