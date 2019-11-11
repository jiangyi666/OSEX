package com.jiangyi.os.service.PCBService;

import com.jiangyi.os.mapper.PCBMapper.PCBMapper;
import com.jiangyi.os.pojo.PCB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PCBServiceImpl implements PCBService {

    @Autowired
    private PCBMapper pcbMapper;

    /**
     * 获得试用优先数算法进行进程调度的结果
     * @return
     */
    @Override
    public List<PCB> getResutlOfUsePriorityShedule() {
        return pcbMapper.getPriorityScheduleResult();//从结果表里拿出数据
    }
    /**
     * 添加进程到就绪队列中
     */
    @Override
    public void addPCB(PCB pcb) {
        pcbMapper.addPCBToReadyQue(pcb);//把进程加入到就绪队列中
        pcbMapper.addPCBToThread(pcb);//在进程表里面也要同时加入方便以后修改查询到结果
    }
    /**
     * 进行优先数进程调度操作
     */
    @Override
    public void doPrioritySchedule() {
        pcbMapper.UsePrioritySchedue();//调用存储过程来完成
    }
    /**
     * 该方法会删除所有的进程，便于重新开始
     */
    @Override
    public void ReDo() {
        pcbMapper.deleteReadyQueTable();
        pcbMapper.deleteThreadTable();
    }

}
