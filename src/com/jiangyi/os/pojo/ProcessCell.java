package com.jiangyi.os.pojo;

public class ProcessCell {
    //分区号
    private  int dividedNum[]=new int[]{1,2,3,4,5,6};
    //起始地址(省略k)
    private int startAddress[]=new int[]{8,16,32,48,64,96};
    //长度(省略k)
    private int size[]=new int[]{8,16,16,16,32,32};
    //占用标志,字符型
    private String singal[]=new String[]{"0","job1","0","0","job2","0"};

    public int[] getDividedNum() {
        return dividedNum;
    }

    public void setDividedNum(int[] dividedNum) {
        this.dividedNum = dividedNum;
    }

    public int[] getStartAddress() {
        return startAddress;
    }

    public void setStartAddress(int[] startAddress) {
        this.startAddress = startAddress;
    }

    public int[] getSize() {
        return size;
    }

    public void setSize(int[] size) {
        this.size = size;
    }

    public String[] getSingal() {
        return singal;
    }

    public void setSingal(String[] singal) {
        this.singal = singal;
    }
}
