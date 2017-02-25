package cn.com.fanrenlee.model.tables;

public class TProDicDept {
    private Integer id;

    private String proCode;

    private String proName;

    private String deptCode;

    private String deptName;

    private Integer tDeptId;

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

    public Integer gettDeptId() {
        return tDeptId;
    }

    public void settDeptId(Integer tDeptId) {
        this.tDeptId = tDeptId;
    }

}