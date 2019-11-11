package com.jiangyi.os.mapper.PCBMapper;

import com.jiangyi.os.pojo.PCB;

import java.util.List;

public interface PCBMapper {
    /**
     * 调用优先数算法的存储过程
     */
    public void UsePrioritySchedue();

    /**
     * 获得试用优先数算法调用的结果信息
     * @return
     */
    public List<PCB> getPriorityScheduleResult();

    /**
     * 添加进程信息到thread表（方便以后查询)
     * @param pcb
     */
    public void addPCBToThread(PCB pcb);

    /**
     * 添加进程信息到就绪对列中
     * @param pcb
     */
    public void addPCBToReadyQue(PCB pcb);

    /**
     * 该操作将会清除进程表
     */
    public void deleteThreadTable ();

    /**
     * 该操作将会清除就绪队列
     */
    public void deleteReadyQueTable();
}
