package cn.com.fanrenlee.model.tables;

public class TProDic {
    private Integer id;

    private String proCode;

    private String proName;

    private String unit;

    private Float priceCurrent;

    private Float costTime;

    private Integer peopleCountDoctor;

    private Integer peopleCountNurse;

    private Integer peopleCountTech;

    private Float costLowLevel;

    private Float costOnce;

    private Integer tHospitalId;

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

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public Float getPriceCurrent() {
        return priceCurrent;
    }

    public void setPriceCurrent(Float priceCurrent) {
        this.priceCurrent = priceCurrent;
    }

    public Float getCostTime() {
        return costTime;
    }

    public void setCostTime(Float costTime) {
        this.costTime = costTime;
    }

    public Integer getPeopleCountDoctor() {
        return peopleCountDoctor;
    }

    public void setPeopleCountDoctor(Integer peopleCountDoctor) {
        this.peopleCountDoctor = peopleCountDoctor;
    }

    public Integer getPeopleCountNurse() {
        return peopleCountNurse;
    }

    public void setPeopleCountNurse(Integer peopleCountNurse) {
        this.peopleCountNurse = peopleCountNurse;
    }

    public Integer getPeopleCountTech() {
        return peopleCountTech;
    }

    public void setPeopleCountTech(Integer peopleCountTech) {
        this.peopleCountTech = peopleCountTech;
    }

    public Float getCostLowLevel() {
        return costLowLevel;
    }

    public void setCostLowLevel(Float costLowLevel) {
        this.costLowLevel = costLowLevel;
    }

    public Float getCostOnce() {
        return costOnce;
    }

    public void setCostOnce(Float costOnce) {
        this.costOnce = costOnce;
    }

    public Integer gettHospitalId() {
        return tHospitalId;
    }

    public void settHospitalId(Integer tHospitalId) {
        this.tHospitalId = tHospitalId;
    }
}