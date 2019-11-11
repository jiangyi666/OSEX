package com.jiangyi.os.controller.PCBController;

import com.jiangyi.os.pojo.PCB;
import com.jiangyi.os.service.PCBService.PCBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("pcb")
public class PCBController {
    @Autowired
    private PCBService pcbService;

    /**
     * 拿到进程信息
     * @param model
     * @return
     */
    @RequestMapping("toUPS")
    public String toUsePrioritySchedule(Model model){
        List<PCB> list = pcbService.getResutlOfUsePriorityShedule();//从thread表里面拿到进程信息
        model.addAttribute("list",list);//给前端界面回显
        return "prioritySchedule";
    }
    /**
     * 添加进程到就绪对列中
     * @param pcb
     * @return
     */
    @RequestMapping("addPCB")
    @ResponseBody
    public String addPCB(PCB pcb){
        pcbService.addPCB(pcb);
        return "OK";
    }

    /**
     * 执行优先数算法
     * @return
     */
    @RequestMapping("doPrioritySchedule")
    public String doPrioritySchedule(){
        pcbService.doPrioritySchedule();
        return "redirect:/pcb/toUPS.action";
    }

    /**
     * 从新操作，删除所有进程信息
     * @return
     */
    @RequestMapping("ReDo")
    public String ReDo(){
        pcbService.ReDo();//执行清除操作
        return "redirect:/pcb/toUPS.action";
    }
}
