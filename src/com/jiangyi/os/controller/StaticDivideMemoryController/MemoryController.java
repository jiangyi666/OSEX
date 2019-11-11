package com.jiangyi.os.controller.StaticDivideMemoryController;

import com.jiangyi.os.pojo.CommitDivideInfo;
import com.jiangyi.os.pojo.ProcessCell;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;

/**
 * 固定分区内存分配
 */
@Controller
@RequestMapping("staticDivideMemory")
public class MemoryController {
    ProcessCell processCell=new ProcessCell();
    CommitDivideInfo backInfo=new CommitDivideInfo();//这个用来回显
    String releaseName;
    @RequestMapping("get")
    public String getProcessCell(Model model) {
        model.addAttribute("processCell",processCell);//用来给前端回显
        model.addAttribute("backInfo",backInfo);//把提交的信息拿给前端回显
        model.addAttribute("releaseName",releaseName);
        return "staticDivideMemory";
    }

    /**
     * 用来分配
     * @param commitDivideInfo
     * @return
     */
    @RequestMapping("divide")
    @ResponseBody
    public String divideMemory(CommitDivideInfo commitDivideInfo){
        String status=null;//用来记录分区的状态
        String commitProcessName = commitDivideInfo.getProcessName();
        int commitNeedSize = commitDivideInfo.getNeedSize();
        String[] singal = processCell.getSingal();//获得分区表单的占用标志信息
        int[] size = processCell.getSize();//获得分区表的大小信息
        Arrays.sort(size);//从小到大排序
        int sizeLength = size.length;
        if (size[sizeLength-1]<commitNeedSize)
        {
            status="error";
            System.out.println("分区失败!");
        }
        for (int i=0;i<6;i++)
        {
            if (size[i]>=commitNeedSize&singal[i].equals("0"))//找到足够大且没有被分配的内存空间
            {
                singal[i]=commitProcessName;
                status="success!";
                System.out.println("分区成功!");
                break;
            }
        }
        return status;
    }

    /**
     * 用来释放
     * @param processName
     * @return
     */
    @RequestMapping("release")
    @ResponseBody
    public String release(String processName)
    {
        releaseName=processName;
        String[] singal = processCell.getSingal();
        for (int i=0;i<6;i++)
        {
            if (singal[i].equals(processName))
            {
                singal[i]="0";
            }
        }
        return "OK";
    }

}
