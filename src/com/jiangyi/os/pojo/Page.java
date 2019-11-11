package com.jiangyi.os.pojo;

/**
 * 这是页面表对象
 */
public class Page {
    //页号
    private int pageNum[]=new int[]{0,1,2,3,4,5,6};
    //标志
    private int flag[]=new int[]{1,1,1,1,0,0,0};
    //主存块号
    private int blockNum[]=new int[]{5,8,9,1,6,7,4};
    //磁盘位置
    private String[] address =new String[]{"011","012","013","021","022",
                                            "023","121"};

    public int[] getPageNum() {
        return pageNum;
    }

    public void setPageNum(int[] pageNum) {
        this.pageNum = pageNum;
    }

    public int[] getFlag() {
        return flag;
    }

    public void setFlag(int[] flag) {
        this.flag = flag;
    }

    public int[] getBlockNum() {
        return blockNum;
    }

    public void setBlockNum(int[] blockNum) {
        this.blockNum = blockNum;
    }

    public String[] getAddress() {
        return address;
    }

    public void setAddress(String[] address) {
        this.address = address;
    }
}
