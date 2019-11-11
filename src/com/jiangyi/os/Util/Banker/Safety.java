package com.jiangyi.os.Util.Banker;

import com.jiangyi.os.pojo.ProcessResource;

public class Safety {
    public static String checkSafety(ProcessResource processResource) {
        int[][] allocation = processResource.getAllocation();
        int[] available = processResource.getAvailable();
        int[][] max = processResource.getMax();
        int[][] need = processResource.getNeed();
        int[] work = new int[3];
        System.arraycopy(available, 0, work, 0, 3);//在执行安全算法开始时work=available
        boolean[] finish = new boolean[]{false, false, false, false, false};//finish表示系统是否有足够的资源分配
        int i = 0;
        while (i < 5) {//5个进程
            if (finish[i] == false && need[i][0] <= work[0] && need[i][1] <= work[1] && need[i][2] <= work[2])//都ok才ok
            {
                for (int m = 0; m < 3; m++)
                    work[m] = work[m] + allocation[i][m];
                finish[i] = true;
                i = 0;
            } else {
                i++;
            }
        }
        for (i = 0; i < finish.length; i++) {
            if (finish[i] == false) {
                break;
            }
        }
        if (i == 5) {
            //System.out.println("处于安全状态");
            return "true";
        } else {
            //System.out.println("不安全！");
            return "false";
        }
    }
}
