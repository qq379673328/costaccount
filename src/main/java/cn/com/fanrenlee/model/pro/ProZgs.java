package cn.com.fanrenlee.model.pro;

/**
 * 项目总工时
 * @author Lizy
 *
 */
public class ProZgs {

	private Double ys;
	private Double hs;
	private Double jys;
	private Double qt;
	public Double getYs() {
		return ys == null ? 0 : ys;
	}
	public void setYs(Double ys) {
		this.ys = ys;
	}
	public Double getHs() {
		return hs == null ? 0 : hs;
	}
	public void setHs(Double hs) {
		this.hs = hs;
	}
	public Double getJys() {
		return jys == null ? 0 : jys;
	}
	public void setJys(Double jys) {
		this.jys = jys;
	}
	public Double getQt() {
		return qt == null ? 0 : qt;
	}
	public void setQt(Double qt) {
		this.qt = qt;
	}
	
	public Double getAll(){
		return getYs() + getHs() + getJys() + getQt();
	}
	
}
