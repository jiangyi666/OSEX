package com.jiangyi.os.pojo;

import javax.persistence.criteria.Order;

/**
 * 指令存储对象
 */
public class OrderMemory {
    //指令地址对应的页号
    private int pageNum[] = new int[]{0, 1, 2, 3, 0, 6, 4, 5, 1, 2, 4, 6};
    //页内地址（指令地址）
    private String orderAdd[] = new String[]{"070", "050", "015", "021", "056", "040"
            , "053", "023", "037", "078", "001", "084"};

    public int[] getPageNum() {
        return pageNum;
    }

    public void setPageNum(int[] pageNum) {
        this.pageNum = pageNum;
    }

    public String[] getOrderAdd() {
        return orderAdd;
    }

    public void setOrderAdd(String[] orderAdd) {
        this.orderAdd = orderAdd;
    }

}
