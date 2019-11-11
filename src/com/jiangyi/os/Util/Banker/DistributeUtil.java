package com.jiangyi.os.Util.Banker;

import com.jiangyi.os.pojo.ProcessResource;
import org.springframework.context.annotation.PropertySource;

import static com.jiangyi.os.Util.Banker.Safety.checkSafety;

public class DistributeUtil {
    public static  String distributeResource(ProcessResource processResource,int[] request, int chooseProcess) {
        int[][] need = processResource.getNeed();
        int[] available = processResource.getAvailable();
        int[][] allocation = processResource.getAllocation();
        int i=0;
        for ( i = 0; i < 3; i++)
        {
            if (!(request[i]<=need[chooseProcess][i]))
            {
                System.out.println("出错了，它请求的资源大于它所宣布的最大值！");
                return "error";
                //break;//只要有一个不符合就break.
            }
        }
        if(i==3){
            //i=3说明了没有不符合的
            for (i=0;i<3;i++)
            {
                if(!(request[i]<=available[i]))
                {
                    //说明这个时候系统里面没有足够资源
                    System.out.println("候系统里面没有足够资源");
                    return "notEnough";
                    //break;
                }
            }
        }
        if(i==3){
            //这个时候系统尝试分配资源
            for (i=0;i<3;i++){
                available[i]=available[i]-request[i];
                allocation[chooseProcess][i]=allocation[chooseProcess][i]+request[i];
                need[chooseProcess][i]=need[chooseProcess][i]-request[i];
            }
            //而后再进行安全性检查
            String Is_Safety = checkSafety(processResource);
            if (Is_Safety.equals("true")){
                System.out.println("允许本次分配");
                return "permit";
            }
            else {
                //需要撤销分配
                System.out.println("不允许本次分配!撤销！");
                for (i=0;i<3;i++){
                    available[i]=available[i]+request[i];
                    allocation[chooseProcess][i]=allocation[chooseProcess][i]-request[i];
                    need[chooseProcess][i]=need[chooseProcess][i]+request[i];
                }
                return "redo";
            }
        }
        return "false";//这个象征性的写一下，没有实际作用
    }
}
