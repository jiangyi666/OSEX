package com.jiangyi.os.pojo;
//用来获得前端提交的资源信息
public class CommitResource {
    private int AResource;
    private int BResource;
    private int CResource;
    private int chooseProcess;
    private String status;//状态，这个不是提交的，是用来回显用到的！

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAResource() {
        return AResource;
    }

    public void setAResource(int AResource) {
        this.AResource = AResource;
    }

    public int getBResource() {
        return BResource;
    }

    public void setBResource(int BResource) {
        this.BResource = BResource;
    }

    public int getCResource() {
        return CResource;
    }

    public void setCResource(int CResource) {
        this.CResource = CResource;
    }

    public int getChooseProcess() {
        return chooseProcess;
    }

    public void setChooseProcess(int chooseProcess) {
        this.chooseProcess = chooseProcess;
    }
}
