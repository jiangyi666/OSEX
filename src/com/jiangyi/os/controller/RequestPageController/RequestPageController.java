package com.jiangyi.os.controller.RequestPageController;

import com.jiangyi.os.pojo.CommitOrder;
import com.jiangyi.os.pojo.OrderMemory;
import com.jiangyi.os.pojo.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * 请求页面存储管理
 */
@Controller
@RequestMapping("requestPage")
public class RequestPageController {
    //页面队列(其实就是内存里面的情况)
    //使用offer(入队),poll(出队)
    Queue pageQueue=new LinkedList();
    //指令表
    OrderMemory orderMemory=new OrderMemory();
    //页面表
    Page page=new Page();
    //提示
    String tip=null;
    //需要输入的指令队列
    String orderAddToInput[] = new String[]{"070", "050", "015", "021", "056", "040"
            , "053", "023", "037", "078", "001", "084"};
    //用来获得指令
    int p=0;

    /**
     * 前端提交一个指令地址就可以了
     * 使用mdoel来回显数据
     * @return
     */
    @RequestMapping("get")
    @ResponseBody
    public String getPage(String commitOrderAdd) {
        boolean isInMainMemory=false;//该页面是否在主存中,默认false
        String[] orderAdd = orderMemory.getOrderAdd();//获得指令流中的指令地址
        int[] pageNumOfMemory = orderMemory.getPageNum();//获得指令流中的页号
        String[] address = page.getAddress();//页表中的外存地址
        int[] blockNum = page.getBlockNum();//页表中的主存块号
        int[] pageNumOfPage = page.getPageNum();//页表中的页面号
        int[] flag = page.getFlag();//页表中的标志
        CommitOrder commitOrder = new CommitOrder();//创建一个新的提交指令对象
        for (int i = 0; i < orderAdd.length; i++) {
            //下面来找到指令地址对应的页面号
            if (orderAdd[i].equals(commitOrderAdd)) {
                commitOrder.setPageNum(pageNumOfMemory[i]);//把页号加入对象中
                break;
            }
        }
        for (int i = 0; i < pageNumOfPage.length; i++) {
            //下面根据页面号来获得页表中的其他信息
            if (pageNumOfPage[i] == commitOrder.getPageNum()) {
                commitOrder.setAddress(address[i]);//把外存地址存进对象
                commitOrder.setBlockNum(blockNum[i]);//把物理块号存进对象
                commitOrder.setFlag(flag[i]);//把标志存进对象中
                break;
            }

        }
        //*****************需要先判断该页在不在主存******************
        Iterator it = pageQueue.iterator();
        while (it.hasNext()){
            CommitOrder pageObject =(CommitOrder) it.next();
            if(pageObject.getPageNum()==commitOrder.getPageNum()){
                //该页号有在主存中
                isInMainMemory=true;//在主存中就将标志为改为true
                System.out.println("此指令页号为"+commitOrder.getPageNum()+"该页面已在主存中！");
                tip="此指令页号为"+commitOrder.getPageNum()+"该页面已在主存中！";
                break;
            }
        }
        //该页面不在主存中
        if (!isInMainMemory){
            //就判断主存中有无空白页面,默认是4个
            if (pageQueue.size() > 3)
            {
                //说明没有空白了，就需要使用FIFO来淘汰一页
                CommitOrder pollPage =(CommitOrder) pageQueue.poll();
                //再调入当前所需页
                pageQueue.offer(commitOrder);
                System.out.println("此页面号为"+commitOrder.getPageNum()+","+"此页面已调入内存,"+"页面号为"+
                        pollPage.getPageNum()+"的页面被置换出来");
                tip="此页面号为"+commitOrder.getPageNum()+","+"此页面已调入内存,"+"页面号为"+
                        pollPage.getPageNum()+"的页面被置换出来";
            }else {
                //如果主存中有空白，就直接调入
                pageQueue.offer(commitOrder);
                System.out.println("此指令页号为"+commitOrder.getPageNum()+",此页面已被调入内存中！");
                tip="此指令页号为"+commitOrder.getPageNum()+",此页面已被调入内存中！";
            }
        }
        p++;//取下一个指令
        return "OK";
    }

    @RequestMapping("display")
    public String display(Model model){
        //****如果想直接输出队列里面的内容，模拟FIFO算法的话，就不用下面的流程，直接返回给*****
        //****前端pageQueue；***如果需要模拟在内存中的实时状态，即需要外存地址从小到大排序****
        //***就需要下面的操作，而后返回复制后的list********
        List list=new ArrayList<>();//新建立一个链表来储存队列里面的信息
        Iterator it = pageQueue.iterator();
        while(it.hasNext())
        {
            CommitOrder next = (CommitOrder)it.next();
            list.add(next);
        }
        Collections.sort(list);//对里面的对象按address从小到大排序
        //***********返回的内容看情况，可选list/pageQueue**********
        model.addAttribute("pageQueue",list);//把主存中的页面信息回显给前端显示
        model.addAttribute("tip",tip);//把提示信息回显给前端
        if (p<orderAddToInput.length){//如果指令还没有到达最后一个
            model.addAttribute("orderToInput",orderAddToInput[p]);//把需要的指令返回给前端用来输入。。。
            System.out.println("执行指令的地址为："+orderAddToInput[p]);
        }else {//指令到达最后一个
            model.addAttribute("orderToInput","指令已经到达最后一个！");
            System.out.println("指令已经到达最后一个！");
        }

        return "FIFO";
    }


}
