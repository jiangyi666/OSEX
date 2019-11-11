package com.jiangyi.os.controller.BankerController;

import com.jiangyi.os.Util.Banker.DistributeUtil;
import com.jiangyi.os.Util.Banker.Safety;
import com.jiangyi.os.pojo.CommitResource;
import com.jiangyi.os.pojo.ProcessResource;
import org.apache.tools.ant.taskdefs.optional.script.ScriptDef;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static com.jiangyi.os.Util.Banker.Safety.checkSafety;

@Controller
@RequestMapping("getResource")
public class ResourceScheduleController {

    ProcessResource processResource = new ProcessResource();
    CommitResource backResource=new CommitResource();//用来回显的
    @RequestMapping("get")
    public String getResource(Model model){
        model.addAttribute("resource",processResource);
        model.addAttribute("backResource",backResource);
        return "Resource";
    }
    @RequestMapping("getSafetyInfo")
    @ResponseBody
    public String getSafetyInfo(){
        //检查安全性
        String Is_Safety = Safety.checkSafety(processResource);
        if (Is_Safety.equals("true"))
        {
            return "true";
        }else {
            return "false";
        }
    }

    @RequestMapping("distribute")
    @ResponseBody
    public CommitResource distributeResource(CommitResource resource,Model model) {
        int aResource = resource.getAResource();//请求的A类资源数量
        int bResource = resource.getBResource();//请求的B类资源的数量
        int cResource = resource.getCResource();//请求的C类资源的数量
        int request[]=new int[]{aResource,bResource,cResource};//加入到请求向量中
        int chooseProcess = resource.getChooseProcess();//请求的进程下标
        //调用方法进行分发资源
        String status = DistributeUtil.distributeResource(processResource, request, chooseProcess);//获得分发的状态
        resource.setStatus(status);
        backResource.setAResource(aResource);
        backResource.setBResource(bResource);
        backResource.setCResource(cResource);
        backResource.setChooseProcess(chooseProcess);
        return resource;
    }




    public static void main(String[] args) {
        ProcessResource processResource = new ProcessResource();
        checkSafety(processResource);
    }
}
