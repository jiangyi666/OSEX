package com.jiangyi.os.pojo;

/**
 * 提交的指令对象
 * 这个也是需要显示出来的内容
 */
public class CommitOrder implements Comparable<CommitOrder> {
    //提交的指令的页号(这个需要通过提交的指令的地址来获得)
    private int pageNum;
    //提交的指令的物理块号
    private int blockNum;
    //提交的指令的标志位
    private int flag;
    //外存地址
    private String address;

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getBlockNum() {
        return blockNum;
    }

    public void setBlockNum(int blockNum) {
        this.blockNum = blockNum;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public int compareTo(CommitOrder commitOrder) {
        if (Integer.valueOf(this.address )< Integer.valueOf(commitOrder.address)) {
            return -1;
        }

        if (Integer.valueOf(this.address )> Integer.valueOf(commitOrder.address)) {
            return 1;
        }
        return 0;
    }
}
