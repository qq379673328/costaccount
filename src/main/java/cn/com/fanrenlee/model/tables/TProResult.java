package cn.com.fanrenlee.model.tables;

public class TProResult {
    private Integer id;

    private String proCode;

    private String proName;

    private String deptCode;

    private String deptName;

    private Float costDirect;

    private Float costServe;

    private Float costAll;

    private Integer tJobId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProCode() {
        return proCode;
    }

    public void setProCode(String proCode) {
        this.proCode = proCode == null ? null : proCode.trim();
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName == null ? null : proName.trim();
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode == null ? null : deptCode.trim();
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public Float getCostDirect() {
        return costDirect;
    }

    public void setCostDirect(Float costDirect) {
        this.costDirect = costDirect;
    }

    public Float getCostServe() {
        return costServe;
    }

    public void setCostServe(Float costServe) {
        this.costServe = costServe;
    }

    public Float getCostAll() {
        return costAll;
    }

    public void setCostAll(Float costAll) {
        this.costAll = costAll;
    }

    public Integer gettJobId() {
        return tJobId;
    }

    public void settJobId(Integer tJobId) {
        this.tJobId = tJobId;
    }
}