package com.jiangyi.os.pojo;

public class CommitDivideInfo {
    private String processName;//需要提交的分区的进程的名称
    private int needSize;//需要的大小

    public String getProcessName() {
        return processName;
    }

    public void setProcessName(String processName) {
        this.processName = processName;
    }

    public int getNeedSize() {
        return needSize;
    }

    public void setNeedSize(int needSize) {
        this.needSize = needSize;
    }
}
