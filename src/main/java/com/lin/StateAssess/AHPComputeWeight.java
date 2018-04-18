package com.lin.StateAssess;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

public class AHPComputeWeight {
    /**
     * @param args
     *
     * 计算权重
     *
     * 最大特征向量计算不对
     */
    public static void main(String[] args) {
        /** a为N*N矩阵 */
        //double[][] a = new double[][] {{1,2.833,5},{0.353,1,2.33},{0.2,0.429,1}};
       // double[][] a = new double[][] {{1,4,5},{0.25,1,2},{0.2,0.5,1}};
        //double[][] a = new double[][] {{1,-6.5,1},{-0.25,1,1},{-0.25,1,1}};
        //double[][] a = new double[][] {{1,0.5,4,3,3},{2,1,7,5,5},
       //         {0.25,0.1428,1,0.5,0.333},{0.333,0.2,2,1,1},{0.333,0.2,3,1,1}};

        double[][] a = new double[][] {{1,2,6},{0.5,1,4},{0.1667,0.25,1}};
        int N = a[0].length;
        double[] weight = new double[N];
        AHPComputeWeight instance = AHPComputeWeight.getInstance();
        instance.weight(a, weight, N);
        System.out.println("weight: "+Arrays.toString(weight));
    }


    /**
     * 求取权重矩阵
     * @param list
     * @return
     */
    public double[] getWeight(List<double[][]> list){
        //求平均判断矩阵
        //获取类的实例
        ComputeAverageMatrix computeAverage = ComputeAverageMatrix.getInstance();

        //保存评价判断矩阵的结果
        double[][] avgMartix={};

        //矩阵是否负荷要求
        boolean flag = false;

        //有一种情况，判断矩阵全部不符合要求
        //如果有问题，剔除后再次求取，求平均判断矩阵
        //这里可能涉及到递归
        while (!flag){
            //得到平均判别矩阵，此处的改进地方在于输入参数如何自适应化
            avgMartix =  computeAverage.computeAverageMatrix_list(list);

            //校验判断矩阵是否有效
            //获取校验类的单例
            MartixIsValid martixIsValid = MartixIsValid.getInstance();

            //校验函数，返回 true 说明校验成功
            flag =  martixIsValid.isValid_list(avgMartix,list);

            //如果list的长度为 0 ，说明全部不符合要求
            if (list.size() == 0){
                System.out.println("所选矩阵全部不符合要求，无法计算平均矩阵");
                break;
            }
        }

        if (list.size() == 0){
            return null;

        }
        else {
            //求取平均判断矩阵的最大特征向量和特征值，以及求取权重向量
            AHPComputeWeight computeWeight = AHPComputeWeight.getInstance();
            //权重向量,但是如果list的长度为 0 ，会抛出异常
            int N = list.get(0).length;
            double[] weight = new double[N];
            computeWeight.weight(avgMartix,weight,N);
            return weight;
        }


    }

    // 单例
    private static final AHPComputeWeight acw = new AHPComputeWeight();

    // 平均随机一致性指针
    private double[] RI = { 0.00, 0.00, 0.58, 0.90, 1.12, 1.21, 1.32, 1.41,
            1.45, 1.49 };

    // 随机一致性比率
    private double CR = 0.0;

    // 最大特征值
    private double lamta = 0.0;

    /**
     * 私有构造
     */
    private AHPComputeWeight() {

    }

    /**
     * 返回单例
     *
     * @return
     */
    public static AHPComputeWeight getInstance() {
        return acw;
    }

    /**
     * 计算权重
     *
     * @param a
     * @param weight
     * @param N
     */
    public void weight(double[][] a, double[] weight, int N) {

        double[] w1 = new double[N];
        double[] w2 = new double[N];    //最后的权重
        double sum = 0.0;

        //按行求和
        for (int j = 0; j < N; j++) {
            double t = 0.0;
            for (int l = 0; l < N; l++)
                t += a[l][j];
            w1[j] = t;
        }

        //按行归一化，然后按列求和，最后得到特征向量w2
        for (int k = 0; k < N; k++) {
            sum = 0;
            for (int i = 0; i < N; i++) {
                sum  +=  a[k][i] / w1[i];
            }
            w2[k] = sum / N;
        }

        lamta = 0.0;

        //求矩阵和特征向量的积,然后求出特征值
        for (int k = 0; k < N; k++) {
            sum = 0;
            for (int i = 0; i < N; i++) {
                sum = sum + a[k][i] * w2[i];
            }
            w1[k] = sum;
            lamta = lamta + w1[k] / w2[k];
        }

        // 计算矩阵最大特征值lamta，CI，RI
        lamta = lamta / N;

        double CI = (lamta - N) / (N - 1);

        if (RI[N - 1] != 0) {
            CR = CI / RI[N - 1];
        }

        // 四舍五入处理
        lamta = round(lamta, 4);
        CI = round(CI, 4);
        CR = round(CR, 4);

        for (int i = 0; i < N; i++) {
            w1[i] = round(w1[i], 4);
            w2[i] = round(w2[i], 4);
        }
        // 控制台打印输出

       // System.out.println("lamta=" + lamta);
      //  System.out.println("CI=" + CI);
       // System.out.println("CR=" + CR);

        // 控制台打印权重
       // System.out.println("");

//        System.out.println("w1[]=");
//        for (int i = 0; i < N; i++) {
//            System.out.print(w1[i] + " ");
//        }
//        System.out.println("");
//
//        System.out.println("w2[]=");
        for (int i = 0; i < N; i++) {
            weight[i] = w2[i];
           // System.out.print(weight[i] + " ");
        }
//        System.out.println("");
    }

    /**
     * 四舍五入
     *
     * @param v
     * @param scale
     * @return
     */
    public double round(double v, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException(
                    "The scale must be a positive integer or zero");
        }
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 返回随机一致性比率
     *
     * @return
     */
    public double getCR() {
        return CR;
    }
}