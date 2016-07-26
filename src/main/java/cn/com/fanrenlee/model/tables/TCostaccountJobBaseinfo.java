package cn.com.fanrenlee.model.tables;

public class TCostaccountJobBaseinfo {
    private Integer id;

    private Float totalWork;

    private Float totalworkdisinfected;

    private Float totalworkoutpatient;

    private Integer totalinhos;

    private Integer totalpeople;

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

    public Float getTotalworkdisinfected() {
        return totalworkdisinfected;
    }

    public void setTotalworkdisinfected(Float totalworkdisinfected) {
        this.totalworkdisinfected = totalworkdisinfected;
    }

    public Float getTotalworkoutpatient() {
        return totalworkoutpatient;
    }

    public void setTotalworkoutpatient(Float totalworkoutpatient) {
        this.totalworkoutpatient = totalworkoutpatient;
    }

    public Integer getTotalinhos() {
        return totalinhos;
    }

    public void setTotalinhos(Integer totalinhos) {
        this.totalinhos = totalinhos;
    }

    public Integer getTotalpeople() {
        return totalpeople;
    }

    public void setTotalpeople(Integer totalpeople) {
        this.totalpeople = totalpeople;
    }

    public Integer gettCostaccountJobId() {
        return tCostaccountJobId;
    }

    public void settCostaccountJobId(Integer tCostaccountJobId) {
        this.tCostaccountJobId = tCostaccountJobId;
    }
}