package com.jiangyi.os.service.PCBService;

import com.jiangyi.os.pojo.PCB;
import org.omg.CORBA.PUBLIC_MEMBER;

import java.util.List;

public interface PCBService {
    /**
     * 获得试用优先数算法调度的结果
     * @return
     */
    public List<PCB> getResutlOfUsePriorityShedule();
    /**
     * 添加进程到就绪队列中
     */
    public void addPCB(PCB pcb);

    /**
     * 进行优先数进程调度操作
     */
    public void doPrioritySchedule();

    /**
     * 该方法会删除所有的进程，便于重新开始
     */
    public void ReDo();
}
