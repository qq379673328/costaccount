package cn.com.fanrenlee.model.tables;

public class TProResult {
    private Integer id;

    private String proCode;

    private String proName;

    private String deptCode;

    private String deptName;

    private Double costDirect;

    private Double costServe;

    private Double costAll;

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

    public Double getCostDirect() {
        return costDirect;
    }

    public void setCostDirect(Double costDirect) {
        this.costDirect = costDirect;
    }

    public Double getCostServe() {
        return costServe;
    }

    public void setCostServe(Double costServe) {
        this.costServe = costServe;
    }

    public Double getCostAll() {
        return costAll;
    }

    public void setCostAll(Double costAll) {
        this.costAll = costAll;
    }

    public Integer gettJobId() {
        return tJobId;
    }

    public void settJobId(Integer tJobId) {
        this.tJobId = tJobId;
    }
}