package cn.com.fanrenlee.model.tables;

public class TCostaccountJobBaseinfo {
    private Integer id;

    private Float totalWork;

    private Float totalWorkDisinfected;

    private Float totalWorkOutpatient;

    private Integer totalInhos;

    private Integer totalPeople;

    private Integer tCostaccountJobId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Float getTotalWork() {
        return totalWork;
    }

    public void setTotalWork(Float totalWork) {
        this.totalWork = totalWork;
    }

    public Float getTotalWorkDisinfected() {
        return totalWorkDisinfected;
    }

    public void setTotalWorkDisinfected(Float totalWorkDisinfected) {
        this.totalWorkDisinfected = totalWorkDisinfected;
    }

    public Float getTotalWorkOutpatient() {
        return totalWorkOutpatient;
    }

    public void setTotalWorkOutpatient(Float totalWorkOutpatient) {
        this.totalWorkOutpatient = totalWorkOutpatient;
    }

    public Integer getTotalInhos() {
        return totalInhos;
    }

    public void setTotalInhos(Integer totalInhos) {
        this.totalInhos = totalInhos;
    }

    public Integer getTotalPeople() {
        return totalPeople;
    }

    public void setTotalPeople(Integer totalPeople) {
        this.totalPeople = totalPeople;
    }

    public Integer gettCostaccountJobId() {
        return tCostaccountJobId;
    }

    public void settCostaccountJobId(Integer tCostaccountJobId) {
        this.tCostaccountJobId = tCostaccountJobId;
    }
}