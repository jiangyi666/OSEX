package com.jiangyi.os.pojo;

/**
 * 进程对于资源的获取
 */
public class ProcessResource {
    private int Max[][]=new int[][]{{7,5,3},
                                    {3,2,2},
                                    {9,0,2},
                                    {2,2,2},
                                    {4,3,3}};//进程需要的最大资源数
    private int Allocation[][]=new int[][]{{0,1,0},
            {2,0,0},
            {3,0,2},
            {2,1,1},
            {0,0,2}};//Allocation[i][j]表示进程i当前已经分得j类资源的数目
    private int Need[][]=new int[][]{{7,4,3},
            {1,2,2},
            {6,0,0},
            {0,1,1},
            {4,3,1}};//Need[i][j]表示进程i还需要j类资源的数量
    private int Available[]=new int[]{3,3,2};//Available[j]表示系统中现有j类资源的数量

    public int[][] getMax() {
        return Max;
    }

    public void setMax(int[][] max) {
        Max = max;
    }

    public int[][] getAllocation() {
        return Allocation;
    }

    public void setAllocation(int[][] allocation) {
        Allocation = allocation;
    }

    public int[][] getNeed() {
        return Need;
    }

    public void setNeed(int[][] need) {
        Need = need;
    }

    public int[] getAvailable() {
        return Available;
    }

    public void setAvailable(int[] available) {
        Available = available;
    }

   /*

    int Max0[]=new int[]{7,5,3};//进程需要的最大资源数
        int Allocation[][]=new int[][]{{0,1,0},
                                        {2,0,0},
                                        {3,0,2},
                                        {2,1,1},
                                        {0,0,2}};//Allocation[i][j]表示进程i当前已经分得j类资源的数目
        int Need[][]=new int[][]{{7,4,3},
                                {1,2,2},
                                {6,0,0},
                                {0,1,1},
                                {4,3,1}};//Need[i][j]表示进程i还需要j类资源的数量
        int Available[]=new int[]{3,3,2};//Available[j]表示系统中现有j类资源的数量
     */
}
