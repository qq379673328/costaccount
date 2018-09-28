package cn.com.fanrenlee.model.tables;

import java.util.Date;

public class TCostaccountJob {
    private Integer id;

    private String jobDesc;

    private Integer tHosId;
    
    private String hosCode;

    private String hosName;

    private Date createTime;

    private Date updateTime;

    private Date execTimeStart;

    private Integer costtime;

    private Date execTimeEnd;

    private String state;
    
    private String year;
    
    private String type;
    
    private String halfType;
    
    private String createUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJobDesc() {
        return jobDesc;
    }

    public void setJobDesc(String jobDesc) {
        this.jobDesc = jobDesc == null ? null : jobDesc.trim();
    }

    public Integer gettHosId() {
        return tHosId;
    }

    public void settHosId(Integer tHosId) {
        this.tHosId = tHosId;
    }

    public String getHosCode() {
        return hosCode;
    }

    public void setHosCode(String hosCode) {
        this.hosCode = hosCode == null ? null : hosCode.trim();
    }

    public String getHosName() {
        return hosName;
    }

    public void setHosName(String hosName) {
        this.hosName = hosName == null ? null : hosName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getExecTimeStart() {
        return execTimeStart;
    }

    public void setExecTimeStart(Date execTimeStart) {
        this.execTimeStart = execTimeStart;
    }

    public Integer getCosttime() {
        return costtime;
    }

    public void setCosttime(Integer costtime) {
        this.costtime = costtime;
    }

    public Date getExecTimeEnd() {
        return execTimeEnd;
    }

    public void setExecTimeEnd(Date execTimeEnd) {
        this.execTimeEnd = execTimeEnd;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getHalfType() {
		return halfType;
	}

	public void setHalfType(String halfType) {
		this.halfType = halfType;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
    
    
}